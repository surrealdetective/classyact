class Survey < ActiveRecord::Base
  attr_accessible :semester, :subject, :user_id, :password, :size

  belongs_to :user
  has_many :students
  has_many :questions
  has_many :choices, :through => :questions
  has_many :responses, :through => :choices

  has_secure_password
  validates :size, :presence => true

  require 'modules/questionable.rb'
  include Questionable

  #Current Ranges for Questions by Index
  THINKING = 0..7
  META_THINKING = 8..10
  EXPECTATIONS = 11..18
  META_EXPECTATIONS = 19..21
  INTERACTIONS = 22..29
  META_INTERACTIONS = 30..32
  DISCIPLINE = 33..40
  META_DISCIPLINE = 41..43
  WILLING = 44..51
  META_WILLING = 52..54
  DIRECTION = 55..62
  META_DIRECTION = 63..65
  META_META = 66..68
  # {:meta_import => 66, :meta_improve => 67, :meta_perform => 68}

  def method_missing(m, *args)
    method = m.to_s
    # build_: [thinking, interactions, willing, expectations, discipline, direction, overview] questions
    if method.start_with?("build_")
      factor   = method[6..-1].to_sym
      if self.question_categories.include?(factor)
        q_type = "fill_question_with_#{args[1]}_choices".to_sym
        PEDAGOGY_GAP_QUESTIONS[factor].flatten.each_with_index do |sub_factor_qs, index|
          next if index.even?
          sub_factor_qs.each { |question| self.send(q_type, :content => question) }
        end
        build_meta if args[0]
      else
        raise ArgumentError, "Can't find #{factor}"
      end
    # fill_question_with: [agree, meta, frequency, overview] : choices
    elsif method.start_with?("fill_question_with_")
      choice_builder = "build_#{method[19..-9]}_choices".to_sym
      q              = self.questions.build(args[0])
      q.send(choice_builder)
    else
      super
    end
  end
  
  #Collects the values of all student responses (useless for meta questions)
  def student_score(student)
    Choice.joins(:responses)
    .where("responses.student_id" => student.id)
    .collect {|choice| choice.value}
  end

  #Calculates the a student's avg scores given an array of all their responses
  def student_factor_scores(student_response)
    scores = {}
    scores[:thinking] = student_response[THINKING].inject{|sum, element| sum + element} / 8.0
    scores[:expectations] = student_response[EXPECTATIONS].inject{|sum, element| sum + element} / 8.0
    scores[:interactions] = student_response[INTERACTIONS].inject{|sum, element| sum + element} / 8.0
    scores[:discipline] = student_response[DISCIPLINE].inject{|sum, element| sum + element} / 8.0
    scores[:willing] = student_response[WILLING].inject{|sum, element| sum + element} / 8.0
    scores[:direction] = student_response[DIRECTION].inject{|sum, element| sum + element} / 8.0
    return scores
  end

  #Finds the avg scores by factor for a single student, given a student
  def find_student_factor_scores(student)
    @score_totals = self.student_score(student)
    self.student_factor_scores(@score_totals)
  end

  def to_const(factor)
    case factor
    when :thinking
      THINKING
    when :expectations
      EXPECTATIONS
    when :interactions
      INTERACTIONS
    when :discipline
      DISCIPLINE
    when :willing
      WILLING
    when :direction
      DIRECTION
    end
  end

  def sub_factors(factor)
    case factor
    when :thinking
      ['Necessary Skills', 'Talent Leverage', 'Life Decisions', 'Value-add Skills']
    when :expectations
      ['Observing', 'Challeng-ing', 'Comprehensiveness', 'Durability']
    when :interactions
      ['Outside-inside', 'Inside-inside', 'Inside-outside', 'Outside-outside']
    when :discipline
      ['Planned', 'Scaffold-ed', 'Focused', 'Scoped']
    when :willing
      ['Timely', 'Substan-tive', 'Possibility to Act', 'Action']
    when :direction
      ['Comfort', 'Curiosity', 'Activity', 'Order']
    end
  end

  def factors
    ["thinking", "interactions", "willing", "discipline", "direction", "expectations"]
  end

  def question_categories
    [:thinking, :interactions, :willing, :discipline, :direction, :expectations, :overview]
  end

  #Finds sub factor scores per factor
  def find_factor_sub_scores(student, factor)
    scores = self.student_score(student)
    avg_subfactors = {}
    avg_subfactors[:first] = scores[self.to_const(factor)][0..1].inject{ |sum, element| sum + element} / 2.0
    avg_subfactors[:second] = scores[self.to_const(factor)][2..3].inject{ |sum, element| sum + element} / 2.0
    avg_subfactors[:third] = scores[self.to_const(factor)][4..5].inject{ |sum, element| sum + element} / 2.0
    avg_subfactors[:fourth] = scores[self.to_const(factor)][6..7].inject{ |sum, element| sum + element} / 2.0
    avg_subfactors
  end

  def find_class_sub_scores(factor)
    class_scores = {:first => 0, :second => 0, :third => 0, :fourth => 0}
    incomplete = 0
    self.students.each do |student|
      if student.responses.count == self.questions.count
        scores = self.find_factor_sub_scores(student, factor)
        class_scores[:first] += scores[:first]
        class_scores[:second] += scores[:second]
        class_scores[:third] += scores[:third] 
        class_scores[:fourth] += scores[:fourth]
      else
        incomplete += 1
      end
    end
    student_count = self.students.count.to_f - incomplete
    if student_count > 0
      class_scores.merge(class_scores){|key, oldval, newval| (oldval/student_count).round(2)}
    else
      class_scores
    end
  end

  def find_class_sub_scores_for_view(factor)
    sub_scores = self.find_class_sub_scores(factor)
    [sub_scores[:first], sub_scores[:second], sub_scores[:third], sub_scores[:fourth]]
  end

  #there will be a possible of 8 choices
  def find_class_meta_sub_scores(factor, lens)
    #Find the index of the correct question from student.responses == survey.questions
    lenses = {:import => to_const(factor).last + 1, :improve => to_const(factor).last + 2, :perform => to_const(factor).last + 3}
    
    #Correspond the choice_id to the correct factor.
    factor_selection = {0 => :first, 1 => :first, 2 => :second, 3 => :second, 4 => :third, 5 => :third, 6 => :fourth, 7 => :fourth}
    
    #Track the meta count 
    scores = {:first => 0, :second => 0, :third => 0, :fourth => 0}
    students = self.students
    incomplete = 0
    students.each do |student|
      if student.responses.count == self.questions.count
        index_of_lens = self.questions[lenses[lens]].choices.index(Choice.find_by_id(student.responses[lenses[lens]].choice_id))
        scores[factor_selection[index_of_lens]] += 1
      else
        incomplete += 1
      end
    end
    student_count = students.count.to_f - incomplete
    if student_count > 0
      scores.merge(scores){ |key, oldval, newval| ((100*oldval/student_count)/5.00).round(2)}
    else
      scores
    end
  end

  def find_class_meta_sub_scores_for_view(factor, lens)
    sub_scores = self.find_class_meta_sub_scores(factor, lens)
    [sub_scores[:first], sub_scores[:second], sub_scores[:third], sub_scores[:fourth]]
  end

  #Finds the avg scores for each class of students
  def find_class_avg_scores
    class_scores = {:thinking => 0, :expectations => 0, :interactions => 0, :discipline => 0, :willing => 0, :direction => 0}
    #add up the sum of all student factor scores
    incomplete = 0
    self.students.each do |student|
      if student.responses.count == self.questions.count
        scores = self.find_student_factor_scores(student)
        class_scores[:thinking] += scores[:thinking]
        class_scores[:expectations] += scores[:expectations]
        class_scores[:interactions] += scores[:interactions]
        class_scores[:discipline] += scores[:discipline]
        class_scores[:willing] += scores[:willing]
        class_scores[:direction] += scores[:direction] 
      else
        incomplete += 1
      end
    end
    student_count = self.students.count - incomplete
    if student_count > 0
      class_scores.merge(class_scores){|key, oldval, newval| oldval/student_count.to_f}
    else
      class_scores
    end
  end

  def find_class_avg_scores_for_view
    all_scores = self.find_class_avg_scores
    [all_scores[:thinking], all_scores[:interactions], all_scores[:direction], all_scores[:expectations], all_scores[:discipline], all_scores[:willing]]
  end
 
 #Finds the meta scores for each class of students
  def find_class_meta_selections(lens)
    lenses = {:import => -3, :improve => -2, :perform => -1}

    factor_selection = {0 => :thinking, 1 => :expectations, 2 => :interactions, 3 => :discipline, 4 => :willing, 5 => :direction}
    scores = {:thinking => 0, :expectations => 0, :interactions => 0, :discipline => 0, :willing => 0, :direction => 0}
    students = self.students
    incomplete = 0
    students.each do |student|
      if student.responses.count == self.questions.count
        index_of_lens = self.questions[lenses[lens]].choices.index(Choice.find_by_id(student.responses[lenses[lens]].choice_id))
        scores[factor_selection[index_of_lens]] += 1
      else
        incomplete += 1
      end
    end
    student_count = students.count - incomplete
    if student_count > 0
      scores.merge(scores){ |key, oldval, newval| ((100*oldval/students.count)/3.3333).round(4)}
    else
      scores
    end
  end

  #Re-formats meta scores for the graph view
  def find_class_meta_selections_for_view(lens)
    all_scores = self.find_class_meta_selections(lens)
    [all_scores[:thinking], all_scores[:interactions], all_scores[:direction], all_scores[:expectations], all_scores[:discipline], all_scores[:willing]]
  end

  #Authenticate for Students
  def self.authenticate(password)
    if self.password_hash == Bcrypt::Engine.hash_secret(password, user.password_salt)
      true
    else
      nil #wrong
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end

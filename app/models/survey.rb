class Survey < ActiveRecord::Base
  attr_accessible :semester, :subject, :user_id

  belongs_to :user
  has_many :students
  has_many :questions

  def populate_questions
    #Thinking Factor:
    thinking_1 = self.build_question_with_agree_choices(:content => "I can read well, write well, do math well, and interact with others well.")
    thinking_2 = self.build_question_with_agree_choices(:content => "My school helps me practice and improve on these skills every day.")
    thinking_3 = self.build_question_with_agree_choices(:content => "My school is committed to building the strengths of each student.")
    thinking_4 = self.build_question_with_agree_choices(:content => "At this school, I have the opportunity to do what I do best every day.")
    thinking_5 = self.build_question_with_agree_choices(:content => "I use what I learn about myself through school to make life decisions.")
    thinking_6 = self.build_question_with_agree_choices(:content => "In the last seven days, I learned something new about myself.")
    thinking_7 = self.build_question_with_agree_choices(:content => "I know that the things I learn in school that are not useful to me now will be useful to me in the future.")
    thinking_8 = self.build_question_with_agree_choices(:content => "I find the things I learn in school that are not useful to me now nonetheless interesting to learn.")
    #question 9
    thinking_9 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "most important" to you.')
    thinking_10 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what "needs most improvement" to you.')
    thinking_11 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "best performing" to you.')

    #Self-expectations Factor:
    #question 12
    expectations_1 = self.build_question_with_agree_choices(:content => "Throughout the school day, I think and do things I do not already know.")
    expectations_2 = self.build_question_with_agree_choices(:content => "I understand why I learn the things I do not already know.")
    expectations_3 = self.build_question_with_agree_choices(:content => "One or both of the following is a challenge for me: what I expect myself to learn through school, or what I am expected to learn through school.")
    expectations_4 = self.build_question_with_agree_choices(:content => "I can identify what it is about learning something that challenges me.")
    expectations_5 = self.build_question_with_agree_choices(:content => "I make sure I completely and fully learn both what is expected of me and what I expect myself to learn.")
    expectations_6 = self.build_question_with_agree_choices(:content => "I know why it is important for me to learn what I learned last week fully and completely, rather than partially and incompletely.")
    expectations_7 = self.build_question_with_agree_choices(:content => "Eighteen months from now, I expect to remember the things I am currently putting a lot of effort into learning.")
    expectations_8 = self.build_question_with_agree_choices(:content => "While I am learning, I place special emphasis on the things I want to remember in the long-run.")
    #question 20
    expectations_9 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "most important" to you.')
    expectations_10 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what "needs most improvement" to you.')
    expectations_11 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "best performing" to you.')

    #Interactions-Factor:
    #question 23
    interactions_1 = self.build_question_with_frequency_choices(:content => "On an average school day, I sit and listen to others talk.")
    interactions_2 = self.build_question_with_frequency_choices(:content => "When I am sitting and listening I feel connected to what is being said or done.")
    interactions_3 = self.build_question_with_frequency_choices(:content => "On the average school day, I make contributions that others understand and react to.")
    interactions_4 = self.build_question_with_frequency_choices(:content => "I care about the contributions that others and I make to our learning experience.")
    interactions_5 = self.build_question_with_frequency_choices(:content => "On the average school day, I find opportunities to express myself, problem-solve, or be creative.")
    interactions_6 = self.build_question_with_frequency_choices(:content => "I find these moments of self-expression satisfying.")
    interactions_7 = self.build_question_with_frequency_choices(:content => "I plan what I am going to do, how I am going to do it, or why I am doing it that way.")
    interactions_8 = self.build_question_with_frequency_choices(:content => "My planning helps me appreciate and value what I do every day.")
    #question 31
    interactions_9 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "most important" to you.')
    interactions_10 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what "needs most improvement" to you.')
    interactions_11 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "best performing" to you.')


    #Self-discipline Factor:
    #question 34
    discipline_1 = self.build_question_with_frequency_choices(:content => "There is a clear connection between what I think I am supposed to be learning through school and what I actually do in school.")
    discipline_2 = self.build_question_with_frequency_choices(:content => "At this school, I have the opportunity to learn by doing what I am supposed to do.")
    discipline_3 = self.build_question_with_frequency_choices(:content => "For knowledge and skills that take more than a day to learn, my daily school activities involve me learning smaller components of these knowledge and skills and putting them together for a fuller understanding.")
    discipline_4 = self.build_question_with_frequency_choices(:content => "I can explain all parts of a complex topic and perform all parts of a complex skill.")
    discipline_5 = self.build_question_with_frequency_choices(:content => "During school I feel myself focusing on the learning task at hand.")
    discipline_6 = self.build_question_with_frequency_choices(:content => "I find that I understand topics more deeply when I focus more intensely.")
    discipline_7 = self.build_question_with_frequency_choices(:content => "I know how to use the learning gained from any given learning activity for non-school purposes.")
    discipline_8 = self.build_question_with_frequency_choices(:content => "In any given week, I use something I learned this school year outside of school.")
    #question 42
    discipline_9 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "most important" to you.')
    discipline_10 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what "needs most improvement" to you.')
    discipline_11 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "best performing" to you.')

    #Willing Factor:
    #question 45
    willing_1 = self.build_question_with_frequency_choices(:content => "When I say or do something, I get some feedback while my rationale for saying or doing those things is still clear in my mind.")
    willing_2 = self.build_question_with_frequency_choices(:content => "The feedback I get comes at times when I am ready to consider it.")
    willing_3 = self.build_question_with_frequency_choices(:content => "The feedback I receive is relevant and useful to me.")
    willing_4 = self.build_question_with_frequency_choices(:content => "The feedback I receive makes me think about what I did or how I will do things in the future.")
    willing_5 = self.build_question_with_frequency_choices(:content => "I am given opportunities to use what I learn from feedback to do something new or improve what I've already done.")
    willing_6 = self.build_question_with_frequency_choices(:content => "When I am given opportunities to use what I learn from feedback, I apply extra effort towards learning that skill or topic.")
    willing_7 = self.build_question_with_frequency_choices(:content => "I change what I am doing, how I do it, or why I am doing it based on the feedback that I receive.")
    willing_8 = self.build_question_with_frequency_choices(:content => "After I adjust my learning in response to feedback, I continue thinking about how else I can improve or apply this learning.")
    #question 53
    willing_9 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "most important" to you.')
    willing_10 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what "needs most improvement" to you.')
    willing_11 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "best performing" to you.')

    #Self-Direction Factor:
    #question 56
    direction_1 = self.build_question_with_agree_choices(:content => "I have control over how I dress; where and how I sit, talk, and stand; and where and how I interact with others.")
    direction_2 = self.build_question_with_agree_choices(:content => "I feel more like myself when I choose how I dress; where and how I sit, talk, stand; and where and how I interact with others.")
    direction_3 = self.build_question_with_agree_choices(:content => "At this school, I have the opportunity to follow my curiosity.")
    direction_4 = self.build_question_with_agree_choices(:content => "After I follow my curiosity, I have a better sense of what interests me. ")
    direction_5 = self.build_question_with_agree_choices(:content => "In any given week, I decide how I will learn something.")
    direction_6 = self.build_question_with_agree_choices(:content => "When I choose how I learn something, I improve my understanding of how I learn in general.")
    direction_7 = self.build_question_with_agree_choices(:content => "I have a voice over school rules, such as how class is conducted, how and why students are punished and rewarded, or on the overall organization of the school.")
    direction_8 = self.build_question_with_agree_choices(:content => "When I help decide which rules to follow, in any situation, I understand the purpose of the rules.")
    #question 64
    direction_9 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "most important" to you.')
    direction_10 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what "needs most improvement" to you.')
    direction_11 = self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "best performing" to you.')
    #question 66 above.

    #Overview Questions:
    #question 67
    overview_1 = self.build_question_with_overview_choices(:content => 'Of the above 6 factors, select what is "most important" to you.')
    overview_1 = self.build_question_with_overview_choices(:content => 'Of the above 6 factors, select what is "needs most improvement" to you.')
    overview_1 = self.build_question_with_overview_choices(:content => 'Of the above 6 factors, select what is "best performing" to you.')
    #question 69 above
  end

  def build_question_with_agree_choices(q_content)
    q = self.questions.build(q_content)
    q.build_agree_choices
  end

  def build_question_with_meta_choices(q_content)
    q = self.questions.build(q_content)
    q.build_meta_choices
  end

  def build_question_with_frequency_choices(q_content)
    q = self.questions.build(q_content)
    q.build_frequency_choices
  end

  def build_question_with_overview_choices(q_content)
    q = self.questions.build(q_content)
    q.build_overview_choices
  end

end

module Listable
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

  #To Access Ranges
  def to_const(factor)
    # factor.upcase.constantize
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

  def choice_types
    ['agree', 'meta', 'frequency', 'overview']
  end

end
module Questionable

  PEDAGOGY_GAP_QUESTIONS = {
    :thinking =>
      { :necessary_skills => [
          "I can read well, write well, do math well, and interact with others well.",
          "My school helps me practice and improve on these skills every day."
          ],
        :talent_leverage => [
          "My school is committed to building the strengths of each student.",
          "At this school, I have the opportunity to do what I do best every day."
          ],
        :life_decisions => [
          "I use what I learn about myself through school to make life decisions.",
          "In the last seven days, I learned something new about myself."
          ],
        :value_add_skills => [
          "I know that the things I learn in school that are not useful to me now will be useful to me in the future.",
          "I find the things I learn in school that are not useful to me now nonetheless interesting to learn."
          ]
      },
    :expectations => 
      { :observing => [
          "Throughout the school day, I think and do things I do not already know.",
          "I understand why I learn the things I do not already know."
          ],
        :challenging => [
          "One or both of the following is a challenge for me: what I expect myself to learn through school, or what I am expected to learn through school.",
          "I can identify what it is about learning something that challenges me."
          ],
        :comprehensiveness => [
          "I make sure I completely and fully learn both what is expected of me and what I expect myself to learn.",
          "I know why it is important for me to learn what I learned last week fully and completely, rather than partially and incompletely."
          ],
        :durability => [
          "Eighteen months from now, I expect to remember the things I am currently putting a lot of effort into learning.",
          "While I am learning, I place special emphasis on the things I want to remember in the long-run."
        ]
      },
    :direction => 
      {
        :comfort => [
          "I have control over how I dress; where and how I sit, talk, and stand; and where and how I interact with others.",
          "I feel more like myself when I choose how I dress; where and how I sit, talk, stand; and where and how I interact with others."
          ],
        :curiosity => [
          "At this school, I have the opportunity to follow my curiosity.",
          "After I follow my curiosity, I have a better sense of what interests me. "
          ],
        :activity => [
          "In any given week, I decide how I will learn something.",
          "When I choose how I learn something, I improve my understanding of how I learn in general."
          ],
        :order => [
          "I have a voice over school rules, such as how class is conducted, how and why students are punished and rewarded, or on the overall organization of the school.",
          "When I help decide which rules to follow, in any situation, I understand the purpose of the rules."
        ]
      },
    :interactions => 
      { 
        :outside_inside => [
          "On an average school day, I sit and listen to others talk.",
          "When I am sitting and listening I feel connected to what is being said or done."
          ],
        :inside_inside => [
          "On the average school day, I make contributions that others understand and react to.",
          "I care about the contributions that others and I make to our learning experience."
          ],
        :inside_outside => [
          "On the average school day, I find opportunities to express myself, problem-solve, or be creative.",
          "I find these moments of self-expression satisfying."
          ],
        :outside_outside => [
          "I plan what I am going to do, how I am going to do it, or why I am doing it that way.",
          "My planning helps me appreciate and value what I do every day."
        ]
      },
    :discipline => 
      {
        :planned => [
          "There is a clear connection between what I think I am supposed to be learning through school and what I actually do in school.",
          "At this school, I have the opportunity to learn by doing what I am supposed to do."
        ],
        :scaffolded => [
          "For knowledge and skills that take more than a day to learn, my daily school activities involve me learning smaller components of these knowledge and skills and putting them together for a fuller understanding.",
          "I can explain all parts of a complex topic and perform all parts of a complex skill."
        ],
        :focused => [
          "During school I feel myself focusing on the learning task at hand.",
          "I find that I understand topics more deeply when I focus more intensely."
        ],
        :scoped => [
          "I know how to use the learning gained from any given learning activity for non-school purposes.",
          "In any given week, I use something I learned this school year outside of school."
        ]
      },
    :willing => 
      {
        :timely => [
          "When I say or do something, I get some feedback while my rationale for saying or doing those things is still clear in my mind.",
          "The feedback I get comes at times when I am ready to consider it."        
        ],
        :substantive => [
          "The feedback I receive is relevant and useful to me.",
          "The feedback I receive makes me think about what I did or how I will do things in the future."
        ],
        :possibility_to_act => [
          "I am given opportunities to use what I learn from feedback to do something new or improve what I've already done.",
          "When I am given opportunities to use what I learn from feedback, I apply extra effort towards learning that skill or topic."
        ],
        :action => [
          "I change what I am doing, how I do it, or why I am doing it based on the feedback that I receive.",
          "After I adjust my learning in response to feedback, I continue thinking about how else I can improve or apply this learning."
        ]
      },
    :overview => 
      {
        :most_important => ['Of the above 6 factors, select what is "most important" to you.'],
        :needs_most_improvement => ['Of the above 6 factors, select what is "needs most improvement" to you.'],
        :most_excellent => ['Of the above 6 factors, select what is "most excellent" to you.']
      }
    }



    
    
  def build_meta
    self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "most important" to you.')
    self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what "needs most improvement" to you.')
    self.build_question_with_meta_choices(:content => 'Of the above 8 questions, select what is "most excellent" to you.')
  end

end
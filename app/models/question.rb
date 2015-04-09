class Question < ActiveRecord::Base
  validates :poll_id, :text,  presence: true

  belongs_to(
    :poll,
    class_name: "Poll",
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :answer_choices,
    class_name: "AnswerChoice",
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )
  # self.responses = self.answer_choices.responses

  def results
    answer_with_count = answer_choices
      .select("answer_choices.*, count(responses.question_id) as num")
      .joins("LEFT JOIN responses ON answer_choices.id = responses.answer_choice_id")
      .group("answer_choices.text").count(:responses)
  end
end

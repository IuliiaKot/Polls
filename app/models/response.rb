class Response < ActiveRecord::Base

  validates :user_id, :question_id, :answer_choice_id,  presence: true
  validate :respondent_has_not_already_answered_question

  belongs_to(
    :respondent,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  def sibling_response
    #byebug
    question.responses.where("responses.id != ? OR ? is NULL", self.id, self.id)
  end

  def respondent_has_not_already_answered_question
    if sibling_response.exists?(user_id: self.user_id)
      errors[:user_id] << "Already responded to question"
    end
  end
end

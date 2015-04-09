class User < ActiveRecord::Base
  validates :user_name, presence: true

  has_many(
    :authored_polls,
    class_name: "Poll",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: "Response",
    foreign_key: :user_id,
    primary_key: :id
  )

  def complete_polls
    temp = Poll
      .select("polls.*, COUNT(DISTINCT questions.id) as count" )
      .joins("Left Join questions ON questions.poll_id = polls.id")
      .joins("Left Join responses ON questions.id = responses.question_id")
      .group("polls.id")

    res = Response
        .select("questions.poll_id, COUNT(responses.question_id) as count1")
        .joins("LEFT JOIN questions ON responses.question_id = questions.id")
        .where("responses.user_id = ?", self.id)
        .group("questions.poll_id")


    #   Select polls.*, count(distinct questions.id)
    #   from
    #   polls
    #   left join
    #   questions on questions.poll_id = polls.id
    #   left join responses On questions.id = responses.question_id
    #   Group By polls.id
    #
    #
    # Select
    # questions.poll_id, COUNT(responses.question_id) as NUM
    # From
    #   responses
    # Join
    #   questions ON responses.question_id = questions.id
    # Where
    #   responses.user_id = 58
    # Group By
    #   questions.poll_id


  end
end

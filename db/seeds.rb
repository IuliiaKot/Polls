# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
i = User.new(user_name: "Iuliia")
b = User.new(user_name: "Brian")
c = User.new(user_name: "Cecilia")
a = User.new(user_name: "Ana")

i.save!
b.save!
c.save!
a.save!

Poll.delete_all
p = Poll.new(author_id: i.id, title: "What?!")
p1 = Poll.new(author_id: c.id, title: "HUH?!")
p.save!
p1.save!

Question.delete_all
q = Question.new(poll_id: p.id, text: "WHAT AM I DOING?!")
q1 = Question.new(poll_id: p.id, text: "WHERE AM I?!")
q.save!
q1.save!

q2 = Question.new(poll_id: p1.id, text: "DRINK?!")
q2.save!

AnswerChoice.delete_all
a1 = AnswerChoice.new(question_id: q.id, text: "I DONT KNOW")
a2 = AnswerChoice.new(question_id: q.id, text: "BEING A BOSS")

a1.save!
a2.save!

a3 = AnswerChoice.new(question_id: q1.id, text: "Outside")
a4 = AnswerChoice.new(question_id: q1.id, text: "Inside")

a3.save!
a4.save!

a5 = AnswerChoice.new(question_id: q2.id, text: "YES")
a5.save!

Response.delete_all
r1 = Response.create!(user_id: b.id, question_id: q.id, answer_choice_id: a1.id)
r2 = Response.create!(user_id: c.id, question_id: q.id, answer_choice_id: a2.id)
r3 = Response.create!(user_id: a.id, question_id: q.id, answer_choice_id: a2.id)
r4 = Response.create!(user_id: b.id, question_id: q1.id, answer_choice_id: a3.id)
r5 = Response.create!(user_id: b.id, question_id: q2.id, answer_choice_id: a5.id)
r6 = Response.create!(user_id: a.id, question_id: q2.id, answer_choice_id: a5.id)

r1.save!
r2.save!
r3.save!
r4.save!
r5.save!
r6.save!

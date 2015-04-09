class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :poll_id

      t.timestamp
    end

    add_index(:questions, :poll_id)
  end
end

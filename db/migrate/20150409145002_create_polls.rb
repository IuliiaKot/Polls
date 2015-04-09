class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :author_id
      t.string :title

      t.timestamp
    end

    add_index(:polls, :author_id, unique: true)
  end
end

class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.integer :reaction_id
      t.integer :nayami_comment_id
      t.integer :reply_comment_id
      t.integer :user_id

      t.timestamps
    end
  end
end

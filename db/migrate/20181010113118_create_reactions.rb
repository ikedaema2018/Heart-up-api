class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.boolean :iine
      t.boolean :sad
      t.boolean :angry
      t.integer :nayami_comment_id
      t.integer :reply_comment_id
      t.integer :user_id

      t.timestamps
    end
  end
end

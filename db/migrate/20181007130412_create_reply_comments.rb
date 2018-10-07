class CreateReplyComments < ActiveRecord::Migration[5.1]
  def change
    create_table :reply_comments do |t|
      t.string :reply_comment
      t.integer :nayami_comment_id
      t.integer :user_id

      t.timestamps
    end
  end
end

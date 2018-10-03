class CreateRepryComments < ActiveRecord::Migration[5.1]
  def change
    create_table :repry_comments do |t|
      t.string :comment
      t.integer :stamp_id
      t.integer :user_id
      t.integer :nayami_comment_id

      t.timestamps
    end
  end
end

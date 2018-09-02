class CreateNayamiComments < ActiveRecord::Migration[5.1]
  def change
    create_table :nayami_comments do |t|
      t.string :nayami_comment
      t.integer :locate_info_id
      t.integer :user_id
      t.timestamps
    end
  end
end

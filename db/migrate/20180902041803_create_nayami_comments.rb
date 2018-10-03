class CreateNayamiComments < ActiveRecord::Migration[5.1]
  def change
    create_table :nayami_comments do |t|
      t.string :nayami_comment
      t.integer :stamp_id
      t.integer :locate_info_id
      t.integer :user_id
      t.boolean :yonda_flag, null: false, default:false
      t.timestamps
    end
  end
end

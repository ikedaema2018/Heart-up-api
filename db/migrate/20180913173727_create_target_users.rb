class CreateTargetUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :target_users do |t|
      t.integer :locate_info_id
      t.integer :user_id
      t.boolean :life_flag, null: false, default:false
      t.timestamps
    end
  end
end

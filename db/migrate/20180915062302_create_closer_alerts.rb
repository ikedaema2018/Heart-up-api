class CreateCloserAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :closer_alerts do |t|
      t.integer :user_id
      t.integer :locate_info_id
      t.boolean :close_flag, null: false, default:false
      t.timestamps
    end
  end
end

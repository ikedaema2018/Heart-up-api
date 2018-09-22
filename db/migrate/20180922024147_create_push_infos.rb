class CreatePushInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :push_infos do |t|
      t.integer :user_id
      t.string :fcm_token

      t.timestamps
    end
  end
end

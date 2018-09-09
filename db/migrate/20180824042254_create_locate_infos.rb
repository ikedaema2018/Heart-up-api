class CreateLocateInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :locate_infos do |t|
      t.string :nayami
      t.string :ido
      t.string :keido
      t.integer :user_id
      t.string :color
      t.boolean :life_flag, null: false, default:false
      t.timestamps
    end
  end
end

class CreateSplashYondaChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :splash_yonda_checks do |t|
      t.string :locate_info_id
      t.boolean :yonda_flag, null:false, default:false

      t.timestamps
    end
  end
end

class CreateShabonAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :shabon_alerts do |t|
      t.integer :locate_info_id
      t.boolean :splash

      t.timestamps
    end
  end
end

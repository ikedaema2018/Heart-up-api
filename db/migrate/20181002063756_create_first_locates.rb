class CreateFirstLocates < ActiveRecord::Migration[5.1]
  def change
    create_table :first_locates do |t|
      t.integer :locate_info_id
      t.integer :user_id
      t.float :ido
      t.float :keido

      t.timestamps
    end
  end
end

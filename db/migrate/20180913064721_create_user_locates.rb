class CreateUserLocates < ActiveRecord::Migration[5.1]
  def change
    create_table :user_locates do |t|
      t.integer :user_id
      t.float :ido
      t.float :keido

      t.timestamps
    end
  end
end

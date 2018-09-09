class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.string :gender
      t.string :self_introduce
      t.string :profile_image
      t.string :auth_token
      t.timestamps
    end
  end
end

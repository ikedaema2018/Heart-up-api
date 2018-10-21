class CreateResultMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :result_messages do |t|
      t.string :result_message
      t.integer :locate_info_id

      t.timestamps
    end
  end
end

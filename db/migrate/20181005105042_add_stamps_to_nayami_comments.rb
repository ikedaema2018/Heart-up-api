class AddStampsToNayamiComments < ActiveRecord::Migration[5.1]
  def change
    add_column :nayami_comments, :stamp_id, :integer
  end
end

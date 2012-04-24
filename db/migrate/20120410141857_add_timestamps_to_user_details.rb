class AddTimestampsToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :created_at, :datetime
    add_column :user_details, :updated_at, :datetime
  end
end

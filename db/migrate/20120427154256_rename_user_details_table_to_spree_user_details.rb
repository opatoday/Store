class RenameUserDetailsTableToSpreeUserDetails < ActiveRecord::Migration
  def change
    rename_table("user_details", "spree_user_details")
  end
end

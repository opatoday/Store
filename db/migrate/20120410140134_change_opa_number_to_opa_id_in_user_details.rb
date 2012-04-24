class ChangeOpaNumberToOpaIdInUserDetails < ActiveRecord::Migration
  rename_column :user_details, :opa_number, :opa_id
end

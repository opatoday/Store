class CreateUserDetails < ActiveRecord::Migration
  create_table :user_details do |t|
    t.integer :user_id
    t.string  :gender
    t.integer :profession
    t.string  :other_profession
    t.integer :practice_place
    t.integer :year_graduation
    t.string  :province_graduation
    t.boolean :member
    t.integer :opa_number
    t.boolean :email_products_check
  end
end

class CreateSpreeUserDetails < ActiveRecord::Migration
  def change
    create_table :spree_user_details do |t|
      t.integer :user_id
      t.integer :opa
      t.integer :ocp
      t.string  :gender
      t.integer :profession
      t.string  :other_profession
      t.integer :practice_type
      t.integer :year_graduation
      t.string  :province_graduation
      t.boolean :member
      t.boolean :email_products_check
      t.timestamps
    end
  end
end

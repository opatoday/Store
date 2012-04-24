class UserDetail < ActiveRecord::Base
  belongs_to :user
  
  validates :profession, :practice_place, :present => true
  
  attr_accessible :gender, :profession, :other_profession, :practice_place, :year_graduation, :province_graduation, :member, :opa_id, :email_products_check
end

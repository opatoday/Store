class UserDetail < ActiveRecord::Base
  self.table_name_prefix = 'spree_'

  belongs_to :user
  has_many :orders, :through => :user
  
  validates :practice_type, :presence => true
  validates :opa, :presence => true, :if => :member?
  
  attr_accessible :practice_type, :opa, :ocp, :member

end

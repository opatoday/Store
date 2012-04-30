class Spree::UserDetail < ActiveRecord::Base
  belongs_to :user
  has_many :orders, :through => :user
  
  # validates :member, :practice_place, :presence => true
  # validates :opa_id, :presence => true, :if => :member?
  
  attr_accessible :practice_place, :member, :opa_id
  
  # def member_blank?
  #   self.member.blank?
  # end
end

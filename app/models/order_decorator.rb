Spree::Order.class_eval do
  before_validation :copy_bill_address
  # after_save :save_user_details
  
  has_one :user_detail, :through => :user
  # accepts_nested_attributes_for :user_detail
  
protected
  def copy_bill_address
    # if self.bill_address.nil?
    #   self.ship_address.zipcode = 'a1a1a1'
    #   self.ship_address.city = 'Toronto'
    #   self.ship_address.country = Spree::Country.find(34)
    #   self.bill_address = self.ship_address
    # els
    if !self.ship_address.nil? 
      self.ship_address = self.bill_address
    end
  end
  
  def save_user_details
    # self.user_detail.create(params[:order][:user_detail])
  end
end

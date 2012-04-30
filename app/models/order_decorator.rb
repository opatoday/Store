Spree::Order.class_eval do
  before_validation :copy_bill_address
  after_commit :save_user_details
  
  has_one :user_detail, :through => :user
  accepts_nested_attributes_for :user_detail
  
  def order_user_detail
    self.user.user_detail || self.user.user_detail.create
  end
  
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
    # logger.debug "###save_user_details params: #{params[:order]}"
    # @user = @order.user
    # @user.build_user_detail(params[:order][:user_details])
  end
end

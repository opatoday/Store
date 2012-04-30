Spree::CheckoutController.class_eval do
  # before_filter :load_data, :only => :update  
  # before_transition :to => 'delivery', :do => :after_address
  # before_transition :to => 'delivery', :do => :create_user_detail
  
  #before_filter :set_use_billing_to_true
  #def set_use_billing_to_true
  #  @order.use_billing = true unless @order.nil?
  #end
  
  
  
  # def after_address
  #   self.user_detail.create(params[:user_details])
  # end
end

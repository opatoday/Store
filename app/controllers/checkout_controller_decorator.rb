Spree::CheckoutController.class_eval do
  # before_filter :load_data, :only => [:update]
  # before_transition :to => 'delivery', :do => :after_address
  # before_transition :to => 'delivery', :do => :create_user_detail
  
  #before_filter :set_use_billing_to_true
  #def set_use_billing_to_true
  #  @order.use_billing = true unless @order.nil?
  #end
  
  def update
    if @order.update_attributes(object_params)
      fire_event('spree.checkout.update')
      
      if @order.next
        state_callback(:after)
      else
        flash[:error] = t(:payment_processing_failed)
        respond_with(@order, :location => checkout_state_path(@order.state))
        return
      end
      # logger.debug "###order params: #{@order.state}"
      if @order.state == "complete" || @order.completed?
        flash.notice = t(:order_processed_successfully)
        flash[:commerce_tracking] = "nothing special"
        respond_with(@order, :location => completion_route)
      else
        if @order.state == "delivery"
          save_user_detail 
          apply_member_discount
        end
        respond_with(@order, :location => checkout_state_path(@order.state))
      end
    else
      respond_with(@order) { |format| format.html { render :edit } }
    end
  end
  
  def save_user_detail
    @user = @order.user
    if @user.user_detail.nil?
      @user.build_user_detail(params[:order][:user_details]).save!
    else
      @user_detail = @user.user_detail
      @user_detail.update_attributes(params[:order][:user_details])
    end
  end
  
  def apply_member_discount
    # fire_event('spree.checkout.coupon_code_added', :coupon_code => '20MEMBER')
    # @order.price_adjustment_totals = -20
    # logger.debug "###order adjustments: #{@order.price_adjustment_totals}"  
    # Spree::Promotion::Actions::CreateAdjustment.compute_amount(calculable)
    
    # logger.debug "###order adjustments: #{Spree::Calculator::FreeShipping.description}" 
  end
end

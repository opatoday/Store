Spree::User.class_eval do
  has_one :user_detail, :dependent => :destroy, :autosave => true
end

Deface::Override.new(:virtual_path => "spree/checkout/_address", 
	:name => "remove_shipping_address", 
	:replace => "[data-hook='shipping_fieldset_wrapper']",
	:partial => "spree/checkout/details")

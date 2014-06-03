class Cart < ActiveRecord::Base
  has_many :items, :class_name => "CartItem", :dependent => :destroy
end

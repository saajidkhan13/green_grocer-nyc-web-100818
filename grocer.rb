require 'pry'

def consolidate_cart  
  new_cart = {}
  cart.each do |x|
    x.each do |item, hash|
      hash.each do |k, v|
        if new_cart[item] == nil
          new_cart[item] = {}
        end
        new_cart[item][k] = v
      end
      if new_cart[item][:count] == nil
        new_cart[item][:count] = 0
      end
      new_cart[item][:count] += 1
    end
  end
  new_cart
end

def apply_coupons(cart, coupons)
  # code here
  coupon_cart = {} 
  cart.each do |item, attributes|
    coupons.each do |coupon|
      if coupon[:item] == item && attributes[:count] >= coupon[:num] 
        if !coupon_cart.has_key?("#{item} W/COUPON")
          coupon_cart["#{item} W/COUPON"] = {
            price: coupon[:cost],
            clearance: attributes[:clearance],
            count: 0 } 
          end 
          coupon_cart["#{item} W/COUPON"][:count] += 1 
          attributes[:count] -= coupon[:num]
        end
      end
    end 
    cart.merge!(coupon_cart)
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

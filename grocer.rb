require 'pry'

def consolidate_cart(cart:[])
  result = {}
  cart.each_with_index do |item, i|
    item.each do |food, info|
      if result[food]
        result[food][:count] +=1 
      else 
        result[food] = info 
        result[food][:count] = 1 
      end 
    end 
  end 
  result
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

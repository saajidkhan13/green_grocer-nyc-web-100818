require 'pry'

def consolidate_cart(cart)  
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
    cart.each do |item, info_hash|
    if info_hash[:clearance] == true
      info_hash[:price] -= (info_hash[:price] * 0.2)
    end
  end
end

def checkout(cart, coupons)
  total = 0.0
  apply_clearance(apply_coupons(consolidate_cart(cart), coupons)).each do |item, info_hash|
    total += info_hash[:price] * info_hash[:count]
  end
  if total > 100.00
    total -= total * 0.1
  end
  total
end


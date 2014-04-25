class FillPriceInItems < ActiveRecord::Migration
  def up
  	LineItem.all.each do |line_item|
  		if line_item.price == nil
  			line_item.price = line_item.product.price
  			line_item.save!
  		end
  	end
  end
end

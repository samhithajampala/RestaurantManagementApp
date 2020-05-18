class BookedItemsController < ApplicationController
    def create
        @customer = Customer.find(params[:id])
        @booked = params[:item]
        @amt = params[:amount]
        @amt.delete_if{|x| x=="0"}
        @booked.zip @amt
        @total = 0;
        @booked.zip(@amt).each do |b,a|
          @item =  Item.find_by_name(b)
          @price = @item[:price]
          @quan = a
          @total = @total + @quan.to_i * @price;
        end
        @order = Order.new(:cid => params[:id] , :amount => @total)
        @order.save
        @new_id = @order[:id]
        @booked.zip(@amt).each do |b,a|
            @item =  Item.find_by_name(b)
            @iid = @item[:id]
            @worker = Worker.find_by(:specialisation => @item[:category] , :availability => 1 )

             if @worker!=nil then
             @order_item = OrderItem.new(:oid => @new_id , :iid => @iid , :status => "Being prepared" , :chef =>  @worker[:name] , :quantity => a.to_i)
              @order_item.save
              @my_items = OrderItem.where(:chef => @worker[:name] , :status => "Being prepared")
              if(@my_items.length == 3) then
                @worker.update_attributes(:availability => 0)
              end
             else
             @order_item = OrderItem.new(:oid => @new_id , :iid => @iid , :status => "Preparation is not yet started" , :quantity => a.to_i)
             @order_item.save
             end
            
             
    
        end
    end
 def confirmation
 end

    def myupdate
        @order_item = OrderItem.find(params[:item])
        @order_item.update_attributes(:status => "done")
        @worker = Worker.find(params[:id])
     @free_items = OrderItem.where(:status => "Preparation is not yet started")
     if(@free_items.length!=0) then
       @free_items.each do |f|
        @item = Item.find(f[:iid])
        if(@item[:category] == @worker[:specialisation]) then
            f.update_attributes(:status => "Being prepared" , :chef => @worker[:name]);
            break
        end
    end
    end




      @my_items = OrderItem.where(:chef => @worker[:name] , :status => "Being prepared")
        @amounts = []
        @item_names = []
        if @my_items.length==0 then
            @worker.update_attributes(:availability => 1)
        else
        @my_items.each do |m|
            @item_names.push(Item.find(m[:iid]))
            @amounts.push(m)
        end
        end
        @my_items.zip @amounts

    end
end

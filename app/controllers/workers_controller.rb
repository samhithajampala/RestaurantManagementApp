class WorkersController < ApplicationController
    def show
        @worker = Worker.find(params[:id])
        @my_items = OrderItem.where(:chef => @worker[:name] , :status => "Being prepared")
        @item_names = []
        @my_items.each do |m|
            @item_names.push(Item.find(m[:iid]))
          
        end

    end
    def new
    end
    def create
        @user = User.new(:username => params[:uname] , password: params[:pwd] , category: "worker") 
        @user.save
        @worker = Worker.new(:name => params[:n] , :specialisation => params[:spl] , :availability => 1 , :username => params[:uname] , :password => params[:pwd] , :salary => params[:sal])
        @worker.save
        redirect_to controller:"users" , action:"admin"
    end
    def update
    end
    def update_salaries
        @worker = Worker.find(params[:wid])
         @type = params[:type]
         @type1 = params[:type1]
         if(@type=="Amount") then
            @value = params[:amt_value]
            if(@type1 == "inc") then
             @new_salary = @worker[:salary].to_i + @value.to_i
            else
                @new_salary = @worker[:salary].to_i - @value.to_i
            end 
            @worker.update_attributes(:salary => @new_salary)
         else
            @value = params[:prct_value]
            if(@type1 == "inc") then 
              @new_salary = @worker[:salary].to_i + @value.to_i * 0.01 * @worker[:salary].to_i
            else
                @new_salary = @worker[:salary].to_i - @value.to_i * 0.01 * @worker[:salary].to_i
            end   
            @worker.update_attributes(:salary => @new_salary)
         end
         flash[:success] = "Salary of " + @worker[:name] + "is successfully updated"
         redirect_back(fallback_location: "/")
    end
end

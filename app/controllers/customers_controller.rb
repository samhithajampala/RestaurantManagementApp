class CustomersController < ApplicationController
    def show
        @c_id = params[:id]
        @customer = Customer.find(@c_id)
    end
    def select
        @c_id = params[:id]
        @customer = Customer.find(@c_id)
    end
    def track
    end
    def track_order
        @c_id = params[:id]
        @customer = Customer.find(@c_id)
        @my_items = OrderItem.where(:oid => params[:oid])

    end
    def update
        @user = User.find_by_username(params[:old_user_name])
        @user.update_attributes(:username => params[:uname] , :password => params[:pwd])
        @customer = Customer.find(params[:id])
        @customer.update_attributes(:firstname => params[:fname] , :lastname => params[:lname] , :mobile => params[:mobile] , :house_apt_no => params[:ha_no] , :street => params[:street] , :city => params[:city] , :state => params[:state] , :pincode => params[:pincode] , :username => params[:uname] , :pwd => params[:pwd])
       redirect_to @customer
     end
    def edit
       @customer = Customer.find(params[:id])
    end
end

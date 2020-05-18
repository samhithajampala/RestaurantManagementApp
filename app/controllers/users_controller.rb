class UsersController < ApplicationController
    def index
        
    end
    def new
        
    end
    def create
         @user = User.new(:username => params[:uname] , :password => params[:pwd] , :category => "customer") 
         @user.save
         @customer = Customer.new(:firstname => params[:fname] , :lastname => params[:lname] , :mobile => params[:mobile] , :house_apt_no => params[:ha_no] , :street => params[:street] , :city => params[:city] , :state => params[:state] , :pincode => params[:pincode] , :username => params[:uname] , :pwd => params[:pwd])
         @customer.save
         redirect_to @customer
    end
def edit

end
def show
end
def destroy
end
def verify
    if User.exists?(username: params[:uname] , password: params[:pwd])
      @user = User.find_by_username(params[:uname])
     if params[:s1] == 'Customer'
        if @user[:category] == 'customer' 
          @customer = Customer.find_by_username(params[:uname])
          redirect_to @customer
        else
          if @user[:category] == 'worker'
          flash[:error1] = "cw"
          redirect_back(fallback_location: "/users")
          else
          flash[:error2] = "ca"
          redirect_back(fallback_location: "/users")
          end
        end
     else
      if(params[:s1] == 'Admin')
        if @user[:category] == 'admin'
          redirect_to(:controller=>'users' , :action => 'admin') 
        else
            if @user[:category] == 'worker'
             flash[:error3] = "aw"
             redirect_back(fallback_location: "/users")
            else
              flash[:error4] = "ac"
            redirect_back(fallback_location: "/users")
            end
        end
      else
        if @user[:category] == 'worker'
          @worker = Worker.find_by_username(params[:uname])
          redirect_to @worker
        else
            if @user[:category] == 'customer'
             flash[:error5] = "wc"
             redirect_back(fallback_location: "/users")
            else
              flash[:error6] = "wa"
             redirect_back(fallback_location: "/users")
            end
        end
      end
    end
     else
        flash[:alert2] = "Invalid Username/password!"
        redirect_to action:index
     end
end
def admin

end

end

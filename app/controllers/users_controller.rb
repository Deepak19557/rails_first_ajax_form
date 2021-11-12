class UsersController < ApplicationController 
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_admin!,except:[:index,:show]
  before_action :current_admin,only:[:edit,:update,:destroy]


  def index
    @users = User.all 
  end  

  def show 
  end

  def new
      #@users =  User.all 
      @cities = City.all   
     # @user =current_admin.users.build
  end 
  def ajax_form
    @deep = "Hello Indore"
  end
  def create_ajax_form_user 
    @deep = "Hello Indore"
    @user = User.create!(gender: params[:gender],first_name: params[:first_name],last_name: params[:last_name],mobile_no: params[:mobile_no])
    redirect_to root_path 
    respond_to :js
  end    


  # def create
  #     @user = User.create(user_params)
  #     redirect_to root_path #user_path(@user.id)
  # end  

  def create
    # @friend = Friend.new(friend_params)
     @user =current_admin.users.build(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "user was successfully created." }
        format.json { render :show, status: :created, location: @user }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def edit
      @cities = City.all
      @user =   User.find(params[:id])
  end 

  def currect_user
    @user = current_admin.users.find_by(id:params[:id])
    redirect_to users_path ,notice:"Not Authorized To Edit This friend" if @user.nill?
  end
  
  # def update
  #     @user = User.find(params[:id])
  #     @user = @user.update(user_params)
  #     redirect_to root_path
  # end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }

      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @user = User.find(params[:id]) 
    @users =  User.all 
  end
  
  # def destroy 
  #   @user = User.find(params[:id])
  #   @user.destroy 
  #   #format.js { render :layout => false }
  #   redirect_to root_path
  # end 

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "Users was successfully destroyed." }
      format.json { head :no_content }
      format.js  { render :layout => false }
    end
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name,:last_name, :city_name,:gender,:category,:mobile_no,images:[])
  end
end
  








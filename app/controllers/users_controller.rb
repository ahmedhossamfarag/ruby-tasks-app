class UsersController < ApplicationController
  def create
    @user = User.new
  end

  def create_post
    if params[:user].nil?
      redirect_to action: "create", status: :bad_request
    else
      @user = User.new(params[:user].permit!)
      if @user.save
        session[:user_id] = @user.id
        redirect_to action: "index", controller: "task_notes"
      else
        render action: "create", status: :bad_request
      end
    end
  end

  def login
    @user = User.new
  end

  def login_post
    if params[:user].nil?
      redirect_to action: "login", status: :bad_request
    else
      @user = User.find_by(username: params[:user][:username])
      if @user.nil?
        @error = "User does not exist"
        @user = User.new
        render action: "login", status: :bad_request
      else
        if @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to action: "index", controller: "task_notes"
        else
          @error = "Password incorrect"
          render action: "login", status: :bad_request
        end
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to action: :login
  end
end

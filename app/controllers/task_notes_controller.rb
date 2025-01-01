class TaskNotesController < ApplicationController
  layout "task_notes"

  def index
    if session[:user_id].nil?
      redirect_to action: "login", controller: "users"
    else
      @task_notes = TaskNote.where(user_id: session[:user_id])
    end
  end

  def create
    if session[:user_id].nil?
      redirect_to action: "login", controller: "users"
    else
      @task_note = TaskNote.new
    end
  end

  def create_post
    if session[:user_id].nil?
      redirect_to action: "login", controller: "users"
    elsif params[:task_note].nil?
      redirect_to action: "create", status: :bad_request
    else
      @task_note = TaskNote.new(params[:task_note].permit!.merge(user_id: session[:user_id]))
      if @task_note.save
        redirect_to action: "index"
      else
        render action: "create", status: :bad_request
      end
    end
  end

  def edit
    if session[:user_id].nil?
      redirect_to action: "login", controller: "users"
    elsif params[:id].nil?
      head :bad_request
    else
      @task_note = TaskNote.find_by(id: params[:id], user_id: session[:user_id])
      if @task_note.nil?
        head :bad_request
      end
    end
  end

  def edit_patch
    if session[:user_id].nil?
      redirect_to action: "login", controller: "users"
    elsif params[:id].nil? or params[:task_note].nil?
      head :bad_request
    else
      @task_note = TaskNote.find_by(id: params[:id], user_id: session[:user_id])
      if @task_note.nil?
        head :bad_request
      else
        if @task_note.update(params[:task_note].permit!)
          redirect_to action: "index"
        else
          render action: "edit", status: :bad_request
        end
      end
    end
  end

  def delete
    if session[:user_id].nil?
      redirect_to action: :login, controller: :users
    elsif params[:id].nil?
      head :bad_request
    else
      @task_note = TaskNote.find_by(id: params[:id], user_id: session[:user_id])
      if @task_note.nil?
        head :bad_request
      else
        if @task_note.destroy
          redirect_to action: :index
        else
          head :bad_request
        end
      end
    end
  end
end

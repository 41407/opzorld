class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :destroy]
  after_action :set_logged_in, only: :new
  http_basic_authenticate_with name: ENV['OPZ_NAME'], password: ENV['OPZ_PASS'], except: :index

  def show
  end

  def index
    @entries = Entry.paginate(:page => params[:page])
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to @entry
    else
      render :new
    end
  end

  def destroy
    @entry.photo = nil
    @entry.save
    @entry.destroy
    redirect_to root_path
  end

  def logout
    session[:logged_in] = false
    redirect_to root_path
  end 

  private
  def set_entry
    @entry = Entry.find params[:id]
  end

  def entry_params
    params.require(:entry).permit(:photo, :description)
  end

  def set_logged_in
    session[:logged_in] = true
  end
end

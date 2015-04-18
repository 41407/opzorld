class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :destroy]
  http_basic_authenticate_with name: ENV['OPZ_NAME'], password: ENV['OPZ_PASS'], except: :index

  def show
  end

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @entry.photo = nil
    @entry.save
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private
  def set_entry
    @entry = Entry.find params[:id]
  end

  def entry_params
    params.require(:entry).permit(:photo, :description)
  end
end

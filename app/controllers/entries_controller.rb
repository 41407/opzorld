class EntriesController < ApplicationController
  def show
    @entry = Entry.find params[:id]
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
  end

  private

  def entry_params
    params.require(:entry).permit(:photo, :description)
  end
end

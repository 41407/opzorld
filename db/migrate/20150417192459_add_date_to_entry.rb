class AddDateToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :capture_time, :date
  end
end

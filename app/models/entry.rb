class Entry < ActiveRecord::Base
  has_attached_file :photo, :styles => { :original => "1000x1000>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end

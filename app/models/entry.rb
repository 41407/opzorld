class Entry < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :original => "1000x1000>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

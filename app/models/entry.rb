class Entry < ActiveRecord::Base
  default_scope { order(capture_time: :desc) }
  after_create :parse_capture_time_from_filename

  has_attached_file :photo, :styles => { :original => "1000x1000>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def month_and_day
    capture_time.strftime("%b %d").downcase unless capture_time.nil?
  end

private
  def parse_capture_time_from_filename
    update(capture_time: Date.parse(self.photo.original_filename))
  end
end

class Work < ActiveRecord::Base
  belongs_to :user
  belongs_to :staff

	mount_uploader :image, ImageUploader
end

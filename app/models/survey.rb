class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions

  mount_uploader :file, PhotoUploader
end

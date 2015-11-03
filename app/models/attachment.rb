class Attachment < ActiveRecord::Base
  belongs_to :folder
  validates :file, presence: true
end

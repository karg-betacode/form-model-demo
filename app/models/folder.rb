class Folder < ActiveRecord::Base
  has_many :attachments
end

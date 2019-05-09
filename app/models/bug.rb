class Bug < ApplicationRecord
 	enum status:  [:New , :Started, :Completed]
	enum bug_type: [:Bug, :Feature]

	belongs_to :project
	belongs_to :user
	mount_uploader :avatar, AvatarUploader

	validates :title, presence: true ,uniqueness: true
	validates :status, presence: true
end

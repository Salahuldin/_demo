class Bug < ApplicationRecord
 	enum status:  [:New , :Started, :Completed]
	enum type: [:Feature, :Bug]

	belongs_to :project
	mount_uploader :avatar, AvatarUploader
end

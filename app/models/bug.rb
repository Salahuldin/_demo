class Bug < ApplicationRecord
 	enum status:  [:New , :Started, :Resolved]
	enum bug_type: [:Bug, :Feature]

	belongs_to :project
	belongs_to :user
	mount_uploader :avatar, AvatarUploader

	validates :title, presence: true ,uniqueness: true
	validates :status, presence: true


  def bug_assign_to
    User.where(id:  self.dev_id).pluck(:name).first
  end
end

class Bug < ApplicationRecord
  enum status: %i[new_bug started resolved]
  enum bug_type: %i[bug feature]

  belongs_to :project
  belongs_to :developer, class_name: 'User', foreign_key: 'user_id', optional: true
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  validates :title, presence: true, uniqueness: true
  validates :status, presence: true

  def bug_assign_to
    developer
  end
end

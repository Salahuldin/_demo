class Project < ApplicationRecord
	  belongs_to :user
	  has_many :bugs
	  validates :name, uniqueness: true

end

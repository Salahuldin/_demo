class User < ApplicationRecord
   enum role: [:QA, :Developer, :Manager]

   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :user_projects, :dependent => :delete_all 
	has_many :projects, through: :user_projects 
    has_many :bugs 

	def Manager?
		self.role == "Manager"
	end

	def QA?
		self.role == "QA"
	end
	
	def Developer?
		self.role == "Developer"
	end

end

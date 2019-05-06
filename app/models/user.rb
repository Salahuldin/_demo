class User < ApplicationRecord
   enum role: [:QA, :Developer, :Manager]

   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :projects
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

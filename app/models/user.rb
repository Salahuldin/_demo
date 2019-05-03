class User < ApplicationRecord
   enum role: [:QA, :Developer, :Manager]

   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :projects, dependent: :destroy

end

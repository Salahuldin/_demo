class User < ApplicationRecord
  enum role: %i[qa developer manager]

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :user_projects, dependent: :delete_all
  has_many :projects, through: :user_projects
  has_many :bugs, dependent: :delete_all
  has_many :bug_developers, class_name: 'Bug', foreign_key: 'user_id'

  def manager?
    role == 'manager'
  end

  def qa?
    role == 'qa'
  end

  def developer?
    role == 'developer'
  end
end

# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :user_projects, dependent: :delete_all
  has_many :users, through: :user_projects
  has_many :bugs
  validates :name, uniqueness: true, presence: true

  def qas
    users.where(role: 'QA')
  end

  def devs
    users.where(role: 'Developer')
  end

  def managers
    users.where(role: 'Manager')
  end
end

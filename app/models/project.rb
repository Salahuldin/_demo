# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :user_projects, dependent: :delete_all
  has_many :users, through: :user_projects
  has_many :bugs, dependent: :delete_all
  validates :name, uniqueness: true, presence: true

  def qas
    users.where(role: 'qa')
  end

  def devs
    users.where(role: 'developer')
  end

  def managers
    users.where(role: 'manager')
  end
end

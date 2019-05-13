class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Pundit

end

class ResourceRating < ActiveRecord::Base
  belongs_to :resource
  belongs_to :request
  belongs_to :customer
end

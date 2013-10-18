class Request < ActiveRecord::Base
  belongs_to :customer
  belongs_to :service_type
  belongs_to :service
  belongs_to :resource
end

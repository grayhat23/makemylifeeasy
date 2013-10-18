class ResourceService < ActiveRecord::Base
  belongs_to :resource
  belongs_to :service_type
  belongs_to :service
end

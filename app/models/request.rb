class Request < ActiveRecord::Base
  belongs_to :customer
  belongs_to :service_type
  belongs_to :service
  belongs_to :resource, :class_name => "Resource", :foreign_key => "resource_id"

  has_one :history, :class_name => "RequestHistory"
  accepts_nested_attributes_for :history

  include ApplicationHelper

    def Status
      resource_status = RequestStatus.RequestStatuses().select { |key,value| value == self.status }

      if resource_status.nil?
        return nil
      else
        return resource_status[0][0]
      end

    end

    def History
      return RequestHistory.new
    end

  end

module ApplicationHelper


  class RequestStatus
    New = 1
    Assigned = 2
    PickedUp = 3
    Serviced = 4
    Delivered = 5
    Closed = 6
    Cancelled = 7
    Rejected = 8

    def self.RequestStatuses
      return [["New", 1], ["Assigned", 2], ["Picked Up", 3], ["Serviced", 4], ["Delivered", 5], ["Closed", 6], ["Cancelled", 7]]
    end
  end

    class Role
      Admin = 1
      Resource = 2
      Customer = 3
    end

    class ServiceCategory
       Service = 1
       PickupDelivery = 2
       PickupServiceDelivery = 3
    end

     class CustomerType
       Individual = 1
       Corporate = 2
     end

     class ResourceType
       Individual = 1
       ServiceProvider = 2
     end
end


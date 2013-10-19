class Resource < ActiveRecord::Base
  belongs_to :user
  include ApplicationHelper

  def name
    return self.user.name
  end

  def ResType
    if self.r_type == ResourceType::Individual
      return "Individual"
    else
      return "Corporate"
    end

  end
end

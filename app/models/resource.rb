class Resource < ActiveRecord::Base
  belongs_to :user

  def name
    return self.user.name
  end
end

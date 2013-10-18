class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, format: { with: /\+[1-9]{1}[0-9]{10}/, message: "Use only numbers" }

=======

  def name
    "#{self.first_name} #{self.last_name}"
  end
>>>>>>> master
end

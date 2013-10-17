class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :role, :inclusion => { :in => ['risd', 'brown']}
  def other_schools
  	User.where("role != ?", self.role)
  end


  def brown?
  	self.role == 'brown'
  end

  def risd?
  	self.role == 'risd'
  end
end
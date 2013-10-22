class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates_format_of :email, :with => /.+@(brown)|(risd)\.edu/ 
  #validates :role, :inclusion => { :in => ['risd', 'brown']}



=begin
  def other_schools
    if /.+@brown\.edu/.match(current_user.email)
  	   User.where(email != /.+@brown\.edu/)
    else
      render :text => 'NOT WORKING', :status => :unauthorized
    end
  end
=end
has_one :description
#accepts_nested_attributes_for :description
def other_schools # instance method
   if self.email.match(/.+@brown\.edu$/)
      User.where("email NOT LIKE '%@brown\.edu'")#("email =~ ?", /.+@brown\.edu/)
   elsif self.email.match(/.+@risd\.edu$/)
      User.where("email NOT LIKE '%@risd\.edu'")
  else
      false
      #render :text => 'NOT WORKING', :status => :unauthorized
   end
end

def brown?
  if self.email.match(/.+@brown\.edu$/)
    return true
  else
    return false
  end
end

def risd?
  if self.email.match(/.+@risd\.edu$/)
    return true
  else
    return false
  end
end

=begin
  def brown?
  	self.role == 'brown'
  end

  def risd?
  	self.role == 'risd'
  end
=end
end
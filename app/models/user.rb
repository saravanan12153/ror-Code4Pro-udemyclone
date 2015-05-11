class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates_presence_of :name, length: {maximum: 25} 

   after_create :send_notification

   def send_notification
   		MyMailer.new_user(self).deliver
   end     
end

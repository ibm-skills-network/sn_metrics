class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  # Commented-out:
  # :recoverable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable,
         :omniauthable
end

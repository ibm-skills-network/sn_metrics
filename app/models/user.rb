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

  has_many :social_providers, dependent: :destroy

  attribute :skip_password_validation

  def self.find_or_create_with_omniauth(info)
    find_or_create_by!(email: info["email"].downcase) do |new_user|
      new_user.skip_password_validation = true
    end
  end

  private

  def password_required?
    return false if skip_password_validation

    super
  end
end

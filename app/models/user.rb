class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :name, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[\s]*[^@\s]+@([^@\s]+\.)+[^@\s]+[\s]*\z/ }

  validates :password, presence: true, length: {minimum: 6}

  validates :password_confirmation, presence: true


  def authenticate_with_credentials(email, password)

    user = User.find_by(:email => email)

    if user && user.authenticate(password)
      user
    else
      nil
    end

  end

end

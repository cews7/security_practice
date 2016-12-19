class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def self.authenticate(email, password)
    find_by_email_and_password(email, password)
  end
end

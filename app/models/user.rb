class User < ApplicationRecord

  has_one :shopping_cart

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  enum role: {
    base: 1,
    admin: 5
  }

end

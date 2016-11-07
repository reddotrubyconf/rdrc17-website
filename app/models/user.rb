# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.create_from_auth!(auth)
    create! do |user|
      user.name  = auth.dig(:info, :name)
      user.email = auth.dig(:info, :email)
    end
  end
end
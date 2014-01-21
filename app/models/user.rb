class User < ActiveRecord::Base
  has_many :payments, dependent: :destroy
  before_create :set_auth_token

  private

    def set_auth_token
      return if auth_token.present?

      begin
        self.auth_token = SecureRandom.base64(15)
      end while self.class.exists?(auth_token: self.auth_token)
    end
end

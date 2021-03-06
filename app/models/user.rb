class User < ActiveRecord::Base
  has_many :owned_groups, {foreign_key: "owner_id", dependent: :destroy, class_name: "Group"}
  has_many :memberships, {dependent: :destroy}
  has_many :groups, {through: :memberships, class_name: "Group", dependent: :destroy}
  has_many :votes
  before_save { self.email = email.downcase }
	before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
	def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def twitter?
    self.twitter_token && self.twitter_secret
  end

  attr_accessor :twitter_client
  def twitter
    if twitter?
      return self.twitter_client if self.twitter_client
      self.twitter_client = TwitterOAuth::Client.new(
          :consumer_key => TWITTER_CONSUMER_KEY,
          :consumer_secret => TWITTER_CONSUMER_SECRET,
          :token => self.twitter_token,
          :secret => self.twitter_secret
      )
    else
      false
    end
  end

  private
  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end





end

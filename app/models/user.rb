class User < ActiveRecord::Base
  has_many :surveys
  has_many :responses


  attr_reader :entered_password

  # validates :entered_password, :length => { :minimum => 3 }
  validates :email, :uniqueness => true, :format => /.+@.+\..+/

  def self.authenticate(params)
    user = User.find_by_email(params[:email])
    (user && user.password == params[:password]) ? user : nil
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @entered_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(params)
    p @user = User.new(params)
    p @user.password = params[:password]
    @user.save!
    @user
  end
end

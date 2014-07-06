class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   before_save :create_permalink

  def to_param
    permalink
  end

  private
    def create_permalink
      self.permalink = username.downcase
    end
end

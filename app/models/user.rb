class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         
    validates :firstname, :lastname, :birthdate, :username, :phonenumber, presence: true
    validates :username, uniqueness: true
    validates :email, uniqueness: true, allow_blank: true
  
    has_many :user_roles
    has_many :roles, through: :user_roles

    def self.from_omniauth(access_token)
        data = access_token.info
        user = User.where(email: data['email']).first
    
        unless user
          user = User.create(
            firstname: data['first_name'],
            lastname: data['last_name'],
            username: data['email'].split('@').first,
            email: data['email'],
            password: Devise.friendly_token[0,20],
            birthdate: Date.today,  # Adjust as necessary, since birthdate is required
            phonenumber: "0000000000" # Adjust as necessary, since phonenumber is required
          )
        end
        user
    end
end
  
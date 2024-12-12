class User < ApplicationRecord
  enum status: { pending: 'pending', in_progress: 'in_progress', completed: 'completed' }

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true

  has_many :tasks, dependent: :destroy
  
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end
end

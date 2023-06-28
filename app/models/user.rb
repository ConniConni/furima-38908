class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :firstname, presence: true, format:{ with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :lastname, presence: true, format:{ with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :firstname_kana, presence: true ,format:{ with: /\A[ァ-ヶー－]+\z/ }
  validates :lastname_kana, presence: true ,format:{ with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end

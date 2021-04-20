class Blog < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  validates :content, presence: true, length: {minimum:1, maximum:140}
  validates :title, presence: true
end

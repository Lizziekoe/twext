class Contact < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :texts
  validates :name, presence: true
  validates :number, presence: true

end

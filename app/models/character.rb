class Character < ActiveRecord::Base
  belongs_to :cartoon

  validates :name, presence: true
end

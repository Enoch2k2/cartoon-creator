class Cartoon < ActiveRecord::Base
  belongs_to :user
  has_many :characters
  validates :title, presence: true, uniqueness: true


  # def display_characters
  #   if self.characters.length > 0
  #     self.characters.map {|character| character.name }.join(", ")
  #   else
  #     "No Characters In This Cartoon"
  #   end
  # end
end

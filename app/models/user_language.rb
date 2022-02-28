class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language
  validates :skill_level, presence: true, numericality: { only_integer: true }
end

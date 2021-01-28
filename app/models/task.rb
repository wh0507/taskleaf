class Task < ApplicationRecord
  validates :title, length: { maximum: 30 }, presence: true
  validate :validate_name_comma
  
  belongs_to :user

  private

  def validate_name_comma
    errors.add(:title, 'にカンマを含めることはできません')if title&.include?(',')
  end
end

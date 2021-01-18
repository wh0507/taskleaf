class Task < ApplicationRecord
  validates :name, length: { maximum: 30 }, presence: true
  validate :validate_name_comma
  
  belongs_to :user

  private

  def validate_name_comma
    errors.add(:name, 'にカンマを含めることはできません')if name&.include?(',')
  end
end

class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true

  def days_left
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end
end

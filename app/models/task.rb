class Task < ApplicationRecord
  STATUS_TYPES = ['A faire', 'En cours', 'Faite']
  belongs_to :room
  belongs_to :user, optional: true

  validates :end_date, comparison: { greater_than: :start_date }
  validates :status, inclusion: { in: STATUS_TYPES }

  acts_as_list
end

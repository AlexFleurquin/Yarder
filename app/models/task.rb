class Task < ApplicationRecord
  STATUS_TYPES = ['À faire', 'En cours', 'Faite']
  belongs_to :room
  belongs_to :user, optional: true

  acts_as_list

  # validates :end_date, comparison: { greater_than: :start_date }
  validates :status, inclusion: { in: STATUS_TYPES }


  default_scope -> { order(:start_date) }  # Our meetings will be ordered by their start_time by default

  def start_time
    start_date
  end

  def time
    "#{start_date.strftime('%I:%M')} - #{end_date.strftime('%I:%M')}"
  end

  def multi_days?
    (end_date.to_date - start_date.to_date).to_i >= 1
  end
end

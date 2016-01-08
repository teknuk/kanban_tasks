class Task < ActiveRecord::Base
  validates_presence_of :title, :status
  enum status: [:not_started, :started, :finished, :delivered, :accepted, :rejected]
  scope :doing, -> {where.not(status:[4,0])}
end

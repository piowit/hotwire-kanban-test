class Card < ApplicationRecord
  belongs_to :board_column

  acts_as_list scope: :board_column

  validates :title, presence: true

  delegate :board, to: :board_column
end

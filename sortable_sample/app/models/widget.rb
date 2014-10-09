class Thing < ActiveRecord::Base
  include RankedModel
  ranks :display_order, with_same: :thing_id

  belongs_to :thing

  validates :name, presence: true

  def to_s
    name
  end
end

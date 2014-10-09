class Thing < ActiveRecord::Base
  include RankedModel
  ranks :display_order

  has_many  :widgets, -> {order("display_order")}, dependent: :destroy, autosave: true

  validates :name, presence: true
  accepts_nested_attributes_for :widgets, allow_destroy: true

  def to_s
    name
  end
end

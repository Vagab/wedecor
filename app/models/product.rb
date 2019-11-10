class Product < ApplicationRecord

  before_destroy :not_referenced_by_any_line_item

  validates :name, :description, :price, presence: true

  has_attached_file :image

  has_and_belongs_to_many :shopping_carts
  has_many :line_items

  has_attached_file :image,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "http://i.kinja-img.com/gawker-media/image/upload/s--iEV2_cUo--/c_fill,fl_progressive,g_north,h_77,q_80,w_137/akjmndys0n7jgpfmf41d.jpg"

  validates_attachment :image,
                       content_type: { content_type: %w(image/jpeg image/png)},
                       size: { in: 0..100.kilobytes }
  validates_numericality_of :price,
                            greater_than_or_equal_to: 0.0,
                            message: 'Price can not be negative'
  validates_length_of :description,
                      maximum: 500,
                      message: 'Description is too long'
  validates_length_of :name,
                      maximum: 100,
                      message: 'Name is too long'

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end


end

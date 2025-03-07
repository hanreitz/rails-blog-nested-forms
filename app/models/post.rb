class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  accepts_nested_attributes_for :tags, reject_if: :tag_name_blank

  private

  def tag_name_blank(tags_attributes)
    tags_attributes[:name].blank?
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    foreign_key: :artist_id,
    class_name: 'Artwork'

  has_many :artworks_shares,
    foreign_key: :viewer_id,
    class_name: 'ArtworkShare'

  has_many :shared_artworks,
    through: :artworks_shares,
    source: :artwork

  has_many :comments,
    foreign_key: :author_id,
    class_name: :Comment,
    dependent: :destroy

  has_many :liked_comments,
    through: :comments,
    source: :likes

  has_many :liked_artworks,
    through: :artworks,
    source: :likes

  has_many :likes,
    foreign_key: :user_id,
    class_name: :Like

  has_many :collection_items,
    foreign_key: :owner_id,
    class_name: 'CollectionItem'

  def collections
    CollectionItem.where("owner_id = #{self.id}").group("collection_name").pluck("collection_name")
  end
end

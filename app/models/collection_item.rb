# == Schema Information
#
# Table name: collection_items
#
#  id              :bigint           not null, primary key
#  collection_name :string           not null
#  owner_id        :integer          not null
#  artwork_id      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class CollectionItem < ApplicationRecord
  validates :owner_id, presence: true
  validates :artwork_id, presence: true
  validates :collection_name, presence: true

  belongs_to :owner,
    foreign_key: :owner_id,
    class_name: 'User'

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: 'Artwork'
end

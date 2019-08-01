# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CollectionItem.delete_all
Like.delete_all
Comment.delete_all
ArtworkShare.delete_all
Artwork.delete_all
User.delete_all

users = User.create([
    { username: 'ArtBoi840' },
    { username: 'ArtyArt' }, 
    { username: 'BuysRareArt' }, 
    { username: 'ArtGangArtGangArtGang' },
    { username: 'LeoDaVinc' }
])

Artwork.create({ title: 'Mona Lisa', image_url: 'asljfasmdkf', artist_id: User.first.id })
Artwork.create({ title: 'Starry Night', image_url: 'asedfasdf', artist_id: User.second.id })
Artwork.create({ title: 'The Last Supper', image_url: 'asdkfasdfas', artist_id: User.third.id })
Artwork.create({ title: 'Guernica', image_url: 'zxvzxvdfas', artist_id: User.first.id })
Artwork.create({ title: 'American Gothic', image_url: 'zxcnvjkzxmv', artist_id: User.first.id })
# Artwork.create({ title: 'Scream', image_url: 'aoiwereioaw', artist_id: User.fifth.id })
# Artwork.create({ title: 'Self-Portrait', image_url: 'dskmfalsdkfm', artist_id: User.fourth.id })
# Artwork.create({ title: 'Creation', image_url: 'capoksdpc', artist_id: User.third.id })
# Artwork.create({ title: 'David and Goliath', image_url: 'qwpoekqpwo', artist_id: User.fifth.id })

ArtworkShare.create({ viewer_id: User.second.id, artwork_id: Artwork.first.id })
ArtworkShare.create({ viewer_id: User.third.id, artwork_id: Artwork.fourth.id })
ArtworkShare.create({ viewer_id: User.fourth.id, artwork_id: Artwork.first.id })
ArtworkShare.create({ viewer_id: User.first.id, artwork_id: Artwork.second.id })
ArtworkShare.create({ viewer_id: User.fourth.id, artwork_id: Artwork.first.id })
ArtworkShare.create({ viewer_id: User.third.id, artwork_id: Artwork.fifth.id })
ArtworkShare.create({ viewer_id: User.fourth.id, artwork_id: Artwork.fifth.id })
ArtworkShare.create({ viewer_id: User.fifth.id, artwork_id: Artwork.third.id })
ArtworkShare.create({ viewer_id: User.fourth.id, artwork_id: Artwork.third.id })
ArtworkShare.create({ viewer_id: User.fifth.id, artwork_id: Artwork.third.id })

Comment.create({ author_id: User.fifth.id, artwork_id: Artwork.first.id , body: 'following for later' })
Comment.create({ author_id: User.first.id, artwork_id: Artwork.second.id, body: 'such painting' })
Comment.create({ author_id: User.second.id, artwork_id: Artwork.fifth.id, body: 'small whoa' })
Comment.create({ author_id: User.third.id, artwork_id: Artwork.second.id, body: 'big oof' })
Comment.create({ author_id: User.second.id, artwork_id: Artwork.fifth.id, body: 'much wow' })
Comment.create({ author_id: User.fourth.id, artwork_id: Artwork.fifth.id, body: 'following for later' })

Like.create({ like_id: Comment.all.sample.id, like_type: Comment, user_id: User.all.sample.id })
Like.create({ like_id: Comment.all.sample.id, like_type: Comment, user_id: User.all.sample.id })
Like.create({ like_id: Comment.all.sample.id, like_type: Comment, user_id: User.all.sample.id })
Like.create({ like_id: Comment.all.sample.id, like_type: Comment, user_id: User.all.sample.id })
Like.create({ like_id: Comment.all.sample.id, like_type: Comment, user_id: User.all.sample.id })
Like.create({ like_id: Artwork.all.sample.id, like_type: Artwork, user_id: User.all.sample.id })
Like.create({ like_id: Artwork.all.sample.id, like_type: Artwork, user_id: User.all.sample.id })
Like.create({ like_id: Artwork.all.sample.id, like_type: Artwork, user_id: User.all.sample.id })
Like.create({ like_id: Artwork.all.sample.id, like_type: Artwork, user_id: User.all.sample.id })
Like.create({ like_id: Artwork.all.sample.id, like_type: Artwork, user_id: User.all.sample.id })

CollectionItem.create({ collection_name: "Classics", owner_id: User.first.id, artwork_id: Artwork.first.id })
CollectionItem.create({ collection_name: "Classics", owner_id: User.first.id, artwork_id: Artwork.fifth.id })
CollectionItem.create({ collection_name: "Van Gogh", owner_id: User.second.id, artwork_id: Artwork.second.id })
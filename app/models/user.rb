class User < ActiveRecord::Base
  self.primary_key = "UserID"
  belongs_to :country, foreign_key: "CountryID"

  has_many :regions, through: :country
  
  has_many :outbound_friendships, class_name: "Friendship", foreign_key: "MemberID"
  has_many :inbound_friendships, class_name: "Friendship", foreign_key: "FriendID"

  has_many :friendees, through: :outbound_friendships, foreign_key: "MemberID"
  has_many :frienders, through: :inbound_friendships, foreign_key: "FriendID"

  has_many :outbound_inspirations, class_name: "Inspiration", foreign_key: "InspiredMemberID"
  has_many :inbound_inspirations, class_name: "Inspiration", foreign_key: "MemberID"

  has_many :inspirers, through: :outbound_inspirations, foreign_key: "MemberID"
  has_many :admirers, through: :inbound_inspirations, foreign_key: "InspiredMemberID"

  ignore_columns "DOB"

  # users belongs to a country -> has many locales <- regions has many locals
end

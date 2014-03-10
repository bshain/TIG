class Friendship < ActiveRecord::Base
  
  self.table_name = 'UpdatesFR'
  belongs_to :friender, class_name: "User", foreign_key: "MemberID"
  belongs_to :friendee, class_name: "User", foreign_key: "FriendID"

end

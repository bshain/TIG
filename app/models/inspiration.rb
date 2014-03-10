class Inspiration < ActiveRecord::Base

  self.table_name = 'UserInspired'
  belongs_to :inspirer, class_name: "User", foreign_key: "MemberID"
  belongs_to :admirer, class_name: "User", foreign_key: "InspiredMemberID"

end

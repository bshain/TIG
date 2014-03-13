namespace :update_assets do
  desc "TODO"
  task make_matrix: :environment do
    f=Friendship.find_by_sql('SELECT u.userid as MemberID, u.username as MemberName, r.regionid as MemberRegionID, r.regionname as MemberRegionName, f.userid as FriendID, f.username as FriendName, rr.regionid as FriendRegionID, rr.regionname as FriendRegionName FROM users u INNER JOIN updatesfr uf ON uf.memberid = u.userid INNER JOIN users f ON f.userid = uf.friendid INNER JOIN countries c ON c.countryid = u.countryid INNER JOIN countriesregions cr ON cr.countryid = c.countryid INNER JOIN regions r ON r.regionid = cr.regionid INNER JOIN countries cc ON cc.countryid = f.countryid INNER JOIN countriesregions ccr ON ccr.countryid = cc.countryid INNER JOIN regions rr ON rr.regionid = ccr.regionid ORDER BY r.regionid, rr.regionid')

    matrix = []
    list = [1,2,3,4,5,6,7,9,11]
    list.each do |r1|
      inner_matrix = []
      list.each do |r2|
        inner_matrix <<  f.select{|friendship| friendship.MemberRegionID == r1 && friendship.FriendRegionID == r2}.count
      end
      matrix << inner_matrix
    end
    File.open('matrix.json', 'w+') {|f| f.write(matrix) }
  end

end

namespace :update_assets do
  desc "Generates a new, updated friendship_matrix.json from the database"
  task friendship_matrix: :environment do
    puts "Friendship matrix SQL begun"
    f=Friendship.find_by_sql('SELECT u.userid as MemberID, u.username as MemberName, r.regionid as MemberRegionID, r.regionname as MemberRegionName, f.userid as FriendID, f.username as FriendName, rr.regionid as FriendRegionID, rr.regionname as FriendRegionName FROM users u INNER JOIN updatesfr uf ON uf.memberid = u.userid INNER JOIN users f ON f.userid = uf.friendid INNER JOIN countries c ON c.countryid = u.countryid INNER JOIN countriesregions cr ON cr.countryid = c.countryid INNER JOIN regions r ON r.regionid = cr.regionid INNER JOIN countries cc ON cc.countryid = f.countryid INNER JOIN countriesregions ccr ON ccr.countryid = cc.countryid INNER JOIN regions rr ON rr.regionid = ccr.regionid ORDER BY r.regionid, rr.regionid')
    puts "SQL complete"
    matrix = []
    list = [1,2,3,4,5,6,7,9,11]
    list.each do |r1|
      inner_matrix = []
      list.each do |r2|
        inner_matrix <<  f.select{|friendship| friendship.MemberRegionID == r1 && friendship.FriendRegionID == r2}.count
      end
      matrix << inner_matrix
      print inner_matrix
      puts ""
    end
    puts "Writing to public/friendship_matrix.json"
    File.open('public/friendship_matrix.json', 'w+') {|f| f.write(matrix) }
    puts "Rake complete!"
  end

  desc "Generates a new, updated inspiration_matrix.json from the database"
  task inspiration_matrix: :environment do
    puts "Inspiration matrix SQL begun"
    f=Inspiration.find_by_sql('SELECT u.userid as MemberID, u.username as MemberName, r.regionid as MemberRegionID, r.regionname as MemberRegionName, f.userid as InspiredMemberID, f.username as InspiredMemberName, rr.regionid as InspiredMemberRegionID, rr.regionname as InspiredMemberRegionName FROM users u INNER JOIN userinspired uf ON uf.memberid = u.userid INNER JOIN users f ON f.userid = uf.inspiredmemberid INNER JOIN countries c ON c.countryid = u.countryid INNER JOIN countriesregions cr ON cr.countryid = c.countryid INNER JOIN regions r ON r.regionid = cr.regionid INNER JOIN countries cc ON cc.countryid = f.countryid INNER JOIN countriesregions ccr ON ccr.countryid = cc.countryid INNER JOIN regions rr ON rr.regionid = ccr.regionid ORDER BY r.regionid, rr.regionid')

    matrix = []
    list = [1,2,3,4,5,6,7,9,11]
    list.each do |r1|
      inner_matrix = []
      list.each do |r2|
        inner_matrix <<  f.select{|inspiration| inspiration.MemberRegionID == r1 && inspiration.InspiredMemberRegionID == r2}.count
      end
      matrix << inner_matrix
      print inner_matrix
      puts ""
    end
    puts "Writing to public/inspiratoin_matrix.json"
    File.open('public/inspiration_matrix.json', 'w+') {|f| f.write(matrix) }
    puts "Rake complete!"
  end

end

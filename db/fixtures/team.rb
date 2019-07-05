Team.destroy_all
Team.seed(:id,
  {:id => 1, :email => "k.amrmkh@gmail.com", :password => "111111", :name => "管理者", :profile => "管理者アカウント", :pref => 1},
  {:id => 2, :email => "t@g.com", :password => "111111", :name => "Team tajima", :rank => 3, :cat => "競技志向", :age_ave => 30},
  {:id => 3, :email => "k@g.com", :password => "111111", :name => "Team kaneko", :rank => 5, :cat => "競技志向", :age_ave => 30},
  {:id => 4, :email => "1@g.com", :password => "111111", :name => "Team1", :rank => 9, :cat => "都道府県", :age_ave => 40},
  {:id => 5, :email => "2@g.com", :password => "111111", :name => "Team2", :rank => 3, :cat => "競技志向", :age_ave => 30},
  {:id => 6, :email => "3@g.com", :password => "111111", :name => "Team3", :rank => 3, :cat => "競技志向", :age_ave => 30},
  {:id => 7, :email => "4@g.com", :password => "111111", :name => "Team4", :rank => 3, :cat => "競技志向", :age_ave => 30}
)
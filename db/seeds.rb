users_json = [{firstName: "albert", lastName:"einstein", email: "ae@relativity.com"},{firstName: "marie", lastName:"curie", email: "ms@radiation.com"},
	           {firstName: "issac", lastName:"newton", email: "in@gravity.com"}, {firstName: "galileo", lastName:"galilei", email: "gg@estronomy.com"},
	         ]

users_json.each do |user|
  User.create(user)
end

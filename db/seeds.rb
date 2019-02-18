3.times do |topic|
Topic.create!(
	title: "Topic #{topic}"
	)
end

10.times do |blog|
Blog.create!(
	title: "Blog Post nr #{blog}",
	body: "lorejn dindi ijdnidn sindn dniondixnd dj idniuxndiid xdondnxidnd ixdjnindx d ijn iun un in onn iindd dj dn djnd",
	topic_id: Topic.last.id
	)
end

puts "10 blogs created"

5.times do |skill|
	Skill.create!(
		title: "Rails #{skill}",
		procent: 15
		)
end

puts "5 posts created"

8.times do |portfolio|
	Portf.create!(
		title: "Portfolio title: #{portfolio}",
		subtitle: "Ruby on Rails",
		body: "jno nkjon ioj o klkmklmdondj d ijnnnsk djindjndn dkj dkj dj dkjh dkjh kjhd kjhd h djhd jd jhd jhd jhd djh djh dhj djhd hd jhd djh dhinoiinkj non jnon onfkj dijnnej hijfjhf  kdjd jh",
		main_image: "http://placehold.it/600x400",
		thumb_image:"http://placehold.it/350x200"
		)
end

1.times do |portfolio|
	Portf.create!(
		title: "Portfolio title: #{portfolio}",
		subtitle: ".NET",
		body: "jno nkjon ioj o klkmklmdondj d ijnnnsk djindjndn dkj dkj dj dkjh dkjh kjhd kjhd h djhd jd jhd jhd jhd djh djh dhj djhd hd jhd djh dhinoiinkj non jnon onfkj dijnnej hijfjhf  kdjd jh",
		main_image: "http://placehold.it/600x400",
		thumb_image:"http://placehold.it/350x200"
		)
end

puts "9 portfolio created"
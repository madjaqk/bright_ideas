# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
first_names = ["Noah", "Liam", "Mason", "Jacob", "William", "Ethan", "Michael", "Alexander", "James", "Daniel", "Emma", "Olivia", "Sophia", "Isabella", "Ava", "Mia", "Emily", "Abigail", "Madison", "Charlotte"]
last_names = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Miller", "Davis", "Garcia", "Rodriguez", "Wilson", "Martinez", "Anderson", "Taylor", "Thomas", "Hernandez", "Moore", "Martin", "Jackson", "Thompson", "Lopez", "Lee", "Gonzalez", "Harris"]

email_patterns = ["firstlast@host.com", "first.last@host.com", "finitlast@host.com", "firstlinit@host.com", "lastfirst@host.com"]

email_hosts = ["gmail", "yahoo", "hotmail", "codingdojo"]

passwords = ["123456", "password", "12345678", "qwerty", "football", "1234567", "baseball", "welcome", "1234567890", "abc123", "111111", "1qaz2wsx", "dragon", "master", "monkey", "letmein", "princess", "qwertyuiop", "passw0rd", "starwars"]

idea_verbs = ["invest in", "stop investing in", "make", "stop making", "improve", "obsolete", "compete with"]

idea_objects = ["green energy", "Facebook", "computers", "bicycles", "VR", "SnapChap", "Dr Pepper", "diet soft drinks", "puzzles", "breakfast", "money"]

10.times do
	new_guy = {}
	@first = first_names.sample
	@last = last_names.sample
	new_guy[:name] = "#{@first} #{@last}"
	new_guy[:alias] = @first
	host = email_hosts.sample
	format = email_patterns.sample
	new_guy[:email] = format.gsub(/first/,@first).gsub(/last/,@last).gsub(/finit/,@first[0]).gsub(/linit/,@last[0]).gsub(/host/,host)
	new_guy[:password] = passwords.sample
	user = User.new(new_guy)
	user.save if user.valid?
end

10.times do 
	new_ideas = {}
	new_ideas[:user] = User.all.sample
	new_ideas[:content] = "We should #{idea_verbs.sample} #{idea_objects.sample}"
	Idea.create(new_ideas)
end

20.times do 
	Like.create(user: User.all.sample, idea: Idea.all.sample)
end
get '/' do
  @meetups = Meetup.all.order("name")
  erb :index
end

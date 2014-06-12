# GET /meetups/:meetup_id/new
get '/meetups/:id/comments' do
  authenticate!

  @comment = Comment.new
  @meetup = Meetup.find(params[:id])

  erb :comments
end

post '/meetups/:meetup_id/comments' do
  @meetup = Meetup.find(params[:meetup_id])
  @comment = current_user.comments.build(title: params["title"], body: params["body"])
  @comment.meetup = @meetup

  if @comment.save
    flash[:notice] = "Your comment has just been posted!"
    redirect "/meetups/#{params[:meetup_id]}"
  else
    flash.now[:notice] = 'There was an error. Try again.'
    erb :comments
  end
end

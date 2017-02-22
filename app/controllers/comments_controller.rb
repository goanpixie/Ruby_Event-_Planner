class CommentsController < ApplicationController
  	def create
  	@user = User.find(session[:user_id])
   
    end 

end
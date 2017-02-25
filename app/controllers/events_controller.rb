class EventsController < ApplicationController
  	def index
  		@user = User.find(session[:user_id])
  		@users= User.all
  		@events=Event.all
  		@join=Join.all

  	end

	 def create    
	    @user=User.find(session[:user_id])
	    @events=Event.all
	    @event= Event.create(name:params[:name], date:params[:date], location:params[:location],state:params[:state], user:User.find(session[:user_id]))
	      if @event.valid?
	            @event.save
	            redirect_to '/events'
	      else
	            flash[:errors] = @event.errors.full_messages
	            redirect_to :back
	      end 
	  end 

  	def edit

  	end


  	def show
  		@event=Event.find(params[:id])
  		@events=Event.all
  		@user = User.find(session[:user_id])
  		@users=User
  		@joins=Join.all
  		@who_joined = Join.where(event_id: @event)
  		
  		@comments=Comment.all
  		@who_comment=Comment.where(event_id:@event)

  	end

  	def join
	    @user = User.find(session[:user_id])
	    @event = Event.find(params[:id])
	    @join = Join.create(user_id:@user.id, event_id:@event.id)
	    redirect_to '/events' 
  	end 

  	def comment
  		@user = User.find(session[:user_id])
    	@event = Event.find(params[:id])
    	@comment=Comment.create(comment:params[:comment], user_id:@user.id, event_id:@event.id, user:User.find(session[:user_id]))
    	if @comment.valid?
	       @comment.save
	       redirect_to action: "show"
	    else
	        flash[:errors] = @event.errors.full_messages
	        redirect_to :back
	    end
	    @who_commented= Comment.where(event_id:@event)
	    @comment=Comment.all
    end

    def destroy
      event = Event.find(params[:id])
      event.destroy
      session[:user_id] = nil
      redirect_to '/events' 
    end
 

end

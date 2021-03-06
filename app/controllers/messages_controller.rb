class MessagesController < ApplicationController
  
  def index
      redirect_to conversations_path(:box => @box)
    end
 
  # GET /message/new
  def new
    @message = current_user.messages.new
  end
 
   # POST /message/create
  def create
    @recipient = User.find(params[:user])
    MessageWorker.perform_async(current_user.id, @recipient.id, params[:body], params[:subject])
    flash[:notice] = "Message has been sent!"
    if request.xhr?
		render :json => {:notice => flash[:notice]}
    else
		redirect_to :conversations
	end
  end
  
  def askout
      @recipient = User.find(params[:user])
      current_user.send_message(@recipient, "Let's Go...#{params[:body]}", params[:subject])
      if request.xhr?
        render :json => {:notice => 'Message has been sent!' }
      else
        flash[:notice] = "Message has been sent!"
        redirect_to :back, notice: "Your date was sent"
      end
    end
   
end

class MessagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :edit]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      flash[:notice] = "Great success!"
      redirect_to messages_path
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end

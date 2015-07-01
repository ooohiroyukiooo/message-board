class MessagesController < ApplicationController
  def index
    # Messageを全て取得する。
    @messages = Message.all
  end
  
  ## ここから追記
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path , notice: 'メッセージを保存しました'
  end
  
  private
  def message_params
    # params[:message]のパラメータでname , bodyのみを許可する。
    # 返り血は ex:) {name: "入力されたname" , body: "入力されたbody" }
    params.require(:message).permit(:name, :body)
  end
  ## ここまで
end

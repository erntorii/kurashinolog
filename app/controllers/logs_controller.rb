class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def show
    @log = Log.find(params[:id])
    @user = @log.user
  end

  def new
    @log = current_user.logs.build
  end

  def create
    @log = current_user.logs.build(log_params)
    if @log.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def log_params
    params.require(:log).permit(:title, :content)
  end
end

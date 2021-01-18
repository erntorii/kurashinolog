class LogsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @logs = Log.page(params[:page])
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

  def edit; end

  def update
    if @log.update(log_params)
      redirect_to @log
    else
      render 'edit'
    end
  end

  def destroy
    @log.destroy
    redirect_to root_url
  end

  private

  def log_params
    params.require(:log).permit(:title, :content, :image)
  end

  def correct_user
    @log = current_user.logs.find_by(id: params[:id])
    redirect_to log_url if @log.nil?
  end
end

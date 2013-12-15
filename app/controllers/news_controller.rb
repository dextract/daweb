class NewsController < ApplicationController
  # GET /news
  # GET /news.json
  def index
    @news = News.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /news/1
  # GET /news/1.json
  def show
    @news = News.find(params[:id])
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
    @news = News.find(params[:id])
  end

  def create
    @news = News.new(news_params)
      if @news.save
        flash[:success] = "News added"
        redirect_to root_path
      else
        flash.now[:error] = "News not added"
        render 'new'
      end
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(news_params)
      flash[:success] = "News updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    News.find(params[:id]).destroy
    flash[:success] = "News deleted."
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :content, :image, :user_id)
    end
end

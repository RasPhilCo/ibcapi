class Api::V1::VideosController < Api::BaseController
  before_filter :find_video, only: [:show, :vote]

  def index 
    @page = (params[:page]||= 1).to_i
    @results_per_page = (params[:per_page]||= Video.per_page).to_i

    if params[:query]
      @videos = Video.with_query(params[:query])
                     .paginate(:page => params[:page], :per_page => params[:per_page])
                     .order('popularity DESC')
      @next_page = api_v1_videos_url + "?page=#{@page+1}&per_page=#{@results_per_page}&query=#{params[:query]}"
    else
      @videos = Video.paginate(:page => params[:page], :per_page => params[:per_page])
                     .order('popularity DESC')
      @next_page = api_v1_videos_url + "?page=#{@page+1}&per_page=#{@results_per_page}"
    end
  end

  def show
    show_video
  end

  def vote
    @popularity = @video.popularity
    @video.count_vote(params[:vote])
    
    if @video.save && (@popularity != @video.popularity)
      show_video
    else
      render json: @video, status: 422
    end
  end

  private
    def find_video
      @video = Video.find_by(yt_id: params[:id])
    end

    def show_video
      render partial: 'video', locals: { :video => @video }
    end
end

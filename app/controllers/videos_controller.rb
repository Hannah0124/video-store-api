class VideosController < ApplicationController

  def index
    videos = Video.all.order(:id) 

    render json: { ok: 'Yes'}, status: :ok 
  end
end

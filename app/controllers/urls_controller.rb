class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    url = Url.where(:random_id=>params[:id]).first

    if url
      redirect_to url.original
    else
      render "index"
    end
  end

  # GET /urls/new
  def new
    @url = Url.new

    letters = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    @url.random_id = (0..8).map { letters[rand(letters.length)] }.join
  end

  def urls_params
    params.require(:url).permit(:original, :random_id)
  end


  def create
    @url = Url.new(urls_params)

    if @url.save
      redirect_to urls_path
    else
      render "new"
    end
  end
end

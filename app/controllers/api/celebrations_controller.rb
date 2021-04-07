class Api::CelebrationsController < ApplicationController
  before_action :authenticate_user
  # before_action :authenticate_admin, except: [:index, :show]

  def index
    @celebrations = current_user.celebrations
    render "index.json.jb"
  end

  def show
    celebration_id = params[:id]
    @celebration = Celebration.find(celebration_id)
    render "show.json.jb"
  end

  def create
    @celebration = Celebration.new(
      name: params[:name],
      occasion: params[:occasion],
      theme: params[:theme],
      colors: params[:colors],
      signature_drink: params[:signature_drink],
      location: params[:location],
      activity: params[:activity],
      notes: params[:notes],
    )
    #happy/sad path
    if @celebration.save
      Member.create(celebration_id: @celebration.id, user_id: current_user.id)
      render "show.json.jb"
    else
      render json: { errors: @celebration.errors.full_messages }, status: 406
    end
  end

  def update
    celebration_id = params[:id]
    @celebration = Celebration.find(celebration_id)
    @celebration.name = params[:name] || @celebration.name
    @celebration.occasion = params[:occasion] || @celebration.occasion
    @celebration.theme = params[:theme] || @celebration.theme
    @celebration.colors = params[:colors] || @celebration.colors
    @celebration.signature_drink = params[:signature_drink] || @celebration.signature_drink
    @celebration.location = params[:location] || @celebration.location
    @celebration.activity = params[:activity] || @celebration.activity
    @celebration.notes = params[:notes] || @celebration.notes

    if @celebration.save
      render "show.json.jb"
    else
      render json: { errors: @celebration.errors.full_messages }, status: 406
    end
  end
end

class SubsController < ApplicationController
  before_action :set_sub, :only [:show, :edit, :update, :destroy]

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new # ** :id is not required because its creating a new one!
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def create
    @sub = Sub.new(sub_params)
    if Sub.save
      redirect_to subs_path
    else
      render :new
  end

  def update
    @sub = Sub.find(params[:id])

    if Sub.update(sub_params)
      redirect_to @sub # ** subs_path TRY THIS BEFORE FINALIZING
    else
      render :edit 
  end

  def destroy
    @sub = Sub.find(params[:id])
    Sub.destroy
    redirect_to subs_path
  end

  private

  def set_sub
    @sub = Sub.find(params[:id])
  end

  def sub_params
    params.require(:sub).permit(:name) # ** requiring the parameters of the model and permitting its attributes
  end

end

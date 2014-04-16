class InproceedingsController < ApplicationController
  before_action :set_inproceeding, only: [:show, :update, :edit]

  #def index
  #  @inproceedings = Inproceeding.all
  #end

  def show
  end

  def new
    @inproceeding = Inproceeding.new
  end

  def edit
    set_inproceeding
  end

  def set_inproceeding
    @inproceeding = Inproceeding.find(params[:id])
  end

  def update
    respond_to do |format|
      generatekey
      if @inproceeding.update(inproceeding_params)
        format.html { redirect_to references_path, notice: 'Inproceedings was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @inproceeding.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @inproceeding = Inproceeding.new inproceeding_params

    @inproceeding.referencetype = 'Inproceedings'
    generatekey
    if @inproceeding.save

      redirect_to references_path, notice: "Inproceedings type reference created"

    else
      render :new
    end

  end

  def generatekey
    if @inproceeding.key.nil? or @inproceeding.key.empty?
      @inproceeding.key = @inproceeding.keygen
    end
  end

  def inproceeding_params
    params.require(:inproceeding).permit(:author, :title, :booktitle, :year,:editor,
                                         :volume, :series, :pagestart, :pageend, :address, :month, :organization, :publisher, :note, :key)
    # generatekey
  end


end

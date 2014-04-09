class InproceedingsController < ApplicationController
  before_action :set_inproceeding, only: :show

  #def index
  #  @inproceedings = Inproceeding.all
  #end

  def show
    @bibtex = @inproceeding.to_bib_str
  end

  def new
    @inproceeding = Inproceeding.new
  end

  #def edit
  #  set_inproceeding
  #end

  #def set_inproceeding
  #  @inproceeding = Inproceeding.find(params[:id])
  # end

  def create
    @inproceeding = Inproceeding.new params.require(:inproceeding).permit(:author, :title, :booktitle, :year,:editor,
                                                                 :volume, :series, :pagestart, :pageend, :address, :month, :organization, :publisher, :note, :key)

    @inproceeding.referencetype = 'Inproceedings'
    if @inproceeding.key.nil? or @inproceeding.key.empty?
      @inproceeding.key = @inproceeding.keygennp
    end
    if @inproceeding.save

      redirect_to references_path, notice: "Inproceedings type reference created"

    else
      render :new
    end

  end


end

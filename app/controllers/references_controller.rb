class ReferencesController < ApplicationController
  before_action :set_reference, only: :show

  def index
    @references = Reference.all
  end

  def show
  end

  def new
    @reference = Reference.new
  end

  def edit
    set_reference
  end

  def set_reference
    @reference = Reference.find(params[:id])
  end

  def create
    @reference = Reference.new params.require(:reference).permit(:author, :title, :booktitle, :year,:editor,
                               :volume, :series, :pagestart, :pageend, :address, :month, :organization, :publisher, :note)

    if not @reference.author.nil? and not @reference.title.nil? and not @reference.booktitle.nil?  and  @reference.save
      redirect_to references_path

    else
      @reference = Reference.new
      render :new
    end

  end


end

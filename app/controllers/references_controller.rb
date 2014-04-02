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

  def set_reference
    @reference = Reference.find(params[:id])
  end

  def create
    @reference = Reference.new params.require(:reference).permit(:author, :title, :booktitle, :year,:editor,
                               :volume, :series, :pagestart, :pageend, :address, :month, :organization, :publisher, :note)

    if @reference.save
      redirect_to references_path

    else
        render :new
    end
  end


end

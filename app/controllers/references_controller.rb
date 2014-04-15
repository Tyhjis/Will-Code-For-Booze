class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit]

  def index
    @references = Reference.all
  end

  def show
    @bibtex = @reference.to_bib_str
  end

 # def new
  #  @reference = Reference.new
  #end

  def bibtex
    @references = Reference.all
    @bibstr = ''
    @references.each do |r|
        @bibstr += "#{r.to_bib_str}"
    end
    render :bibtex
  end

  def edit

    @reference = set_reference

  end

  def set_reference
    @reference = Reference.find(params[:id])
  end

#  def create
#    @reference = Reference.new params.require(:reference).permit(:author, :title, :booktitle, :year,:editor,
#                               :volume, :series, :pagestart, :pageend, :address, :month, :organization, :publisher, :note)#
#
#    if not @reference.author.nil? and not @reference.title.nil? and not @reference.booktitle.nil?  and  @reference.save
#      redirect_to references_path
#
#    else
#      @reference = Reference.new
#      render :new
   # end

  #end


end

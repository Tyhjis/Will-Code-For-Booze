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

end

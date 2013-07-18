class KittensController < ApplicationController

  def index
    @kittens = Kitten.all.page(params[:page]).per(20)
  end

end

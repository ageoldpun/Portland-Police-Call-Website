class CallsController < ApplicationController

  def index
    if params[:search]
      @calls = Call.paginate(page: params[:page], per_page: 20).where("agency LIKE '%#{params[:search]}%'")
      @markers = Map.markers(@calls)
    else
      @calls = Call.paginate(page: params[:page], per_page: 20)
      @markers = Map.markers(@calls)
    end
  end
end

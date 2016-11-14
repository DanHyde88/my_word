class QueriesController < ApplicationController
  def index
    @queries = Query.all
  end

  def show
    @query = Query.find(params[:id])
    @definition = Query.find_definition(@query)
  end

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)
    begin
      @query.definition = Query.find_definition(@query)
    rescue
      flash.alert = "#{@query.word} was not recognised"
      render new_query_path
      return
    end
    @query.save
    redirect_to queries_path
  end

  def destroy
    @query = Query.find(params[:id])
    @query.delete

    flash.notice = "#{@query.word} was deleted at #{Time.now}"

    redirect_to queries_path
  end

  def query_params
        params.require(:query).permit(:word)
    end
end

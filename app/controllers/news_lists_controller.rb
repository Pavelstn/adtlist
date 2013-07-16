class NewsListsController < ApplicationController
  # GET /news_lists
  # GET /news_lists.json
  load_and_authorize_resource
  #layout "admin"
  def index
    @news_lists = NewsList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news_lists }
    end
  end

  # GET /news_lists/1
  # GET /news_lists/1.json
  def show
    @news_list = NewsList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news_list }
    end
  end

  # GET /news_lists/new
  # GET /news_lists/new.json
  def new
    @news_list = NewsList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news_list }
    end
  end

  # GET /news_lists/1/edit
  def edit
    @news_list = NewsList.find(params[:id])
  end

  # POST /news_lists
  # POST /news_lists.json
  def create
    @news_list = NewsList.new(params[:news_list])

    respond_to do |format|
      if @news_list.save
        format.html { redirect_to @news_list, notice: 'News list was successfully created.' }
        format.json { render json: @news_list, status: :created, location: @news_list }
      else
        format.html { render action: "new" }
        format.json { render json: @news_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news_lists/1
  # PUT /news_lists/1.json
  def update
    @news_list = NewsList.find(params[:id])

    respond_to do |format|
      if @news_list.update_attributes(params[:news_list])
        format.html { redirect_to @news_list, notice: 'News list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_lists/1
  # DELETE /news_lists/1.json
  def destroy
    @news_list = NewsList.find(params[:id])
    @news_list.destroy

    respond_to do |format|
      format.html { redirect_to news_lists_url }
      format.json { head :no_content }
    end
  end
end

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate, except: [:index, :show]
  # GET /posts
  # GET /posts.json
  # layout "special_layout"
  # layout Proc.new {@post.title == "Hello" ? "special_layout" : "application"}
  # layout "special_layout", only: :show
  # layout "special_layout", except: [:index, :edit] 
  def index
    @posts = Post.all
    render locals: {hello: "hello!"}
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    #render_to_string :show
    #render text: "I love Ruby on Rails!"
    #render json: @post
    #render xml: @post
    #render layout: "special_layout"
    #render status: 500
    #head :bad_request, location: post_path(@post)
  end

  # GET /posts/new   
  def new     
    @post = Post.new  
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' } 
	# @post is actually a url equals to 'post_path(@post)'
	# notice: '' is a flash hash, which will be executed in the upcoming request, which means the "show" action, check the show.html.erb.
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }  
        # @post is actually a url equals to 'post_path(@post)'
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
    
    def authenticate

       authenticate_or_request_with_http_basic do
       	|name, password|
	name == 'admin'	&& password == 'secret'
       end
    end
end

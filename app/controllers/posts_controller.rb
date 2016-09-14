class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :checkUser, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def search
    @posts = Post.where("name LIKE ?", "%#{params[:name]}%")
    render template: 'posts/index' 
  end  

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def newResource
    params = component_params
    resources = Resource.where(name: params[:name])

    if resources.count > 0
      resource = resources.first
    else
      resource = Resource.create(resource_params) 
    end
    @post.components.create(resource: resource, quantity: params[:quantity])
  end

  def newStep
    @post.step.create(step_params)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Projeto foi criado.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Projeto foi editado.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.components.clear
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Projeto foi deletado.' }
      format.json { head :no_content }
    end
  end

  def checkUser
    if @post.user != current_user
      redirect_to @post
    end
  end
  
  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:name, :description, :details)
    end

    def component_params
      params.require(:component).permit(:name, :quantity)
    end

    def resource_params
      params.require(:component).permit(:name)
    end

    def step_params
      params.require(:step).permit(:step)
    end
end

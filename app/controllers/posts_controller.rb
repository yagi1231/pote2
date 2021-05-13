class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  
  def index
    @posts = Post.all
    if params[:room].present?
      @posts = @posts.get_by_name params[:room]
      end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user

end

def new
  @post = Post.new
end

def create
  @post = Post.new(
    room: params[:room],
    introduce: params[:introduce],
    address: params[:address],
    fe: params[:fe],
    image_name: "default_user.jpg",
    user_idd: @current_user.id,
   
  )
  if params[:image]
    @post.image_name = "#{@post.room}.jpg"
    image = params[:image]
    File.binwrite("public/post_images/#{@post.image_name}", image.read)
  end 
 if @post.save
    flash[:notice] = "ユーザー登録が完了しました"
    redirect_to("/posts/#{@post.id}")
  else
    render("posts/new")
end
end

def edit
  @post = Post.find_by(id: params[:id])
end

def update            
  @post = Post.find_by(id: params[:id])            
  @post.room = params[:room]            
  @post.introduce = params[:introduce]  
  @post.address = params[:address]            
  @post.fee = params[:fee]  
  if params[:image]
    @post.image_name = "#{@post.id}.jpg"
    image = params[:image]
    File.binwrite("public/post_images/#{@post.image_name}", image.read)
  end 
    
if @post.save    
 flash[:notice] = "ユーザー情報を編集しました"             
 redirect_to("/posts/#{@post.id}")            
else            
  render("posts/edit")            
end 
end  

def destroy
  @post = Post.find(params[:id])
  @post.destroy
  flash[:notice]="スケジュールを削除しました"
  redirect_to :posts
end

def ensure_correct_user
  @post = Post.find_by(id: params[:id])
  if @post.user_idd != @current_user.id
    flash[:notice] = "権限がありません"
    redirect_to("/posts/index")
  end
end


end



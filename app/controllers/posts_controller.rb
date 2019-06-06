class PostsController < ApplicationController
    before_action :authenticate_team!, :only =>[:new,:create,:edit,:update,:destroy]
    
    def show
        if post_exist(params[:id])
            @post = Post.find(params[:id])
        else
            redirect_to posts_path
            flash[:alert] = "存在しない記事です"
        end
        
        
    end
    def index
        @posts = Post.all
    end
    def new
        @post = Post.new
    end
    def create
        @post = Post.create(params.require(:post).permit(:title,:content,:image))
    end
    def edit
        @post = Post.find(params[:id])
    end
    def update
        @post = Post.find(params[:id])
        @post.update(params.require(:post).permit(:title,:content,:image))
    end
    def destroy
        @post = Post.find(params[:id]).destroy
        redirect_to "/posts"
        flash[:alert] = "削除しました"
    end
    
    
    private
    def post_exist(post_id)
        if Post.find_by(id: post_id)
            return true
        else
            return false
        end
    end


end

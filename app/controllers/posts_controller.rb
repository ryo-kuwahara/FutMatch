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
        @post = Post.find_by(id: params[:id])
        if @post
            @post.update(params.require(:post).permit(:title,:content,:image))
            redirect_to "/posts/#{@post.id}/edit"
            flash[:notice] = "編集しました"
        else
            flash[:alert] = "情報編集できませんでした"
            render "welcome/index"
        end
        
    end
    def destroy
        @post = Post.find_by(id: params[:id])
        if @post
            flash[:alert] = "削除しました"
            @post.destroy
            redirect_to "/posts"
        else
            flash[:alert] = "情報削除できませんでした"
            render "welcome/index"
        end
            
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

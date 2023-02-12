class BlogsController < ApplicationController

    def index
        @blogs = Blog.all
    end

    def new
        @blog =Blog.new
    end

    def create
        @blog = Blog.new(title: params[:blog][:title], description: params[:blog][:description])
        if @blog.save 
            flash[:message]= "Blog was successfully saved!"
            redirect_to blogs_path
        else
            render :new, status: :unprocessable_entity
    
        end

    end

    def show
        @blog = Blog.find(params[:id])
    end

    def edit
        @blog = Blog.find(params[:id])
    end

    def update
            @blog = Blog.find(params[:id])
            
            if @blog.update(title: params[:blog][:title], description: params[:blog][:description])
            flash[:message]= "Blog was successfully edited!"
            redirect_to blog_path(@blog)
        else
            render :edit, status: :unprocessable_entity
    
        end
    end

    def destroy
        @blog = Blog.destroy(params[:id])
        if @blog.delete
            flash[:message] = "Selected blog was destroyed!"
            redirect_to blog_path
        end
    end
end


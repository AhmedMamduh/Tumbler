class CommentsController < ApplicationController
	before_action :find_comment, only:[:create, :destroy]


	def create
		@comment = @post.comments.create(params[:comment].permit(:name, :body))

		redirect_to post_path(@post)
	end

	def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path
	end


	private

	def find_comment
		@post = Post.find(params[:post_id])
	end
end

class CommentBroadcastJob < ApplicationJob
	# create comment list
	queue_as :default

	def perform(comment)
		# create channels for all users in this same time
		ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
	end

	def render_comment (comment)
		# render in partial action from comment controller 
		CommentsController.render partial: 'comments/comment', locals: {comment: comment}
	end
end
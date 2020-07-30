class MembersController < ApplicationController

	def create
		@member=Member.new(member_params)
		@member.user_id = current_user.id
		@members=Member.all
		if @member.save
			redirect_to member_path(@member.id)
		else
			render "index"
		end
	end


	def show
		#@members=Member.all
		@member=Member.find(params[:id])
		@user=@member.user
	end

	def index
		@members=Member.all
		@member=Member.new
	end

	def edit
		@member=Member.find(params[:id])
		if @user!=current_user
			redirect_to members_path
		end
	end

	def update
		@member=Member.find(params[:id])
		if @member.update(member_params)
			redirect_to member_path(@member.id)
		else
			render "edit"
		end
	end

	def destroy
		@member=Member.find(params[:id])
		@member.destroy
		redirect_to members_path
	end

	private
	def member_params
		params.require(:member).permit(:namae, :body, :user_id)
	end
end

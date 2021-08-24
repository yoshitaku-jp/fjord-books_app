# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @title = I18n.t '.controllers.common.follower_title'
    @user  = User.find(params[:id])
    @users = @user.following.with_attached_avatar.page(params[:page])
    render 'show_follow'
  end

  def followers
    @title = I18n.t '.controllers.common.following_title'
    @user  = User.find(params[:id])
    @users = @user.followers.with_attached_avatar.page(params[:page])
    render 'show_follow'
  end
end

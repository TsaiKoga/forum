# -*- encoding : utf-8 -*-
class Cpanel::TopicsController < Cpanel::ApplicationController
  def index
    @topics = Topic.unscoped.includes(:user).paginate(page: params[:page], per_page: 20)
  end

  def show
    @topic = Topic.unscoped.find(params[:id])

  end


  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.unscoped.find(params[:id])
  end

  def create
    @topic = Topic.new(params[:topic].permit!)

    if @topic.save
      redirect_to cpanel_topics_path
    else
      render :action => "new"
    end
  end

  def update
    @topic = Topic.unscoped.find(params[:id])

    if @topic.update_attributes(params[:topic].permit!)
      redirect_to cpanel_topics_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @topic = Topic.unscoped.find(params[:id])
    @topic.destroy_by(current_user)

    redirect_to(cpanel_topics_path)
  end

  def undestroy
    @topic = Topic.unscoped.find(params[:id])
    @topic.update_attribute(:deleted_at, nil)
    redirect_to(cpanel_topics_path)
  end

end

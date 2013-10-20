# -*- encoding : utf-8 -*-
class Cpanel::NodesController < Cpanel::ApplicationController
	def index
		@nodes = Node.all
	end

	def show
    @node = Node.find(params[:id])
	end
	
	def new
		@node = Node.new
	end
	
	def create
    @node = Node.new(params[:node].permit!)

    if @node.save
      redirect_to cpanel_nodes_path
    else
      render :action => "new"
    end
	end

	def edit
    @node = Node.find(params[:id])
	end

	def update
    @node = Node.find(params[:id])

    if @node.update_attributes(params[:node].permit!)
      redirect_to cpanel_sections_path
    else
      render :action => "edit"
    end
	end

	def destroy
    @node = Node.find(params[:id])
    @node.destroy

    redirect_to cpanel_sections_url
	end
end

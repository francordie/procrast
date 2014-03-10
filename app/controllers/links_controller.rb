class LinksController < ApplicationController

	def index
		if params[:tag]
			@links = Link.tagged_with(params[:tag])
			logger.error "\n------------------------CON TAG--------------------------\n"
		else
			@links = Link.all
			logger.error "\n------------------------SIN TAG--------------------------\n"
		end
		
		@link = Link.new
	end

	def show
		@link = Link.find(params[:id])
		@tags = Link.tag_counts.map(&:name)
	end

	def edit

	end

	def new
		@link = Link.new(params[:id])		
	end

	def create	
		@link = Link.new(link_params)

		if @link.save
			flash[:success] = "Se agregó el link <b>#{@link.name}</b>"			
		else
			flash[:success] = "No se pudo agregar el tag <b>#{@link.name}</b>"			
		end
		redirect_to links_path
	end	

	def add_tag
		@link = Link.find(params[:id])

		@link.tag_list.add(params[:new_tag], parse: true)

		if @link.save
			flash[:success] = "Se agregó el tag <b>#{params[:new_tag]}</b>"			
		else
			flash[:success] = "No se pudo agregar el tag <b>#{params[:new_tag]}</b>"			
		end
		redirect_to link_path @link
	end

	def remove_tag
		@link = Link.find(params[:id])

		@link.tag_list.remove(params[:tag])

		if @link.save
			flash[:success] = "Se eliminó el tag <b>#{params[:tag]}</b>"			
		else
			flash[:success] = "No se pudo eliminar el tag <b>#{params[:tag]}</b>"			
		end
		redirect_to link_path @link
	end

	private

    def link_params
      params.require(:link).permit(:name, :url, :description, :tag_list)
    end

end

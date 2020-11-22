class AppartmentsController < ApplicationController
    def index
        @building = Building.find params[:building_id]
        @appartments = @building.appartments #mostrar todos los appartmentes asociados al building 
    end

    def show
        @building = Building.find params[:building_id]
        @appartment = Appartment.find(params[:id])    
    end

    def new
        @building = Building.find(params[:building_id]) 
        @appartment = Appartment.new 
          
    end

    def create
        @building = Building.find params[:building_id]
        @appartment = Appartment.new(appartment_params)

        @appartment.building = @building #valor ya definido por url anidada

        respond_to do |format|
            if @appartment.save
                format.html { redirect_to building_appartment_path(@building, @appartment), notice: 'Apartment was succesfully created.'}
            else
                format.html { render :new }
            end
        end
    end

    def  edit
        @building = Building.find params[:building_id]
        @appartment = Appartment.find params[:id]
    end

    def  update
        @building = Building.find params[:building_id]
        @appartment = Appartment.find params[:id]
        respond_to do |format|
            if @appartment.update(appartment_params.merge(building: @building))
                format.html { redirect_to building_appartment_path(@building, @appartment), notice: 'Apartment was succesfully created.'}
            else
                format.html { render :new }
            end
        end
    end

    def destroy
        @appartment = Appartment.find params[:id]
        @appartment.destroy
        respond_to do |format|
            format.html { redirect_to building_appartments_url, notice: "Appartment was succesfully destroyed" }
        end
    end

    
    
    def appartment_params
        params.require(:appartment).permit(:number) #ya no requiere de building_id ya que viene por url anidada
    end
end

class SetoresController < ApplicationController
  before_action :set_setor, only: [:show, :edit, :update, :destroy]

  # GET /setores
  # GET /setores.json
  def index
    @setores = Setor.all.paginate(page: params[:page], per_page: 10)
  end

  # GET /setores/1
  # GET /setores/1.json
  def show
  end

  # GET /setores/new
  def new
    @setor = Setor.new
  end

  # GET /setores/1/edit
  def edit
  end

  # POST /setores
  # POST /setores.json
  def create
    @setor = Setor.new(setor_params)

    respond_to do |format|
      if @setor.save
        format.html { redirect_to @setor, notice: 'Setor was successfully created.' }
        format.json { render :show, status: :created, location: @setor }
      else
        format.html { render :new }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /setores/1
  # PATCH/PUT /setores/1.json
  def update
    respond_to do |format|
      if @setor.update(setor_params)
        format.html { redirect_to @setor, notice: 'Setor was successfully updated.' }
        format.json { render :show, status: :ok, location: @setor }
      else
        format.html { render :edit }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setores/1
  # DELETE /setores/1.json
  def destroy
    @setor.destroy
    respond_to do |format|
      format.html { redirect_to setores_url, notice: 'Setor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setor
      @setor = Setor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setor_params
      params.require(:setor).permit(:codsetor, :nomesetor, :filial_id)
    end
end

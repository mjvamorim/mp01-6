class FiliaisController < ApplicationController
  before_action :set_filial, only: [:show, :edit, :update, :destroy]

  # GET /filiais
  # GET /filiais.json
  def index
    @filiais = Filial.all
  end

  # GET /filiais/1
  # GET /filiais/1.json
  def show
  end

  # GET /filiais/new
  def new
    @filial = Filial.new
  end

  # GET /filiais/1/edit
  def edit
  end

  # POST /filiais
  # POST /filiais.json
  def create
    @filial = Filial.new(filial_params)

    respond_to do |format|
      if @filial.save
        format.html { redirect_to @filial, notice: 'Filial was successfully created.' }
        format.json { render :show, status: :created, location: @filial }
      else
        format.html { render :new }
        format.json { render json: @filial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /filiais/1
  # PATCH/PUT /filiais/1.json
  def update
    respond_to do |format|
      if @filial.update(filial_params)
        format.html { redirect_to @filial, notice: 'Filial was successfully updated.' }
        format.json { render :show, status: :ok, location: @filial }
      else
        format.html { render :edit }
        format.json { render json: @filial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filiais/1
  # DELETE /filiais/1.json
  def destroy
    @filial.destroy
    respond_to do |format|
      format.html { redirect_to filiais_url, notice: 'Filial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filial
      @filial = Filial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def filial_params
      params.require(:filial).permit(:nomefilial, :uf, :telefone)
    end
end

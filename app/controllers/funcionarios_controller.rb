class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]

  # GET /funcionarios
  # GET /funcionarios.json
  def index
    # buscar o sexo
   
    @psexo = params[:psexo]
    # buscar o nome
    @pnome = params[:pnome]

    filtro = "1=1"
    
    if  @psexo ==  "M"
      filtro = filtro + " and sexo = 'M' "
    end
    if  @psexo ==  "F"
      filtro = filtro + " and sexo = 'F' "
    end

    if not(@pnome.nil?)
       filtro = filtro + " and nome like '%"+@pnome+"%'"
    end

#   @funcionarios = Funcionario.where(filtro).order("nome")
    @funcionarios = Funcionario.where(filtro).order("nome").paginate(page: params[:page], per_page: 3)

  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to @funcionario, notice: 'Funcionario was successfully created.' }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1
  # PATCH/PUT /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to @funcionario, notice: 'Funcionario was successfully updated.' }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    @funcionario.destroy
    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: 'Funcionario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def listar

    @funcionarios = Funcionario.all.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.pdf do
        pdf = FuncionariosReport.new(@funcionarios)
        send_data pdf.render, filename: 'FuncionariosListagem.pdf', :width => pdf.bounds.width,
        type: 'application/pdf', disposition: :inline, :page_size => "A4", :page_layout => :portrait
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionario_params
      params.require(:funcionario).permit(:matricula, 
        :nome, :endereco, :telefone, :salario, :sexo, :dtadmissao, :foto, :setor_id, :cargo_id)
    end
end

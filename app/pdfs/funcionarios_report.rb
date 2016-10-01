class FuncionariosReport < Prawn::Document
  
  def initialize(funcionarios)
    super()
    @totsal = 0
    @funcionarios = funcionarios
    header
    text_content
    table_content
    sumary
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 100
  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 540, :height => 50) do
      text "Coordenação de Cursos Superiores de Informática", size: 15, style: :bold
      text "Listagem de funcionarios Complementares", size: 12, style: :bold
    end

   

  end

  def table_content
    # This makes a call to funcionario_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table funcionario_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [90,200, 200, 50]
    end
  end

  def funcionario_rows
    [['Matricula','Nome',  'Salario']] +
      @funcionarios.map do |funcionario|
      [funcionario.matricula,funcionario.nome,  funcionario.salario]
      end
  end
  
  def sumary
    @funcionarios.each do |funcionario|
     @totsal += funcionario.salario if funcionario.salario
    end
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 540, :height => 50) do
          text "Total Salario: #{@totsal} ", size: 15, style: :bold
    end
  end
end
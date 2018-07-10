require_relative "ui_livraria"

class Livro
	attr_reader :titulo, :ano_de_lancamento, :reimpressao
	attr_accessor :quantidade, :preco #leitura e escrita de dados
	#attr_writer # somente escrita de dados
	
	def initialize(titulo, ano_de_lancamento, preco, reimpressao, quantidade)
		@titulo = titulo
		@ano_de_lancamento = ano_de_lancamento.to_i
		reimpressao == 'S' ? reim = true : reim = false
		@reimpressao = reim
        @preco = calcula_preco(preco)
        puts "#{@preco}"
		@quantidade = quantidade.to_i
	end
	
	def to_csv(livro)
		ui_csv_livro(livro)
	end

	def get_attr(livro)
		ui_dados_livro(livro)
	end

	private
	#calcula novo preço com base em descontos
	def calcula_preco(preco) 
		if @ano_de_lancamento < 2006 and @reimpressao
            puts"entrei1"
            preco = preco * 0.9
            return preco
		elsif @ano_de_lancamento < 2006 and !@reimpressao
            puts"entrei2"
            preco *= 0.95
            return preco
		elsif 2006 <= @ano_de_lancamento and @ano_de_lancamento <= 2010
            puts"entrei3"
            preco *= 0.96  
            return preco
		elsif @ano_de_lancamento > 2010
            puts"entrei4"
            return preco	
        end 
    end
    
    def method_missing(name)
        puts "method missing"       
    end

    def respond_to(name)
        puts "respond to" 
    end

end

class Estoque
	attr_reader :livros
	
	def initialize
		@livros = []	
	end

	def imprime_estoque
		puts "\nLista de livros cadastrados ============="
		livros.each do |livro|
			livro.get_attr(livro)
		end
	end

	def imprime_csv
		puts "\nLista de livros cadastrados (csv) ============="
		livros.each do |livro|
			livro.to_csv(livro)
		end
	end

	def adiciona_livro(livro)
		if livro == livro
			livros << livro
		end
	end
end
# ============================================================================ #

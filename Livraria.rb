require_relative 'ui_livraria'

class Livro
	attr_reader :titulo, :ano_de_lancamento, :reimpressao
	attr_accessor :quantidade, :preco #leitura e escrita de dados
	#attr_writer # somente escrita de dados
	
	def initialize(titulo, ano_de_lancamento, preco, reimpressao, quantidade)
		@titulo = titulo
		@ano_de_lancamento = ano_de_lancamento.to_i
		@preco = calcula_preco(preco,reimpressao)

		reimpressao == 'S' ? reim = true : reim = false
		@reimpressao = reim
		
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
	def calcula_preco(preco,reimpressao) 
		if @ano_de_lancamento < 2006 and reimpressao
			return preco *= 0.9
		elsif @ano_de_lancamento < 2006 and !reimpressao
			return preco *= 0.95
		elsif 2006 <= @ano_de_lancamento and @ano_de_lancamento <= 2010
			return preco *= 0.96
		elsif @ano_de_lancamento > 2010
			return preco	
		end 
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

system("clear")

agile = Livro.new("Agile Ruby Web",2010,100,true,1)
livro_ac = Livro.new("Arquitetura de Computadores",1990,50,true,2)
livro_c = Livro.new("C++ Programmer",2007,200,false,3)

estoque = Estoque.new
estoque.adiciona_livro(agile)
estoque.adiciona_livro(livro_ac)
estoque.adiciona_livro(livro_c)

puts "\nEu Li! Livraria do VN - - - - - - - - - - - - - - - - - - - -\n"


begin
	action = ui_menu
	
	case action.to_i
	when 1 # ver estoque
		estoque.imprime_estoque	
	when 2 #add livro

		dados = ui_add_livro 
		# dados[titulo > ano > preço > reimpressão > quantidade]
		livro = Livro.new(dados[0],dados[1],dados[2],dados[3],dados[4])
		estoque.adiciona_livro(livro)

	when 3
		#busca
	when 4
		#delete
	when 5
		#exit
	end

	if action.to_i == 5
		puts "Deseja realmente sair? (S/N)"
		confirma = gets.strip
		confirma.upcase == 'S' ? action = 5: action = 0 
	end
	
end	while action.to_i != 5




# Quantidades de um livro e do estoque
# Remover e adicionar livros
# menu

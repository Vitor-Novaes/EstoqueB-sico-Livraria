require_relative 'ui_livraria'
require_relative 'models'
system("clear")

# db seed
	agile = Livro.new("Agile Ruby Web",2010,100,true,1)
	livro_ac = Livro.new("Arquitetura de Computadores",1990,50,true,2)
	livro_c = Livro.new("C++ Programmer",2007,200,false,3)
	estoque = Estoque.new
	estoque.adiciona_livro(agile)
	estoque.adiciona_livro(livro_ac)
	estoque.adiciona_livro(livro_c)
#

puts "\nEu Li! Livraria do VN - - - - - - - - - - - - - - - - - - - -\n"
begin
	action = ui_menu
	
	case action.to_i
	when 1 # ver estoque
		system("clear")
		estoque.imprime_estoque()
		ui_next_enter()
	when 2 #add livro
		dados = ui_add_livro() 
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

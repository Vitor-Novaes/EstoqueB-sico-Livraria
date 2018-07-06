def ui_menu
	puts "\nMenu Principal ==================\n"
	puts "(1) - - - - - Livros Cadastrados"
	puts "(2) - - - - - Adicionar Livro" 
	puts "(3) - - - - - Buscar Livro"
	puts "(4) - - - - - Remover Livro"
	puts "(5) - - - - - Sair"
	action = gets.strip 
	action
end

def ui_dados_livro(livro)
	puts "\t|"
	puts "\t|Título: #{livro.titulo}"
	puts "\t|Ano de Lançamento: #{livro.ano_de_lancamento}"
	puts "\t|Preço: #{livro.preco}"
	puts "\t|Quantidade: #{livro.quantidade}"
	livro.reimpressao == true ? reim = "Sim" : reim = "Não"
	puts "\t|Reimpressao: #{reim}"
end

def ui_csv_livro(livro)
	puts "\t#{livro.titulo},#{livro.ano_de_lancamento},#{livro.preco}"
end

def ui_add_livro
	puts "Titulo :"
	titulo = gets.strip
	puts "Ano de Lançamento :"
	ano = gets.strip
	puts "Preço :"
	preco = gets.strip
	puts "Quantidade :"
	quant = gets.strip
	puts "Reimpressao (S/N) :"
	reimpressao = gets.upcase.strip
	[titulo,ano,preco,reimpressao,quant]
end
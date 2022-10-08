require_relative 'operations'

module Calculator
  class Menu
    def initialize
      @op = Operations.new
      print " -------------------------\n"
      print "| Bem vindo a calculadora |\n"
      print " -------------------------\n\n"
      print "1. Media preconceituosa\n"
      print "2. Calculadora sem números\n"
      print "3. Filtrar filmes\n"
      print "4. Sair\n\n"
      print "Sua opção: "
      @resultado = gets.chomp
      chooseOperation
    end

    def chooseOperation
      case @resultado
      when "1" 
        biased_mean({"Tomás":10, "Iury":10, "Vini":10, "Arnaldo": 9.2}, 'Iury Tomás')
      when "2"
        print "Informe aqui o numero para saber se é divisível"
        no_integers()
      when "3"
        print "Gêneros disponíveis: \nComedy, Fantasy, Crime, Drama, Music, Adventure, History, Thriller, Animation, Family, Mystery, Biography, Action, Film-Noir, Film-Noir, Romance, Sci-Fi, War, Western, Horror, Musical, Sport\n"
        print "Escolha quantos gêneros quiser para filtrar(separado por espaços): "
        genre = gets.chomp
        genre.to_s
        print "Escolha um ano de lançamento: "
        year = gets.chomp
        year.to_i
        @op.filter_films(genre, year)
      when "4"
        
      else
        puts "Infelizmente não existe essa opção!"
      end
    end

  end
end

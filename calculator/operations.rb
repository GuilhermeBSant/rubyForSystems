require_relative '../extra_operations'
require 'net/http'
require 'json'

module Calculator
  class Operations
    include ExtraOperations
  
    def biased_mean(grades, blacklist)
      
    end
  
    def no_integers(numbers)
      arrayForNumbers = numbers.split
      finalArray = arrayForNumbers.map do |i|
        if(i.length >= 2)
          if(i.end_with?("00") || i.end_with?("25") || i.end_with?("50") || i.end_with?("50"))
            "S"
          else
            "N"
          end 
        else
          "N"
        end
      end
      puts finalArray
    end
  
    def filter_films(genres, year)

      def fixString(string)
        downcaseString = string.downcase
        fistLetterUp = downcaseString[0].upcase
        finalString = downcaseString
        finalString[0] = fistLetterUp
        return finalString
      end

      movieCounter = 0
      genreCount = 0
      
      films = get_films()
      print "\n----------Filmes Disponíveis----------\n\n"
      movies = films[:movies].map do |key|
      

        moviesGenresArray = []
        moviesGenresArray.push(key[:genres])
        
        genresArray = genres.split
        genresArray.map! do |s| 
          string = fixString(s)
          string
        end

        movieYear = key[:year].to_i

        if(movieYear >= year.to_i)

          if(genresArray.length == 1)
            genresArray.each do |i|
              if(moviesGenresArray[0].include?(i))
                movieCounter += 1 
                puts key[:title]
              end
            end
          else 
          arrayForCompare = moviesGenresArray[0].select do |i|
            genresArray.include?(i)
          end
          movieCounter += 1 
          if(arrayForCompare == genresArray)
            puts key[:title]
          end
           
          end

        end  

    end

    if(movieCounter==0)
      print "Não há filmes com esses filtros selecionados no nosso catálogo :(\n"
    end

    print "\n--------------------------------------\n\n"

    end
    
    private
  
    def get_films
      url = 'https://raw.githubusercontent.com/yegor-sytnyk/movies-list/master/db.json'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      return JSON.parse(response, symbolize_names: true)
    end
  end
end

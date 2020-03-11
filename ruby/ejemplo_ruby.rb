# IMPORTANTE!!!
# Esta clase es para mostrar ejemplos de código Ruby puro
# No tiene nada que ver con un proyecto de Ruby on Rails
class EjemploRuby

  def suma(a, b)
  	a + b
  end

  def siguiente(a)
  	a.next
  end

  def saludo(n)
  	nombre = n
  	"Hola #{nombre}"
  end

  def saludo2
  	puts "Hello World"
		print 'Enter your name: '
		name = gets
		puts "Hello #{name}"
		5.times { puts "Hola"  }
	end

  def alreves(texto)
  	texto.reverse
  end

  def largo(texto)
  	texto.length
  end

  def arrays
  	ary = [1, 2, "3"]
  	puts ary

  	ary = ary + ["foo", "bar"]
  	puts ary

  	puts ary * 2
  	puts ary[0]
		puts ary[0,2]
		puts ary[-2]
		puts ary[-2,2]
		puts ary[-2..-1]

		str = ary.join(':')
		puts str
		puts str.split(':')
  end  	

  def estructuras
  	animales = ["gato", "perro", "loro"]
  	persona = {:nombre => "Pedro", :apellido => "Ricciard"}
  end

  def hashes
  	h = {1 => 2, "2" => "4"}
		puts h[1]
		puts h["2"]
		puts h[5]
		h[5] = 10  # añadimos un valor
		
		puts h

		puts h[1]=nil # borramos un valor
		puts h[1]
		puts h
	end

	def estr_control_case
		i=8
		case i
		when 1, 2..5
			puts "1..5\n"
		when 6..10
			puts "6..10\n"
		end

		case 'abcdef'
		when 'aaa', 'bbb'
		  print "aaa o bbb\n"
		when /def/
			print "incluye /def/\n"
		end
	end

	def estr_control_while
		i = 0
    print "Es cero.\n" if i == 0
    print "Es negativo\n" if i < 0
    print "#{i+=1}\n" while i < 3
  end

  def estr_control_for
  	for num in (4..6)
    	print num, "\n"
    end

    numbers = [1, 2, 3, 4, 6, 5]
    
    numbers.each do | n |
    	puts n
    end

    numbers.sort
    for n in numbers
    	puts n
    end
  end

  def estr_control_map
  	animales = ["perro", "gato", "loro", "pez", "conejo"]

  	animales.map do | a |
  		a.size if a.size.even?
  	end

  	animales.map { | a | a.size if a.size.even? }

  	unless animales.empty?
  		if animales.include?(:elefante) # Con paréntesis
  			puts "Sí, la lista incluye elefante"
  		elsif animales.include? :koala # Sin paréntesis
  			puts "La lista incluye koala!"
  		else
  			puts "No se encontró lo que estás buscando"
  		end
  	end
  end

  def adivinanza
  	words = ['foobar', 'baz', 'quux']
		secret = words[rand(3)]

		print "adivina? "
		while guess = STDIN.gets
		  guess.chop!
		  if guess == secret
		    print "¡Ganas!\n"
		    break
		  else
		    print "Lo siento. Pierdes\n"
		  end
		  print "adivina? "
		end
		print "La palabra era ", secret, ".\n"
	end
end
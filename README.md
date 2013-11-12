# Practica9 - Matrices Densas y Dispersas

##Description

En esta practica se procedera a implementar una clase abstracta de la que heredaran dos clases a su vez: Matrices_Densas y Matrices_Dispersas.
Ambas clases seran implementadas de manera diferente para conseguir asi optimizar memoria y obtener mayor velocidad de procesamiento a la hora de trabajar con matrices grandes.

La clase Matrices_Densas se implementara como un array bidimensional para facilitar el acceso a los elementos de la misma, mientras que la clase Matrices_Dispersas se implementara con dos arrays, uno con el valor de los elementos y otro con la posicion de los mismos dentro de la matriz. Esto permite ahorrar espacio a la hora de guardar las matrices dispersas ya que se consideran todos los elementos no guardados como cero y unicamente se almacenan los valores utiles de la matriz.

## Installation

Add this line to your application's Gemfile:

    gem 'practica9'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install practica9

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# = Función de Máximo común divisor de dos numeros.
# Esta funciçón es utilizada por la clase Fracciones.

def gcd(u, v)
  u, v = u.abs, v.abs
  while v != 0
    u, v = v, u % v
  end
  u
end

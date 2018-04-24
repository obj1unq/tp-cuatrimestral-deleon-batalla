object rolando
{
	var bando = bandoDelSur			
  	var luchaBase = 3
  	var hechiceriaBase = 1
  	var artefactos = #{}
  	var luchaAdicional = 0
  	var hechiceriaAdicional = 0
 method incrementarLuchaBase()
{
    luchaBase += 1
}
 method incrementarHechiceriaBase()
{
    hechiceriaBase += 1
}
 method obtenerArtefacto(unArtefacto)
{
    artefactos.add(unArtefacto)
    luchaAdicional = artefactos.sum({artefacto => artefacto.valorDeLucha(self)})
    hechiceriaAdicional =artefactos.sum({artefacto => artefacto.valorDeHechiceria(self)})
}

method lucha()
{
 return luchaBase + luchaAdicional
}
method hechiceria()
{
 return hechiceriaBase + hechiceriaAdicional
}
method luchaBase()
{
	return luchaBase
}
method hechiceriaBase(){
	return hechiceriaBase
}
method mejorArtefacto()
{	
	
	//return artefactos.filter(NoMeSalioLaCondicion).max({unArtefacto => unArtefacto.sumaDeValores(self)})
}
method encontrarElemento(unElemento)
{
	unElemento.aplicarEfecto(self)
}
method bando()
{
	return bando
}
}
object espadaDelDestino
{
	method valorDeLucha(capo)
	{
		return 3
	}
	method valorDeHechiceria(capo)
	{
		return 0
	}
	method sumaDeValores(capo)
	{
		return self.valorDeLucha(capo)+ self.valorDeHechiceria(capo)
	}
}
object libroDeHechizos
{
	method valorDeLucha(capo)
	{
		return 0
	}
	method valorDeHechiceria(capo)
	{
		return capo.hechiceriaBase()
	}
	method sumaDeValores(capo)
	{
		return self.valorDeLucha(capo) + self.valorDeHechiceria(capo)
	}
}
object collarDivino
{
	method valorDeLucha(capo)
	{
		return 1
	}
	method valorDeHechiceria(capo)
	{
		return 1
	}
	method sumaDeValores(capo)
	{
		return self.valorDeLucha(capo) + self.valorDeHechiceria(capo)
	}
	
}	
object armadura
{
	var refuerzo = ninguna
	var luchaAdicional = 0 
	var hechiceriaAdicional = 0
	
	method valorDeLucha(capo)
	{
		return 2 + luchaAdicional
	}
	method valorDeHechiceria(capo)
	{
		return 0 + hechiceriaAdicional
	}
	method cambiarRefuerzo(unRefuerzo ,capo)
	{
	    refuerzo =unRefuerzo
	    luchaAdicional = unRefuerzo.efectoLucha(capo)
	    hechiceriaAdicional = unRefuerzo.efectoHechiceria(capo)
	}
	method sumaDeValores(capo)
	{
		return self.valorDeLucha(capo) + self.valorDeHechiceria(capo)
	}
	
}
object cotaDeMalla
{
	method efectoLucha(capo)
	{
		return 1
	}
	method efectoHechiceria(capo)
	{
		return 0
	}
}
object bendicion
{
	method efectoLucha(capo)
	{
		return 0
	}
	method efectoHechiceria(capo)
	{
		return 1
	}	
}
object hechizo
{
	method efectoLucha(capo)
	{
		return 0
	}
	method efectoHechiceria(capo)
	{
		if(capo.hechiceriaBase()>3)
		{
			return 2
		}
		else
		{
			return 0
		}
	}
}
object ninguna
{
	method efectoLucha(capo)
	{
		return 0
	}
	method efectoHechiceria(capo)
	{
		return 0
	}
}
object espejoFantastico
{
	method valorDeLucha(capo)
	{
		return capo.mejorArtefacto().valorDeLucha()
	}
	method valorDeHechiceria(capo)
	{
		return capo.mejorArtefacto().valorDeHechiceria()
	}
}
object cofrecitoDeOro
{
	method aplicarEfecto(capo)
	{
		capo.bando().agregarTesoro()
	}
}
object cumuloDeCarbon
{
	method aplicarEfecto(capo)
	{
		capo.bando().agregarRecursos()
	}
}
object viejoSabio
{
	method aplicarEfecto(capo)
	{
		capo.incrementarLuchaBase()
		capo.incrementarHechiceriaBase()		
	}
}
object bandoDelSur
{
	var tesoro = 0
	var recursos = 0
	method tesoro()
	{
		return tesoro
	}
	method recursos()
	{
		return recursos
	}
	method agregarTesoro()
	{
		tesoro += 100
	}
	method agregarRecursos()
	{
		recursos += 50
	}
}
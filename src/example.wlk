object rolando
{
	var bando = bandoDelSur			
  	var luchaBase = 3
  	var hechiceriaBase = 1
  	var artefactos = #{}
  	var luchaAdicional = 0
  	var hechiceriaAdicional = 0
  	var valorLuchaMejorArtefacto
  	var valorHechiceriaMejorArtefacto
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
    self.mejorArtefacto()
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
	if(not self.soloHayEspejo()){
		valorLuchaMejorArtefacto = artefactos.filter({unElemento =>not unElemento.esEspejo()})
		.max({unArtefacto => unArtefacto.sumaDeValores(self)}).valorDeLucha(self)
		valorHechiceriaMejorArtefacto= artefactos.filter({unElemento =>not unElemento.esEspejo()})
		.max({unArtefacto => unArtefacto.sumaDeValores(self)}).valorDeHechiceria(self)
	}
	else
	{
		valorLuchaMejorArtefacto = 0
		valorHechiceriaMejorArtefacto = 0
}

}
	
method valorLuchaMejorArtefacto()
{
	return valorLuchaMejorArtefacto
}
method valorHechiceriaMejorArtefacto()
{
	return valorHechiceriaMejorArtefacto
}

method encontrarElemento(unElemento)
{
	unElemento.aplicarEfecto(self)
}
method bando()
{
	return bando
}
method soloHayEspejo()
{
	return artefactos.contains(espejoFantastico) && artefactos.size()==1
}
}
object espadaDelDestino
{
	method esEspejo(){
		return false
	}
	
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
	method esEspejo(){
		return false
	}
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
	method esEspejo(){
		return false
	}
	
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
	method esEspejo(){
		return false
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
		return capo.valorLuchaMejorArtefacto()
	}
	method valorDeHechiceria(capo)
	{
		return capo.valorHechiceriaMejorArtefacto()
	}
	method esEspejo(){
		return true
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
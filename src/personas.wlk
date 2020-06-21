import carpas.*
import cervezas.*
class Persona {
	var property peso
	var property jarrasCompradas = []
	const property gustaMusicaTrad
	const property aguante
	const property marcasPreferidas = []
	const property pais
	method leGusta(cerveza)
	method comprarCerveza(cual){jarrasCompradas.add(cual)}
	method alcoholIngerido(){return jarrasCompradas.sum({jarra=>jarra.cantidadDeAlcohol()})}
	method estaEbrio(){return (self.alcoholIngerido() * peso) > aguante}
	method quiereEntrarA(carpa){return self.leGusta(carpa.marcaCerveza()) and self.gustaMusicaTrad() == carpa.tieneBanda()}
	method esEmpedernido(){return jarrasCompradas.all({jarra=>jarra.capacidad() >= 1})}
	method esPatriota(){return jarrasCompradas.all({jarra=>jarra.marca().origen() == self.pais()})}
	
}

class Belga inherits Persona {
	override method leGusta(cerveza){return cerveza.lupulo() > 4}
}

class Checo inherits Persona {
	override method leGusta(cerveza){return cerveza.graduacion() > 8}
}	

class Aleman inherits Persona {
	override method leGusta(cerveza){return true}
	override method quiereEntrarA(carpa){return super(carpa) and carpa.personasDentro().size().even()}
}

object belgica{}
object republicaCheca{}
object alemania{}
object usa{}
object paisesBajos{}
object irlanda{}
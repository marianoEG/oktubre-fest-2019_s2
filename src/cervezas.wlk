class Cerveza {
	var property lupulo
	var property origen
	var property graduacion = 0
	method graduacion(){return graduacion}
}

class CervezaRubia inherits Cerveza {
	
}

class CervezaNegra inherits Cerveza {
	const graduacionNegras = graduacionReglamentaria
	override method graduacion(){return graduacionNegras.valor().min(lupulo*2)}	 
}

class CervezaRoja inherits CervezaNegra {
	override method graduacion(){return super() * 1.25}
}

class Jarra {
	const property capacidad
	var property marca
	method cantidadDeAlcohol(){return capacidad * (marca.graduacion()/100)}
}

object graduacionReglamentaria {
	var property valor = 9
}
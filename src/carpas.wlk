import personas.*
import cervezas.*
class Carpa {
	var property capacidad
	var property tieneBanda
	const property marcaCerveza
	var property personasDentro = []
	
	method permiteIngreso(persona){return not persona.estaEbrio() and capacidad - personasDentro > 0}
	method puedeEntrar(persona){return persona.quiereEntrarA(self) and self.permiteIngreso(persona)}
	method entrar(persona){
		if (self.puedeEntrar(persona)){personasDentro.add(persona)} 
		else {throw new Exception(message = "No puede ingresar compañero")}
	}
	method servir(persona,cuanto){
		if (personasDentro.contains(persona)){persona.comprarCerveza(new Jarra(capacidad=cuanto, marca=self.marcaCerveza()))}
		else{throw new Exception(message = "EROR, no se encuentra el cliente")}
	}
	method cuantosEbriosEmpedernidos(){
		return personasDentro.count({ persona => persona.esEmpedernido() })
	}
}

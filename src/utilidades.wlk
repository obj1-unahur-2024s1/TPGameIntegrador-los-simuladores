import wollok.game.*

class Celda{
	const property position
	const property id
	method image() 
	method dibujar(){
		if(not self.estaDibujado()){
			game.addVisual(self)
		}
	}
	method borrar(){
		if(self.estaDibujado()){
			game.removeVisual(self)
		}
	}
	method resetear() // implementar, me parece que para cada uno va a ser distinto, asi que capaz que hay que implementar en cada subclase en vez de esta super
	
	method estaDibujado()= game.hasVisual(self)
}

class CeldaEstado inherits Celda{
	var estado = "Inicial"
	const ruta
	override method image()= ruta+estado+".png" 
	
	method posicionCorrecta(){
		estado = "Correcto"
	}
	
	method posicionEquivocada(){
		estado = "Errado"
	}
	
	method noLaContiene(){
		estado = "Inexistente"
	}
	
	method inicial(){
		estado = "Inicial"
	}
	
	override method resetear(){}
}

class CeldaLetra inherits Celda{
	const property letra
	
	override method image()= "letras/"+letra+".png"
	
	override method resetear(){}
	
}

class CeldaTimer inherits Celda{
	var caracter
	override method image()= "timer/"+caracter+".png"
	
	override method resetear(){}
	
	method actualizarCaracter(nuevoCaracter){
		caracter = nuevoCaracter
	}
}

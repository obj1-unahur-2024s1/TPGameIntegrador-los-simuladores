import wollok.game.*

//representa la clase base de un objeto visual en pantalla
class Celda{
	
	//contiene la posicion de la celda
	const property position
	
	//id unico para poder identificar celdas en particular
	const property id
	
	method image()
	
	//dibuja esta celda si no esta ya dibujada
	method dibujar(){
		if(not self.estaDibujado()){
			game.addVisual(self)
		}
	}
	
	//borra esta celda si es que esta dibujada
	method borrar(){
		if(self.estaDibujado()){
			game.removeVisual(self)
		}
	}
	method resetear() // implementar, me parece que para cada uno va a ser distinto, asi que capaz que hay que implementar en cada subclase en vez de esta super
	
	//devuelve si esta celda esta dibujada
	method estaDibujado()= game.hasVisual(self)
}

//representa el estado de una celda
class CeldaEstado inherits Celda{
	
	//contiene el estado de esta celda
	var estado = "Inicial"
	
	//contiene la ruta del archivo necesario
	const ruta
	
	//devuelve la imagen que debe dibujarse
	override method image()= ruta+estado+".png" 
	
	//cambia el estado a Correcto
	method posicionCorrecta(){
		estado = "Correcto"
	}
	
	//cambia el estado a Erroneo
	method posicionEquivocada(){
		estado = "Errado"
	}
	
	//cambia el estado a Inexistente
	method noLaContiene(){
		estado = "Inexistente"
	}
	
	//cambia el estado a Inicial
	method inicial(){
		estado = "Inicial"
	}
	
	//cambia el estado al azar
	method unEstado(){
		const estados=["Correcto", "Errado", "Inexistente"].anyOne()
		estado = estados
	}
	
	override method resetear(){}
}

//representa una letra
class CeldaLetra inherits Celda{
	
	//contiene la letra que se quiere dibujar
	const property letra
	
	//devuelve la imagen de la letra a dibujar
	override method image()= "letras/"+letra+".png"
	
	override method resetear(){}
	
}

//celdas que se usan para dibujar elementos del timer
class CeldaTimer inherits Celda{
	//representa el caracter del timer que se quiere representar
	var caracter
	
	//devuelve la imagen de la letra a dibujar
	override method image()= "timer/"+caracter+".png"
	
	override method resetear(){}
	
	//cambia el caracter a representar
	method actualizarCaracter(nuevoCaracter){
		caracter = nuevoCaracter
	}
}

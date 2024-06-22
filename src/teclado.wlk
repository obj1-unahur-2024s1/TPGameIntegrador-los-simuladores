import datos.*
import utilidades.*
import wollok.game.*
import componentes.*
import tablero.*

// celda que representa una tecla en el teclado
class CeldaTecla inherits Celda{
	
	const property teclaQueRepresenta
	
	//contiene el estado de la tecla
	const property celdaEstado = new CeldaEstado(id="estadoTecla"+teclaQueRepresenta, position=self.position(), ruta="celdasTeclado/celdaTeclado")
	
	//contiene la letra que representa esta tecla
	const celdaLetra = new CeldaLetra(id="letraTecla"+teclaQueRepresenta, letra=teclaQueRepresenta, position = position) 
	
	// contiene el input de esta tecla
	const input = new Key(keyCodes=[self.keyCodeInput()])
	
	// devuelve el keyCode apropiado segun la tecla que se quiera representar
	method keyCodeInput(){
		if(teclaQueRepresenta != "Delete" and teclaQueRepresenta != "Enter"){
			return "Key"+teclaQueRepresenta.toUpperCase()
		}
		else{
			return teclaQueRepresenta
		}
	}
	
	override method image(){}
	
	//dibuja todos los elementos de la tecla, y agrega su evento
	override method dibujar(){
		celdaEstado.dibujar()
		celdaLetra.dibujar()
		self.agregarEvento()
	}
	
	//agrega el evento correspondiente a la tecla
	method agregarEvento(){
		input.onPressDo({
			self.presionar(teclaQueRepresenta)
		})
	}
	
	//realiza la accion deseada al momento de presionar esta tecla
	method presionar(teclaPresionada){
		if("Enter" == teclaPresionada){
			tablero.enterPresionado()
		}else if("Delete" == teclaPresionada){
			tablero.deletePresionado()
		}else{
			tablero.teclaPresionada(teclaPresionada)
		}
	}
	
	//resetea la tecla a su estado inicial
	override method resetear(){
		celdaEstado.inicial()
	}
	
}

object teclado inherits Componente{ 
 
	method initialize(){
		
		posicionesTeclas.lista().forEach({
			letra, posicion =>
			elementos.add(new CeldaTecla(teclaQueRepresenta=letra, position=posicion))
			console.println(letra)
		})
		elementos.get(0).celdaEstado().estado("Delete")
		elementos.get(1).celdaEstado().estado("Enter")	
	}
	
	// devuelve la tecla que representa la letra deseada
	method teclaQueRepresentaALaLetra(letra)= elementos.find({ tecla => tecla.teclaQueRepresenta() == letra })
	
}

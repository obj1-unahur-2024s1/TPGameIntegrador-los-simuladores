import datos.*
import utilidades.*
import wollok.game.*
import componentes.*
import tablero.*

// celda que representa una tecla en el teclado
class CeldaTecla inherits Celda{
	
	//contiene el estado de la tecla
	const property celdaEstado = new CeldaEstado(id="estadoTecla"+id, position=self.position(), ruta="celdasTeclado/celdaTeclado")
	
	//contiene la letra que representa esta tecla
	const celdaLetra = new CeldaLetra(id="letraTecla"+id, letra=id, position = position)
	
	
	override method image(){}
	
	//dibuja todos los elementos de la tecla, y agrega su evento
	override method dibujar(){
		celdaEstado.dibujar()
		celdaLetra.dibujar()
		self.agregarEvento()
	}
	
	//agrega el evento correspondiente a la tecla
	method agregarEvento(){
		keyboard.letter(id).onPressDo({
			self.presionar(id)
		})
	}
	
	//realiza la accion deseada al momento de presionar esta tecla
	method presionar(id){
		// manda mensaje a tablero para que se añada la letra
		tablero.teclaPresionada(id)
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
			elementos.add(new CeldaTecla(id=letra, position=posicion))
		})
	}
	
	// Actualiza el estado de las celdas del teclado
	method actualizarCeldasCorrespondientes(celdasAActualizar, nuevosEstados) {
		
		// Genera 5 números
		(0..4).forEach({
			
			//								Primer argumento es la posición de la celda, 							el segundo es su nuevo estado
			numero => self.actualizarCelda( posicionesTeclas.posicionAsociadaALaTecla( celdasAActualizar.get(numero) ), nuevosEstados.get(numero) )
		})
	}
	
	// Actualiza el estado de una celda dada su posición
	method actualizarCelda(posicion, nuevoEstado){
		
		// getObjectsIn devuelve la letra y la celda, get(0) devuelve la celda
		const celdaAModificar = game.getObjectsIn( posicion ).get(0)
		
		if(nuevoEstado == "Correcto"){
			celdaAModificar.posicionCorrecta()
		}
		else if( nuevoEstado == "Errado" ){
			celdaAModificar.posicionEquivocada()
		}
		else{
			celdaAModificar.noLaContiene()
		}
	}
}
















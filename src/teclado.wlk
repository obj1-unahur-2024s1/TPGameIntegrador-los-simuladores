import datos.*
import utilidades.*
import wollok.game.*
import componentes.*


class CeldaTecla inherits Celda{
	const celdaEstado = new CeldaEstado(id="estadoTecla"+id, position=self.position(), ruta="celdasTeclado/celdaTeclado")
	const celdaLetra = new CeldaLetra(id="letraTecla"+id, letra=id, position = position)
	
	
	override method image(){}
	
	override method dibujar(){
		celdaEstado.dibujar()
		celdaLetra.dibujar()
		self.agregarEvento()
	}
	
	method agregarEvento(){
		keyboard.letter(id).onPressDo({
			self.presionar()
		})
	}
	
	method presionar(){
		// manda mensaje a tablero para que se añada la letra
	}
	
	override method resetear(){
		celdaEstado.inicial()
	}
}

object teclado inherits Componente{ 
 
	method initialize(){
		
		abecedario.lista().forEach({
			letra, posicion =>
			elementos.add(new CeldaTecla(id=letra, position=posicion))
		})
	}
}
















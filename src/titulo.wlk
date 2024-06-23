import utilidades.*
import componentes.*
import wollok.game.*


// celda que representa una letra de wollok
class CeldaTitulo inherits Celda{
	
	const letra
	//contiene el estado de la letra de wollok
	const celdaEstado = new CeldaEstado(position=self.position(), ruta="celdasPalabra/celda")
	
	//contiene la letra que representa
	const celdaLetra = new CeldaLetra(letra=letra, position = position)
	
	override method image(){}
	
	//dibuja el titulo wollok con distintos estados 
	override method dibujar(){
		
		celdaEstado.unEstado()
		celdaEstado.dibujar()
		celdaLetra.dibujar()
	}

	override method resetear(){}
}

// contiene las posiciones de las letras del titulo
object posicionesLetrasTitulo {
	const property lista = new Dictionary()
	
	method initialize(){
		
		lista.put("w",game.at(12,25))
		lista.put("o",game.at(14,25))
		lista.put("l",game.at(16,25))
		lista.put("l1",game.at(12,23))
		lista.put("o1",game.at(14,23))
		lista.put("k",game.at(16,23))
	}	
}

object titulo inherits Componente{
	method initialize(){
		posicionesLetrasTitulo.lista().forEach({
			letra, posicion =>
			elementos.add(new CeldaTitulo(letra=letra.take(1), position=posicion))
		})
	}

}



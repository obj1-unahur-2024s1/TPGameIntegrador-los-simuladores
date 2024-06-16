import utilidades.*
import componentes.*
import wollok.game.*

// celda que representa una letra de wollok
class CeldaTitulo inherits Celda{
	
	//contiene el estado de la letra de wollok
	const celdaEstado = new CeldaEstado(
		id="estadoTitulo"+id, position=self.position(), ruta="celdasPalabra/celda"
	)
	
	//contiene la letra que representa
	const celdaLetra = new CeldaLetra(
		id="letraTitulo"+id, letra=id.take(1), position = position
	)
	
	override method image(){
		
	}
	
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
		
		lista.put("w",game.at(12,24))
		lista.put("o",game.at(14,24))
		lista.put("l",game.at(16,24))
		lista.put("l1",game.at(12,22))
		lista.put("o1",game.at(14,22))
		lista.put("k",game.at(16,22))
	}	
}

object titulo inherits Componente{
	method initialize(){
		posicionesLetrasTitulo.lista().forEach({
			letra, posicion =>
			elementos.add(new CeldaTitulo(id=letra, position=posicion))
	}
	
	)}
	
}



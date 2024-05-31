import datos.*
import utilidades.*
import wollok.game.*


class Tecla inherits Celda{
	const property idLetra
	const property celdaEstado = new CeldaEstado(ruta="celdasTeclado/celdaTeclado",position=self.position())

	override method image()= "letras/"+idLetra+".png"
	
	method dibujarTecla(){
		celdaEstado.dibujar()
		game.addVisual(self)
	}
}

object teclado{
	const property teclas = []
	
	method generar(){
		teclas.clear()
		abecedario.inicializar()
		abecedario.lista().forEach({
			clave, valor =>
			teclas.add(new Tecla(idLetra=clave, position=valor))
		})
	}
	
	method dibujarTeclado(){
		teclas.forEach({
			t => 
			t.dibujarTecla()
		})
	}
}

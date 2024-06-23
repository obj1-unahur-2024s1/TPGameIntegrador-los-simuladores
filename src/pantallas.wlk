import utilidades.*
import wollok.game.*
import componentes.*
import timer.*
import teclado.*
import titulo.*
import tablero.*
import juego.*

class Pantalla{
	
	const componentes = []
	
	method dibujar(){
		componentes.forEach({
			componente => componente.agregarElementos()
		})
	}
	
	method eliminar(){
		self.resetear()
		//componentes.forEach({
		//	componente => componente.borrarElementos()
		//})
		game.clear()
	}
	
	method resetear(){}
}

class CeldaPantalla inherits Celda{
	const imagen
	
	override method image()= "pantallas/pantalla"+imagen+".png"
	override method resetear(){}
}



object pantallaInicio inherits Pantalla{
	method initialize(){
		componentes.add(new Componente(elementos = [new CeldaPantalla(imagen="Inicio", id= "celdaPantallaInicio", position = game.at(0,0))]))
		componentes.add(inputsMenus)
	}
}

object pantallaGanador inherits Pantalla{
	
	method initialize(){
		componentes.add(new Componente(elementos = [new CeldaPantalla(imagen="Ganador", id= "celdaPantallaInicio", position = game.at(0,0))]))
		componentes.add(inputsMenus)
	}
}

object pantallaPerdedor inherits Pantalla{
	
	method initialize(){
		componentes.add(new Componente(elementos = [new CeldaPantalla(imagen="Perdedor", id= "celdaPantallaInicio", position = game.at(0,0))]))
		componentes.add(inputsMenus)
	}
}

object inputsMenus inherits Componente{
	override method agregarElementos(){
		
		// iniciar partida facil
		keyboard.num1().onPressDo( {
			pantallaJuego.esPorTiempo(false)
			juego.cambiarPantalla(pantallaJuego)
		} )
		
		//iniciar partida dificil
		keyboard.num2().onPressDo( {
			pantallaJuego.esPorTiempo(true)
			juego.cambiarPantalla(pantallaJuego)
		}/**iniciar partida dificil*/)
	}
}

object pantallaJuego inherits Pantalla(componentes = [tablero,teclado,titulo,timer]){
	var property esPorTiempo = false
	override method dibujar(){
		super()
		timer.habilitarSiEsNecesario(esPorTiempo)
	}
	
	override method resetear(){
		componentes.forEach({ componente => componente.resetearElementos()})
		
	}
	

}

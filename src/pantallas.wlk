import utilidades.*
import wollok.game.*
import componentes.*

class Pantalla{
	
	const componentes = []
	
	method dibujar(){
		componentes.forEach({
			componente => componente.agregarElementos()
		})
	}
	
	method eliminar(){
		/**componentes.forEach({
			componente => componente.borrarElementos()
		})*/
		game.clear()
	}
	
	method reset(){}
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

object pantallaFinPartida inherits Pantalla{
	
	const gano = true
	
	method imagenCorrespondiente() = if(gano){"Ganador"}else{"Perdedor"}
	
	method initialize(){
		componentes.add(new Componente(elementos = [new CeldaPantalla(imagen=self.imagenCorrespondiente(), id= "celdaPantallaInicio", position = game.at(0,0))]))
		//componentes.add(inputsMenus)
	}
}

object inputsMenus inherits Componente{
	override method agregarElementos(){
		keyboard.num1().onPressDo( {console.println("facil")} /**iniciar partida facil*/)
		keyboard.num2().onPressDo( {console.println("dificil")}/**iniciar partida dificil*/)
	}
}

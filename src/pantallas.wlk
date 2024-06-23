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
	const tiempoAOtraPantalla = 2000
	const esDeTransicion
	
	method dibujarPantalla(){
		self.dibujarComponentes()
		if(esDeTransicion){
			self.pasarAPantallaDificultad()
		}
	}
	
	method dibujarComponentes(){
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
	
	method pasarAPantallaDificultad(){
		game.schedule(tiempoAOtraPantalla, {juego.cambiarPantalla(pantallaDificultad)})
	}
}

class CeldaPantalla inherits Celda{
	const imagen
	
	override method image()= "pantallas/"+imagen+".png"
	override method resetear(){}
}

object pantallaDificultad inherits Pantalla(esDeTransicion = false){
	method initialize(){
		componentes.add(new Componente(elementos = [new CeldaPantalla(imagen="pantallaDificultad", id= "celdaPantallaInicio", position = game.at(0,0))]))		
		componentes.add(inputsMenus)
	}
}

object pantallaInicio inherits Pantalla(esDeTransicion = true, tiempoAOtraPantalla = 10000){
	method initialize(){
		componentes.add(new Componente(elementos = [new CeldaPantalla(imagen="pantallaInicio", id= "celdaPantallaInicio", position = game.at(0,0))]))		
	}
}

object pantallaGanador inherits Pantalla(esDeTransicion = true){
	
	method initialize(){
		componentes.add(new Componente(elementos = [new CeldaPantalla(imagen="pantallaGanador", id= "celdaPantallaInicio", position = game.at(0,0))]))
	}
}

object pantallaPerdedor inherits Pantalla(esDeTransicion = true){
	
	method initialize(){
		componentes.add(new Componente(elementos = [new CeldaPantalla(imagen="pantallaPerdedor", id= "celdaPantallaInicio", position = game.at(0,0))]))
	}
}

object inputsMenus inherits Componente{
	override method agregarElementos(){
		
		// iniciar partida facil
		keyboard.f().onPressDo( {
			pantallaJuego.esPorTiempo(false)
			game.schedule(500, {juego.cambiarPantalla(pantallaJuego)})
			
		} )
		
		//iniciar partida dificil
		keyboard.d().onPressDo( {
			pantallaJuego.esPorTiempo(true)
			game.schedule(500, {juego.cambiarPantalla(pantallaJuego)})
		}/**iniciar partida dificil*/)
	}
}

object pantallaJuego inherits Pantalla(esDeTransicion = false, componentes = [tablero,teclado,titulo,timer,new Componente(elementos = [new CeldaPantalla(imagen="infoInstrucciones", id= "celdaPantallaInicio", position = game.at(11,0))])]){
	var property esPorTiempo = false
	override method dibujarPantalla(){
		super()
		timer.habilitarSiEsNecesario(esPorTiempo)
	}
	
	override method resetear(){
		componentes.forEach({ componente => componente.resetearElementos()})
		
	}
	

}

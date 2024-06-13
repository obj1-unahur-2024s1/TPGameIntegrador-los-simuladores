import componentes.*
import utilidades.*
import wollok.game.*


object timer inherits Componente{
	const tiempoEnSegundos = 150 
	var tiempoRestante = tiempoEnSegundos
	var	activado = false
	
	
	
	method initialize(){
		elementos.add(new CeldaTimer(caracter="texto", id="timerTexto", position= game.at(20,27)))
		elementos.add(new CeldaTimer(caracter=self.minuto(), id="timerMinuto", position= game.at(26,27)))
		elementos.add(new CeldaTimer(caracter="dosPuntos", id="timerDosPuntos", position= game.at(27,27)))
		elementos.add(new CeldaTimer(caracter=self.segundo1(), id="timerSegundos1", position= game.at(28,27)))
		elementos.add(new CeldaTimer(caracter=self.segundo2(), id="timerSegundos2", position= game.at(29,27)))
		self.activar()
	}
	
	method activar(){ 
		activado = true
		game.schedule(1000, {=>self.actualizar()})
	}
	method resetear(){tiempoRestante = tiempoEnSegundos}
	method desactivar(){ 
		activado = false
		self.resetear()
	}
	
	method minuto()= (tiempoRestante.div(60)).truncate(6).toString()               	// no estan consistentes los calculos pero funcionan bien
	method segundo1()= ((tiempoRestante%60).div(10)).truncate(5).toString()			// sugiero no tocar
	method segundo2()= ((tiempoRestante%60)%10).truncate(5).toString()
	
	method actualizar(){
		if(activado){
			tiempoRestante = tiempoRestante - 1
			game.schedule(1000, { => self.actualizar()})
			elementos.get(1).actualizarCaracter(self.minuto())
			elementos.get(3).actualizarCaracter(self.segundo1())
			elementos.get(4).actualizarCaracter(self.segundo2())
			console.println(tiempoRestante.toString() + " " + self.minuto() + " " +  self.segundo1() + " " +  self.segundo2()) // debug
		}	
	}	
}

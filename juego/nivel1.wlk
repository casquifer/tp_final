import wollok.game.*
import player.*

object suelo {
  method image () = "fondo1.jpg"
  method position() = game.origin()
}

class Portales {
  var image = "portal0.png"
  var position

  method image () = image
  method position() = position
  
  method titila() {
    image = "portal1.png"
    game.schedule(75, {image = "portal2.png"})
    game.schedule(75, {image = "portal3.png"})
    game.schedule(75, {image = "portal0.png"})
  }
}

const portal = new Portales(position = game.at(0,5))
const portal2 = new Portales(position = game.at(11,5))

class Armas {
  var position
  var image

  method position () = position

  method image () = image

  method titila () {
    image = "gun1.png"
    game.schedule(400, {image = "gun0.png"})
  }
}

const arma = new Armas(position = game.at(3,3), image = "gun0.png")

class Placas {
  var position
  var image

  method position () = position

  method image () = image

  method titila () {
    image = "placa1.png"
    game.schedule(400, {image = "placa0.png"})
  }
}

const placa = new Placas (position = game.at(4,4), image = "placa0.png")

object jugarla {
  const ancho = 12 //se mide en celdas de 50 x 50px
  const alto = 12  //se mide en celdas de 50 x 50px
   
  method jugar() {
    game.addVisual(suelo)
    game.title("Pickle Rick")
    game.height(alto) 
	  game.width(ancho)
    game.addVisual(portal)
    game.addVisual(portal2)
    game.addVisual(arma)
    game.addVisual(placa)
    game.addVisual(rata)
    game.addVisualCharacter(rick)
    keyboard.w().onPressDo({ rick.arriba() })
    keyboard.s().onPressDo({ rick.abajo() })
    keyboard.a().onPressDo({ rick.izquierda() })
    keyboard.d().onPressDo({ rick.derecha() })
    keyboard.c().onPressDo({ game.say(rick, "holis") })
    game.onTick(300, "titilaPortal", {portal.titila()})
    game.onTick(300, "titilaPortal2", {portal2.titila()})
    game.onTick(2000, "titilaArma", {arma.titila()})
    game.onTick(2000, "titilaPlaca", {placa.titila()})
    game.onTick(400, "distanciaConRickX", {rata.guardarPositionRicX()})
    game.onTick(400, "distanciaConRickY", {rata.guardarPositionRicY()})
    game.onTick(500, "perseguir", {rata.perseguir()})
  }
}

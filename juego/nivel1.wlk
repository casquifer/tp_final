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


class Lasers {
  var posicion = rick.position()
  var imagen = "laser0.png"

  method image () = imagen

  method position () = posicion
  
  method laserAbajo () {
    posicion = posicion.down(1)
  }

  method laserDerecha () {
    posicion = posicion.right(1)
  } 
  
  method laserIzquierda () {
    posicion = posicion.left(1)
  }

  method laserArriba () {
    posicion = posicion.up(1)
  }

  method disparar () {
    if(rick.image() == "rick0.png" or rick.image() == "rick1.png"){
      imagen = "laser1.png"
      game.addVisual(self)
      game.onTick(200, "laserAbajo", {self.laserAbajo()})
    } else if(rick.image() == "rick2.png" or rick.image() == "rick3.png"){
      imagen = "laser0.png"
      game.addVisual(self)
      game.onTick(200, "laserIzquierda", {self.laserIzquierda()})
    } else if(rick.image() == "rick4.png" or rick.image() == "rick5.png"){
      imagen = "laser1.png"
      game.addVisual(self)
      game.onTick(200, "laserArriba", {self.laserArriba()})
    } else if(rick.image() == "rick6.png" or rick.image() == "rick7.png"){
      imagen = "laser0.png"
      game.addVisual(self)
      game.onTick(200, "laserDerecha", {self.laserDerecha()})
    }
  }
  /*
  method kill(){
    game.removeVisual(self)
  }
  */
}

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
    game.addVisual(rata2)
    game.addVisual(rata3)
    game.addVisualCharacter(rick)
    keyboard.w().onPressDo({ rick.arriba() })
    keyboard.s().onPressDo({ rick.abajo() })
    keyboard.a().onPressDo({ rick.izquierda() })
    keyboard.d().onPressDo({ rick.derecha() })
    game.onTick(300, "titilaPortal", {portal.titila()})
    game.onTick(300, "titilaPortal2", {portal2.titila()})
    game.onTick(2000, "titilaArma", {arma.titila()})
    game.onTick(2000, "titilaPlaca", {placa.titila()})
    game.onTick(800, "perseguir", {rata.perseguir()})
    game.onTick(900, "perseguir2", {rata2.perseguir()})
    game.onTick(1000, "perseguir3", {rata3.perseguir()})

    keyboard.f().onPressDo({const laser new Lasers().disparar()}) //cada vez que apreto F creo un obejeto laser con la clase Lasers y lo disparo
  }
}

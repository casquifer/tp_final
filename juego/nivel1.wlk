import wollok.game.*
import player.*

object suelo {
  method image () = "fondo1.jpg"
  method position() = game.origin()
}

object jugarla {
  const ancho = 12 //se mide en celdas de 50 x 50px
  const alto = 12  //se mide en celdas de 50 x 50px
   
  method jugar() {
    game.addVisual(suelo)
    game.title("Pickle Rick")
    game.height(alto) 
	  game.width(ancho)
    game.addVisual(rata)
    game.addVisualCharacter(rick)
    keyboard.w().onPressDo({ rick.arriba() })
    keyboard.s().onPressDo({ rick.abajo() })
    keyboard.a().onPressDo({ rick.izquierda() })
    keyboard.d().onPressDo({ rick.derecha() })
    keyboard.c().onPressDo({ game.say(rick, "holis") })
  }
}

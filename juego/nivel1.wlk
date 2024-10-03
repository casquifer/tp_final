import wollok.game.*
import player.*

object suelo {
  method image () = "piedras.jpg"
  method position() = game.origin()
}

object jugarla {
  const ancho = 12 //se mide en celdas de 50 x 50px
  const alto = 12  //se mide en celdas de 50 x 50px
   
  method jugar() {
    //game.addVisual(suelo)
    game.title("Pickle Rick")
    game.height(alto) 
	  game.width(ancho)
    game.addVisualCharacter(rick)
    keyboard.up().onPressDo({ rick.arriba() })
    keyboard.down().onPressDo({ rick.abajo() })
    keyboard.left().onPressDo({ rick.izquierda() })
    keyboard.right().onPressDo({ rick.derecha() })
  }
}

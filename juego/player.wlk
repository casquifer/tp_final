object rick {

  var posicion = game.at(5,5)
  var imageRick = "rick0.png"
  
  method image () = imageRick
  method position() = posicion

  method derecha() {
    imageRick = "rick7.png"
    posicion = posicion.right(0.5)
    game.schedule(200, {imageRick = "rick6.png"})
    posicion = posicion.right(0.5)
  }

  method izquierda() {
    imageRick = "rick3.png"
    posicion = posicion.left(0.5)
    game.schedule(200, {imageRick = "rick2.png"})
    posicion = posicion.left(0.5)
  }

  method arriba() {
    imageRick = "rick5.png"
    posicion = posicion.up(0.5)
    game.schedule(200, {imageRick = "rick4.png"})
    posicion = posicion.up(0.5)
  }

  method abajo() {
    imageRick = "rick1.png"
    posicion = posicion.down(0.5)
    game.schedule(200, {imageRick = "rick0.png"})
    posicion = posicion.down(0.5)
  }
}

object rata {

  var posicion = game.at(5,5)
  var imageRick = "rata0.png"
  
  method image () = imageRick
  method position() = posicion

  method derecha() {
    imageRick = "rata7.png"
    posicion = posicion.right(0.5)
    game.schedule(200, {imageRick = "rata6.png"})
    posicion = posicion.right(0.5)
  }

  method izquierda() {
    imageRick = "rata3.png"
    posicion = posicion.left(0.5)
    game.schedule(200, {imageRick = "rata2.png"})
    posicion = posicion.left(0.5)
  }

  method arriba() {
    imageRick = "rata5.png"
    posicion = posicion.up(0.5)
    game.schedule(200, {imageRick = "rata4.png"})
    posicion = posicion.up(0.5)
  }

  method abajo() {
    imageRick = "rata1.png"
    posicion = posicion.down(0.5)
    game.schedule(200, {imageRick = "rata0.png"})
    posicion = posicion.down(0.5)
  }
}

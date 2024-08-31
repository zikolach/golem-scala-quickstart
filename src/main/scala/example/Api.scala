package example

trait Api {
  import scala.scalajs.js
  import scala.scalajs.js.JSConverters._

  type WitResult[+Ok, +Err] = Ok
  object WitResult {
    def ok[Ok](value: Ok): WitResult[Ok, Nothing] = value

    def err[Err](value: Err): WitResult[Nothing, Err] =
      throw js.JavaScriptException(value)

    val unit: WitResult[Unit, Nothing] = ()
  }

  def initializeCart(userId: String): WitResult[String, String]
  def addItem(item: ProductItem): Unit
  def removeItem(productId: String): Unit
  def updateItemQuantity(productId: String, quantity: Integer): Unit
  def checkout(): CheckoutResult
  def cartContents(): WitList[ProductItem]

  type WitList[T] = js.Array[T]
  object WitList {
    def fromList[T](items: List[T]): WitList[T] = js.Array(items: _*)
  }
}

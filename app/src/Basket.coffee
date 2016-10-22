class Basket
    constructor: ->
        @items = []
        @distinctCount = 0
        @totalCount = 0

    add: (item, quantity) ->
        if @itemExistsInBasket item.id
            curItemLoc = @getItemLocation item.id
            @items[curItemLoc].quantity += quantity
        else
            @items.push {
                "item_id": item.id,
                "quantity": quantity,
                "item": item
                }
            @distinctCount++
        @totalCount+= quantity

    getQuantity: (item_id) ->
        for item in @items
            return item.quantity if item.item_id is item_id
        false

    itemExistsInBasket: (item_id) ->
        for item in @items
            return true if item.item_id is item_id
        false

    getItemLocation: (item_id) ->
        count = 0
        for item in @items
            return count if item.item_id is item_id
            count++
        false

    calculateTotal: ->
        total = 0
        for item in @items
            total += item.item.cost * item.quantity
        total

window.Basket = Basket

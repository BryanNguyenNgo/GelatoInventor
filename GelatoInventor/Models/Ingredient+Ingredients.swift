//
//  Ingredient+Ingredients.swift
//  Sample Foundation Models
//
//  Created by Bryan Nguyen on 6/11/25.
//

import Foundation

extension Ingredient {
    // MARK: - Flavours
    static let chocolate = Ingredient(category: .flavour, name: "Chocolate", emoji: "🍫")
    static let vanilla = Ingredient(category: .flavour, name: "Vanilla", emoji: "🍨")
    static let strawberry = Ingredient(category: .flavour, name: "Strawberry", emoji: "🍓")
    static let cookiesAndCream = Ingredient(category: .flavour, name: "Cookies & Cream", emoji: "🍪")
    static let pistachio = Ingredient(category: .flavour, name: "Pistachio", emoji: "🧆")
    static let mint = Ingredient(category: .flavour, name: "Mint", emoji: "🍵")
    static let passionFruit = Ingredient(category: .flavour, name: "Passion Fruit", emoji: "🥭")
    static let coconut = Ingredient(category: .flavour, name: "Coconut", emoji: "🥥")
    static let caramel = Ingredient(category: .flavour, name: "Caramel", emoji: "🍯")
    static let coffee = Ingredient(category: .flavour, name: "Coffee", emoji: "☕️")
    static let mango = Ingredient(category: .flavour, name: "Mango", emoji: "🥭")
    static let matcha = Ingredient(category: .flavour, name: "Matcha", emoji: "🍃")
    static let hazelnut = Ingredient(category: .flavour, name: "Hazelnut", emoji: "🌰")

    // MARK: - Toppings
    static let sprinkles = Ingredient(category: .topping, name: "Sprinkles", emoji: "✨")
    static let whippedCream = Ingredient(category: .topping, name: "Whipped Cream", emoji: "🍦")
    static let chocolateChips = Ingredient(category: .topping, name: "Chocolate Chips", emoji: "🍫")
    static let caramelSauce = Ingredient(category: .topping, name: "Caramel Sauce", emoji: "🍯")
    static let marshmallows = Ingredient(category: .topping, name: "Marshmallows", emoji: "☁️")
    static let crushedNuts = Ingredient(category: .topping, name: "Crushed Nuts", emoji: "🥜")
    static let brownieBits = Ingredient(category: .topping, name: "Brownie Bits", emoji: "🍩")
    static let oreoCrumbs = Ingredient(category: .topping, name: "Oreo Crumbs", emoji: "🍪")
    static let gummyBears = Ingredient(category: .topping, name: "Gummy Bears", emoji: "🧸")
    static let waferSticks = Ingredient(category: .topping, name: "Wafer Sticks", emoji: "🥖")

    // MARK: - Fruits
    static let banana = Ingredient(category: .fruit, name: "Banana", emoji: "🍌")
    static let blueberry = Ingredient(category: .fruit, name: "Blueberry", emoji: "🫐")
    static let raspberry = Ingredient(category: .fruit, name: "Raspberry", emoji: "🍇")
    static let kiwi = Ingredient(category: .fruit, name: "Kiwi", emoji: "🥝")
    static let pineapple = Ingredient(category: .fruit, name: "Pineapple", emoji: "🍍")
    static let watermelon = Ingredient(category: .fruit, name: "Watermelon", emoji: "🍉")
    static let cherry = Ingredient(category: .fruit, name: "Cherry", emoji: "🍒")
    static let peach = Ingredient(category: .fruit, name: "Peach", emoji: "🍑")
    static let apple = Ingredient(category: .fruit, name: "Apple", emoji: "🍎")
    static let grape = Ingredient(category: .fruit, name: "Grape", emoji: "🍇")

    

    
    static let allFlavours: [Ingredient] = [
        chocolate, vanilla, strawberry, cookiesAndCream, pistachio,
        mint, passionFruit, coconut, caramel, coffee, mango, matcha, hazelnut
    ]

    static let allToppings: [Ingredient] = [
        sprinkles, whippedCream, chocolateChips, caramelSauce, marshmallows,
        crushedNuts, brownieBits, oreoCrumbs, gummyBears, waferSticks
    ]

    static let allFruits: [Ingredient] = [
        banana, blueberry, raspberry, kiwi, pineapple,
        watermelon, cherry, peach, apple, grape
    ]

    static let allIngredients: [Ingredient] = allFlavours + allToppings + allFruits
}

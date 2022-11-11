//
//  Post.swift
//  Navigation
//
//  Created by Pavel Grigorev on 20.10.2022.
//

import Foundation

struct Post {

    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int

}

let post1 = Post(author: "sport.express", description: """
                 Фавориты ЧМ-2022 по футболу: Бразилия или Португалия? Расклады чемпионата мира 2022
                 Бразилия — главный фаворит, последний шанс Месси, Португалия всех удивит? Расклады ЧМ-2022
                 """, image: "worldcup", likes: 134, views: 200)

let post2 = Post(author: "autonews.ru", description: """
                10 крутых автоновинок, которые стоит ждать в России в 2023 году
                Китайский двойник Porsche Panamera, кроссовер в стиле советской «Победы», внедорожник на базе Peugeot из Ирана и другие интересные новинки, которые уже в скором времени могут добраться до России

                Подробнее на Autonews:
                https://www.autonews.ru/news/
                """, image: "autonews", likes: 56, views: 151)

let post3 = Post(author: "Новости кино", description: """
                Хронометраж фильма «Аватар: Путь воды» (Avatar: The Way of Water) составит около 3 часов и 10 минут — такой информацией делится издание The Hollywood Reporter со ссылкой на собственные источники. Первый «Аватар», релиз которого состоялся в 2009 году, длился чуть больше 2 часов и 40 минут. Таким образом THR подтверждает намёки Джеймса Кэмерона о том, что сиквел будет идти дольше трёх часов.
                """, image: "avatar2", likes: 999, views: 1888)

let post4 = Post(author: "vc.ru", description: """
                Выбрали популярные подборки пользователей и материалы редакции о нейросетях, которые могут по текстовому запросу отредактировать изображение, нарисовать новое, «придумать» к нему описание, «раскрасить» чёрно-белую картинку и другое
                """, image: "neuro", likes: 268, views: 666)

var postArray: [Post] = [post1, post2, post3, post4]

# Color Palette Explorer

n factorial

## Getting Started

### Данное веб приложение написано на flutter + firebase

Сам сайт опубликован <a href = "https://kokeyev.github.io/color_palette_app/index.html">тут</a> (заходите пж с ПК, на телефон не адаптирован)

Для запуска локально (localhost):
* <a href = "https://developer.android.com/studio">Download Android studio</a>
* <a href = "https://docs.flutter.dev/get-started/install">Download flutter</a>
* Choose Chrome (web) <br>
  ![image](https://github.com/kokeyev/color_palette_explorer/assets/81364897/c0669ea1-40db-49e7-8a80-1efc950eea3c)
* Press Run "main.dart" <br>
  ![image](https://github.com/kokeyev/color_palette_explorer/assets/81364897/104a150c-4c54-4e99-b0c4-2ce13ed88341)
* Откроется бразуер chrome *localhost: числа* (сайт немного долго загружается). Одной из причиной не загрузки контента сайта может быть слабый интернет!


На главной странице отображается все кастомные карточки пользователей, с именами. Все карточки сохраняются в firebase. 
Если навести мышку на карточку, то можно просмотреть hex код цвета, а если тапнуть на него, то скопировать.

Чтобы сгенерировать свою карточку, необходимо нажать кнопку "Generate". Откроется другое окно, где можно будет создать свою карточку. Изначально сайт генерирует рандомные цвета (каждый раз). Далее вы можете крутить два слайдера чтобы выбрать оттенок цвета и насыщенность. Нажав на "Publish", откроется alertDialog где нужно ввести свое имя. Ваша карточка сохранена в firebase и Вас перекинет на главную страницу, где первая карточка будет ваша

Проблемы и компромиссы в приложении:
* slider-ы съезжают (родительский контейнер и сам slider разной ширины, скорее всего из-за этого)
* отказ от "лайков". в firebase я добавил field like, но не успел его добавить в приложение
* отказ от фильтрации по цветам, стилям и кол-во цветов. тут наоброт, я нарисовал front, но не успел сделать back

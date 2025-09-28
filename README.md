# 🚀 ЛР2: Верстка экранов и управление состоянием

## 📋 Содержание
- [🏗️ Вёрстка экрана, виджет Scaffold](#-вёрстка-экрана-виджет-scaffold)
  - [⚙️ Основные свойства виджета Scaffold](#️-основные-свойства-виджета-scaffold)
- [💾 Хранение состояния StatefulWidget](#-хранение-состояния-statefulwidget)
- [📝 Задания](#-задания)

---

## 🎯 Введение

После знакомства с основами вёрстки индивидуальных виджетов, можно перейти к рассмотрению того, как с их помощью компонуется разметка отдельного экрана.
## 🏗️ Вёрстка экрана, виджет Scaffold

Как правило, основой любого экрана в Flutter приложения служит виджет [`Scaffold`](https://api.flutter.dev/flutter/material/Scaffold-class.html).

> 💡 **`Scaffold`** - это виджет из библиотеки Material, который используется для формирования базовой структуры экрана приложения.

`Scaffold` формирует экран с использованием основных компонентов Material Design:
- 📱 `AppBar` (верхняя панель)
- 📝 `Drawer` (боковое меню)
- ➕ `FAB` (кнопка быстрого действия)  
- 🧭 `BottomNavigationBar` (нижняя навигация)

Это обеспечивает построение UI в соответствии со стандартами дизайна Google.

> ℹ️ **Для iOS стиля:** Если приложение требуется реализовать с использованием системного iOS стиля, то необходимо использовать `CupertinoPageScaffold` - аналог `Scaffold`, формирующего экран в соответствии со стандартами iOS.

Однако, в большинстве случаев разработчики используют виджет `Scaffold`. Далее кратко рассмотрим его основные свойства.
### ⚙️ Основные свойства виджета Scaffold

`Scaffold` формирует основной каркас экрана Material Design приложения, рассмотрим из чего он состоит и какие свойства содержит.

> 🚀 **Запустите проект** из ветки лабораторной работы, чтобы ознакомиться с примером использования виджета `Scaffold`.

#### 📄 Пример использования Scaffold

```dart
class ScaffoldScreen extends StatefulWidget {
  const ScaffoldScreen({super.key});

  @override
  State<ScaffoldScreen> createState() => _ScaffoldScreenState();
}

class _ScaffoldScreenState extends State<ScaffoldScreen> {
  // 📋 Элементы нижней навигации
  final _navigationBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
  ];

  int counter = 0; // 🔢 Счетчик для демонстрации состояния

  // 📣 Показ уведомлений
  void handlePressed({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 300)
      )
    );
  }

  // ➕ Обработка нажатия FAB
  void handleFabPressed() {
    setState(() {
      counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 📱 Верхняя панель приложения
      appBar: AppBar(
        title: const Text('Лабораторная работа 2'),
        actions: [
          IconButton(
            onPressed: () => handlePressed(
              context: context, 
              message: 'Настройки нажаты'
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
        backgroundColor: Colors.teal[300],
      ),
      
      // ➕ Кнопка быстрого действия
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: handleFabPressed,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      
      // 📝 Боковое меню
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Меню', style: TextStyle(color: Colors.white)),
            ),
            ListTile(title: Text('Пункт 1')),
            ListTile(title: Text('Пункт 2')),
          ],
        ),
      ),
      
      // 🧭 Нижняя навигация
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationBarItems,
        onTap: (index) {
          handlePressed(
            context: context, 
            message: 'Нажат пункт "${_navigationBarItems[index].label}"'
          );
        },
      ),
      
      // 📄 Основное содержимое
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Основное содержимое экрана'),
            Text('Счетчик: $counter'),
          ],
        )
      ),
    );
  }
}
```

#### 🔧 Ключевые свойства `Scaffold`

| Свойство | Описание |
|----------|-----------|
| 📱 **`appBar`** | Верхняя панель экрана, содержит заголовок, дополнительные кнопки, меню. Используется [`AppBar`](https://api.flutter.dev/flutter/material/AppBar-class.html) |
| ➕ **`floatingActionButton`** | Кнопка быстрого действия Material Design (**FAB**). Используется [`FloatingActionButton`](https://api.flutter.dev/flutter/material/FloatingActionButton-class.html) |
| 📍 **`floatingActionButtonLocation`** | Управляет положением FAB на экране (центр, край и т.д.) |
| 📝 **`drawer`** | Боковая панель, открывается кнопкой/жестом. Для навигационного меню. Используется [`Drawer`](https://api.flutter.dev/flutter/material/Drawer-class.html) |
| 🧭 **`bottomNavigationBar`** | Нижняя панель навигации для переключения между разделами. Используется [`BottomNavigationBar`](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html) |
| 📄 **`body`** | Основное содержимое экрана |

> 📖 **Дополнительная информация:** Класс `Scaffold` содержит ещё множество полезных свойств, с особенностями работы которых можно ознакомиться в [официальной документации](https://api.flutter.dev/flutter/material/Scaffold-class.html).

---

## 💾 Хранение состояния StatefulWidget

**StatefulWidget** и **StatelessWidget** - это два основных типа виджетов во Flutter.

Вы могли заметить, что код примера использования виджета `Scaffold` содержит два класса:

> 📋 **Структура StatefulWidget:**
> - 🏗️ Класс `ScaffoldScreen` наследует от `StatefulWidget`
> - 🔄 Класс `_ScaffoldScreenState` наследует от `State<ScaffoldScreen>`

### 🔄 Как работает StatefulWidget

`StatefulWidget` используется в тех случаях, когда интерфейс зависит от **изменяемого состояния** - некоторых данных, при изменении которых он должен **перестраиваться**, чтобы отобразить изменённые данные.

> 💡 **Важный принцип:** 
> - 🔒 Сам виджет остаётся неизменным
> - 🏭 В методе `createState` создаёт объект состояния - `State`
> - 📊 Объект `State` содержит всю изменяемую логику и управляет обновлением UI

### 💾 Жизненный цикл состояния

Класс `State` создаётся **один раз** и сохраняется между всеми перестроениями интерфейса, что позволяет сохранять:

- 📝 Введённый пользователем текст
- 🔍 Выбранный параметр фильтра  
- 🔢 Значение счётчика (как в нашем примере)
- 🎚️ Любые другие пользовательские данные

### 🔄 Метод setState()

Вызов метода `setState()` в классе `_ScaffoldScreenState` позволяет сообщить Flutter о том, что произошло изменение состояния виджета и необходима **перерисовка**.

#### 📄 Пример использования setState:

```dart
void handleFabPressed() {
  setState(() {
    counter += 1; // 🔢 Изменяем состояние
  });
  // 🎨 Flutter автоматически перерисует виджет
}
```

> ⚡ **Результат:** Каждое нажатие на FAB приводит к:
> 1. 📈 Изменению состояния (увеличение счётчика)
> 2. 🎨 Автоматической перерисовке виджета
> 3. 👁️ Отображению нового значения на экране

> 📖 **Подробнее:** С особенностями сохранения состояния и `StatefulWidget` можно ознакомиться в [официальной документации](https://docs.flutter.dev/get-started/fundamentals/state-management).
---

## 📝 Задания

### 🟢 Задание 1 • Лёгкая сложность

**Цель:** Сверстать экран `OnboardingScreen`

**📎 Ресурсы:**
- [🎨 Макет в Figma](https://www.figma.com/design/V3S7KFvoSf1W6QADG8t8ly/%D0%9C%D0%B5%D1%81%D1%82%D0%B0-%D1%81-%D0%BF%D1%80%D0%BE%D1%82%D0%BE%D1%82%D0%B8%D0%BF%D0%BE%D0%BC?node-id=237-5604&t=rvg0Z1QZRgc2mqUa-4)

**Требования:**
- ✅ Три страницы с изображением, заголовком и текстом
- ✅ Индикатор текущей страницы  
- ✅ Кнопки «Пропустить» и «На старт»


---

### 🟡 Задание 2 • Средняя сложность

**Цель:** Сверстать экран `PlaceDetailScreen`

**📎 Ресурсы:**
- [🎨 Макет в Figma](https://www.figma.com/design/V3S7KFvoSf1W6QADG8t8ly/%D0%9C%D0%B5%D1%81%D1%82%D0%B0-%D1%81-%D0%BF%D1%80%D0%BE%D1%82%D0%BE%D1%82%D0%B8%D0%BF%D0%BE%D0%BC?node-id=303-4517&t=rvg0Z1QZRgc2mqUa-4)

**Требования:**
- ✅ Галерея изображений (`PageView`)
- ✅ Детальная информация о месте
- ✅ Кнопка «В избранное»


---

### 🔴 Задание 3 • Высокая сложность  

**Цель:** Сверстать экран `FilterScreen`

**📎 Ресурсы:**
- [🎨 Макет в Figma](https://www.figma.com/design/V3S7KFvoSf1W6QADG8t8ly/%D0%9C%D0%B5%D1%81%D1%82%D0%B0-%D1%81-%D0%BF%D1%80%D0%BE%D1%82%D0%BE%D1%82%D0%B8%D0%BF%D0%BE%D0%BC?node-id=237-1062&t=rvg0Z1QZRgc2mqUa-4)

**Требования:**
- ✅ Слайдер радиуса поиска
- ✅ Выбор категорий мест
- ✅ Кнопка сброса фильтра  
- ✅ Кнопка «Показать (n)» зафиксирована внизу


---

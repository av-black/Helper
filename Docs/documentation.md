# Техническая документация проекта «Helper»

## 1. Общее описание

Мобильное приложение для iOS, состоящее из четырёх основных экранов, объединённых в `UITabBarController`:

1. **News** — лента новостей, загружаемых с сервера
2. **Map** — карта с элементами управления масштабом и геолокацией
3. **Weather** — экран погоды с данными с сервера
4. **Profile** — профиль пользователя (имя, фамилия, почта, локация)

---

## 2. Технический стек

| Язык - Swift
| UI-фреймворк - UIKit
| Архитектура - MVVM + Coordinator
| Верстка - SnapKit
| Кеширование изображений - SDWebImage
| Работа с картой - MapKit
| Сетевой слой - URLSession (либо Alamofire — уточняется отдельно)
| Менеджер зависимостей - Swift Package Manager / CocoaPods (уточняется отдельно)

---

## 3. Настройки проекта

- **Ориентация экрана:** только портретная (Portrait)
- **Поддержка версий iOS:** три последние актуальные версии iOS на момент релиза (например, iOS 16, 17, 18 — актуализировать перед стартом разработки)
- **Целевые устройства:** iPhone
- **Минимальная deployment target:** соответствует самой старой из трёх поддерживаемых версий

---

## 4. Архитектура приложения

### 4.1. Паттерн MVVM + Coordinator

Приложение построено по архитектуре **MVVM (Model-View-ViewModel)** с использованием паттерна **Coordinator** для управления навигацией.

**Слои:**

- **Model** — модели данных (DTO, доменные сущности)
- **View** — `UIViewController` / `UIView`, отвечает только за отображение, не содержит бизнес-логики
- **ViewModel** — содержит бизнес-логику экрана, обрабатывает данные из сервиса/репозитория, предоставляет данные View через биндинги (Closures / Delegate — уточняется)
- **Coordinator** — отвечает за навигацию между экранами, создание модулей (View + ViewModel), инициализацию зависимостей

### 4.2. Общая схема навигации

```
AppCoordinator
 └── TabBarCoordinator
      ├── NewsCoordinator      → NewsListView + NewsListViewModel
      ├── MapCoordinator       → MapView + MapViewModel
      ├── WeatherCoordinator   → WeatherView + WeatherViewModel
      └── ProfileCoordinator   → ProfileView + ProfileViewModel
```

`AppCoordinator` инициализирует `TabBarCoordinator`, который создаёт `UITabBarController` и по одному дочернему координатору на каждый таб.

### 4.3. Структура проекта (пример)

```
App/
 ├── AppDelegate.swift
 ├── SceneDelegate.swift
 └── AppCoordinator.swift

Modules/
 ├── TabBar/
 │    └── TabBarCoordinator.swift
 ├── News/
 │    ├── NewsCoordinator.swift
 │    ├── NewsListViewController.swift
 │    ├── NewsListViewModel.swift
 │    └── Cells/
 ├── Map/
 │    ├── MapCoordinator.swift
 │    ├── MapViewController.swift
 │    └── MapViewModel.swift
 ├── Weather/
 │    ├── WeatherCoordinator.swift
 │    ├── WeatherViewController.swift
 │    └── WeatherViewModel.swift
 └── Profile/
      ├── ProfileCoordinator.swift
      ├── ProfileViewController.swift
      └── ProfileViewModel.swift

Core/
 ├── Network/
 │    ├── NetworkService.swift
 │    ├── Endpoints/
 │    └── DTO/
 ├── Services/
 │    └── LocationService.swift
 └── Extensions/

Resources/
 ├── Assets.xcassets
 └── Localizable.strings
```

---

## 5. Описание экранов

### 5.1. News

**Назначение:** отображение списка новостей, полученных с сервера.

**Функциональность:**
- Загрузка списка новостей с сервера при открытии экрана
- Отображение списка в `UITableView` / `UICollectionView`
- Отображение изображения новости с использованием SDWebImage (кеширование, placeholder на время загрузки)
- Pull-to-refresh для обновления списка, опционально
- Пагинация при подгрузке следующих новостей, опционально
- Переход к деталям новости

**Компоненты:**
- `NewsListViewController` — View
- `NewsListViewModel` — загрузка данных, маппинг DTO → модель отображения
- `NewsCoordinator` — навигация внутри модуля
- `NewsCell` — верстка ячейки через SnapKit

---

### 5.2. Map

**Назначение:** отображение карты с элементами управления.

**Функциональность:**
- Отображение карты (`MKMapView`)
- Кнопка **«+»** — увеличение масштаба карты
- Кнопка **«–»** — уменьшение масштаба карты
- Кнопка **текущей геопозиции** — определение и центрирование карты на местоположении пользователя
- Запрос разрешения на использование геолокации (`CLLocationManager`, `NSLocationWhenInUseUsageDescription` в Info.plist)

**Компоненты:**
- `MapViewController` — View, содержит `MKMapView` и три кнопки, размещённые через SnapKit
- `MapViewModel` — логика взаимодействия с сервисом геолокации
- `LocationService` — обёртка над `CLLocationManager`
- `MapCoordinator` — навигация модуля

**Логика кнопок:**

| «+» - `mapView.setRegion(...)` с уменьшенным `span` (приближение)
| «–» - `mapView.setRegion(...)` с увеличенным `span` (отдаление)
| Геопозиция - Запрос текущих координат через `LocationService`, центрирование карты

---

### 5.3. Weather

**Назначение:** отображение данных о погоде, полученных с сервера.

**Функциональность:**
- Запрос данных о погоде с сервера (по текущей локации пользователя или заданному городу — уточняется)
- Отображение текущей температуры, состояния погоды (иконка/описание), доп. параметров (влажность, ветер и т.д. — уточняется по API)
- Обработка состояний: загрузка / успех / ошибка

**Компоненты:**
- `WeatherViewController` — View
- `WeatherViewModel` — обработка ответа сервера, форматирование данных для отображения
- `WeatherCoordinator` — навигация модуля

---

### 5.4. Profile

**Назначение:** отображение и/или редактирование данных пользователя.

**Отображаемые поля:**
- Имя (First Name)
- Фамилия (Last Name)
- Почта (Email)
- Локация (Location)

**Функциональность:**
- Отображение данных текущего пользователя
- Редактирование полей (если предусмотрено сценарием — уточняется)
- Валидация email при редактировании (при наличии редактирования)

**Компоненты:**
- `ProfileViewController` — View
- `ProfileViewModel` — хранение/обновление данных пользователя
- `ProfileCoordinator` — навигация модуля

---

## 6. Сетевой слой

- Единая точка входа — `NetworkService`, инкапсулирующая работу с `URLSession`
- Разделение на `Endpoint` для каждого запроса (News, Weather)
- DTO-модели с последующим маппингом в доменные модели во ViewModel
- Обработка ошибок сети через единый `enum NetworkError`

---

## 7. Верстка (SnapKit)

- Вся верстка экранов и переиспользуемых компонентов выполняется программно с использованием SnapKit
- Storyboard/XIB не используются для основных экранов
- Constraints задаются в методе `configureLayout()` каждого View/ViewController

---

## 8. Кеширование изображений (SDWebImage)

- Используется для загрузки и кеширования:
  - изображений новостей на экране News
- Настройки кеша (память/диск, время жизни кеша) — по умолчанию библиотеки

---

## 9. Зависимости проекта

| SnapKit - Программная верстка UI |
| SDWebImage - Загрузка и кеширование изображений |

---

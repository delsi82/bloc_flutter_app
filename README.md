# Pokèmon Flutter App

Test Bloc Architecture and others Flutter's libraries.

## Installation
Clone this repository and import into **Android Studio or Visual code or your favourite IDE**
```bash
git clone https://github.com/delsi82/pokemon_flutter_app.git
```

## Flutter lib

- Bloc -> https://bloclibrary.dev/#/

## App Architecture

- data -> Contains the Service,DTO,Database,Model and Repository classes
- i18n -> Contains the classes used by the translator library
- ui -> Contains the ui modules. All Ui module have a view class and bloc package with BlocClass, StateClass and EventClass
- utils -> All the magics that you want to produce...


## Build generated class

use command "flutter pub run build_runner build" to generated classes for Retrofit,db and translator.

Remember! If you use flutter clean you should use "flutter pub run build_runner build --delete-conflicting-outputs" for regenerate all classes.

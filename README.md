# expression_de_besoin_convers_nuxe

Application mobile Flutter d'expression de besoins, pour Convers / Nuxe.
Android et iOS depuis la même base.

## L'architecture

Découpage **GetX** en modules, chacun avec sa vue et son contrôleur :

```text
lib/
├── app/
│   ├── modules/
│   │   ├── auth/splash/            l'écran de lancement
│   │   ├── auth/signIn/            la connexion
│   │   ├── auth/forgot_password/   la récupération de mot de passe
│   │   └── home/                   l'accueil une fois connectée
│   └── routes/                     app_routes.dart et app_pages.dart
├── config/                         couleurs, images, fonds, styles de texte,
│                                   widgets communs et boîtes de dialogue
├── models/user.dart
├── services/                       api_service, remote_service, user_settings
├── utils/image_utils.dart
└── main.dart
```

`config/` tient lieu de design system : `app_colors.dart`, `app_images.dart`,
`text_style_constants.dart`, `backgrounds.dart`, `common_widgets.dart`,
`dialogues.dart`. Les écrans n'écrivent pas de couleur ni de style en dur.

## La stack

| Besoin | Paquet |
|---|---|
| état, routes, injection | `get` |
| appels réseau | `dio`, `http` |
| stockage | `flutter_secure_storage`, `shared_preferences` |
| mise à l'échelle | `flutter_screenutil` |
| images | `image_picker`, `image_cropper`, `cached_network_image`, `flutter_svg` |
| reconnaissance de texte | `google_ml_kit` |
| confort visuel | `shimmer`, `loading_animation_widget`, `google_fonts` |

Dart SDK >= 3.1.3.

## Lancer le projet

```bash
flutter pub get
flutter run
```

Pour iOS, `cd ios && pod install` avant le premier lancement.

## À savoir

`lib/test_api.dart` est un bac à sable pour essayer les appels réseau, pas un
test automatisé.

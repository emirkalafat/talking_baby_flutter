# talking_baby_flutter v0.1

## Getting Started

Projeyi çalıştırmadan önce terminalden `flutter pub get` çalıştırılmalıdır.

## Lokalizasyon Hakkında Bilinmesi Gerekenler

Uygulamayı geliştirirken lokalizasyona hazır şekilde kodlamak gelecek geliştirmelerin kolay olmasını sağlayacaktır.

Kaynakça: [Internationalizing Flutter apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

Bu yüzden `lib/src/localization` klasöründe bulunan dil dosyalarında gerekli alanları ekledikten sonra `flutter pub get` komutu çalıştırılarak gerekli dil tanımları yapılmış olacaktır.

Eğer kullandığınız widget *Stateful* ise dil tanımını dışarıdan almanız daha sonra -State- içinde çağırmanız gerekmektedir. Örnek kod:

```dart
class ExampleClass extends StatefulWidget {
    const ExampleClass({super.key, required this.t});

    final AppLocalizations t;
    //...

    @override
    ConsumerState<ExampleClass> createState() => _ExampleClassState();
}

class _ExampleClassState extends ConsumerState<ExampleClass> {
    AppLocalizations get t => widget.t;

    //...

    @override
    Widget build(BuildContext context) {
        //...
        return Text(t.translation); ///[t] için örnek kullanım
    }
}
```

## State Management

State yönetimi için Riverpod kullanılmaktadır. [Riverpod](https://pub.dev/packages/riverpod) hakkında daha fazla bilgi almak için [buraya](https://riverpod.dev/) tıklayabilirsiniz.

---

This project is a starting point for a Flutter application that follows the [simple app state management tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to include with your application.

The `assets/images` directory contains [resolution-aware images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

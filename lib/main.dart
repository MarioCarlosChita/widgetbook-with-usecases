import 'package:example/example.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgetbook/widgetbook.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        WidgetbookComponent(
          name: "Card",
          useCases: [
            WidgetbookUseCase(
              name: "",
              builder: (context) {
                final title = context.knobs.string(
                  label: 'Title',
                  initialValue: 'Title',
                );

                final subTitle = context.knobs.stringOrNull(
                  label: 'Subtitle',
                  initialValue: 'SubTitle',
                );

                final description = context.knobs.string(
                  label: "Description",
                  initialValue: "This is the description",
                );

                final cardElevation = context.knobs.double.slider(
                  label: 'Elevation',
                  min: 0,
                  max: 10,
                  initialValue: 5,
                );
                final CardData card =  CardData(
                  title: title,
                  subTitle: subTitle,
                  description: description,
                );
                return Center(
                  child: CardWidget(card: card, elevation: cardElevation),
                );
              },
            ),
          ],
        ),
      ],
      addons: [
        DeviceFrameAddon(devices: [Devices.ios.iPhone12 , Devices.ios.iPhone14Pro]),
      ],
    );
  }
}

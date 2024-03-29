import 'package:example/custom_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_overlay/simple_overlay.dart';

class HomePageAndroid extends StatefulWidget {
  const HomePageAndroid({super.key, required this.title});

  final String title;

  @override
  State<HomePageAndroid> createState() => _HomePageAndroidState();
}

class _HomePageAndroidState extends State<HomePageAndroid> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
            BottomNavigationBarItem(
                icon: Icon(Icons.radio_button_checked), label: 'Radio')
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).notification(
                          "Do est sunt ad commodo aliqua ut enim ullamco sint laboris aliqua qui labore.",
                          bodyText:
                              "Consectetur eiusmod laborum culpa nostrud deserunt. Sint laboris eiusmod sint ea reprehenderit. Incididunt elit enim dolore veniam aliquip adipisicing ullamco elit nulla officia amet reprehenderit labore.",
                          overlayDisplacement: OverlayDisplacement.rightToLeft,
                          overlayPosition: const OverlayPosition.bottom(),
                          bottomNavigationBar: true,
                          theme: MaterialNotificationTheme.reload()),
                      child: const Text("Notification (reload)")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).notification(
                          "Est non quis minim nostrud minim minim.",
                          theme: MaterialNotificationTheme.success()),
                      child: const Text("Notification (success)")),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).notification(
                          "Break",
                          bodyText: "4:00 - 4:20 PM",
                          overlayDisplacement: OverlayDisplacement.leftToRight,
                          theme: MaterialNotificationTheme.stop()),
                      child: const Text("Notification (stop)")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).notification(
                          "Labore non non elit occaecat qui quis.",
                          overlayPosition: const OverlayPosition.bottom(),
                          bottomNavigationBar: true,
                          theme: MaterialNotificationTheme.error()),
                      child: const Text("Notification (error)")),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).notification(
                          "Amet nisi irure.",
                          theme: MaterialNotificationTheme()),
                      child: const Text("Notification")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).notification(
                          "Adipisicing id eiusmod consequat sit dolor. Amet aute dolor dolore ipsum proident consectetur sint labore do aliqua ullamco nulla sit. Ex proident nulla proident anim amet nulla velit aliquip do ipsum dolor dolore id. In elit elit non eu esse sint voluptate et anim sint quis et excepteur non.",
                          theme: MaterialNotificationTheme.warning()),
                      child: const Text("Notification (warning)")),
                ],
              ),
              const Divider(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).toast(
                          "Do est sunt ad commodo aliqua ut enim ullamco sint laboris aliqua qui labore.",
                          overlayPosition: const OverlayPosition.bottom(),
                          bottomNavigationBar: true,
                          theme: MaterialToastTheme.reload()),
                      child: const Text("Toast (reload)")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).toast(
                          "Est non quis minim nostrud minim minim.",
                          overlayPosition: const OverlayPosition.bottom(),
                          bottomNavigationBar: true,
                          theme: MaterialToastTheme.success()),
                      child: const Text("Toast (success)")),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).toast(
                          "Consectetur reprehenderit non tempor nulla nisi nulla.",
                          overlayPosition: const OverlayPosition.bottom(),
                          bottomNavigationBar: true,
                          theme: MaterialToastTheme.stop()),
                      child: const Text("Toast (stop)")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).toast(
                          "Labore non non elit occaecat qui quis.",
                          overlayPosition: const OverlayPosition.bottom(),
                          bottomNavigationBar: true,
                          theme: MaterialToastTheme.error()),
                      child: const Text("Toast (error)")),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).toast(
                          "Amet nisi irure.",
                          overlayPosition: const OverlayPosition.bottom(),
                          bottomNavigationBar: true,
                          theme: MaterialToastTheme()),
                      child: const Text("Toast")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).toast(
                          "Adipisicing id eiusmod consequat sit dolor. Amet aute dolor dolore ipsum proident consectetur sint labore do aliqua ullamco nulla sit. Ex proident nulla proident anim amet nulla velit aliquip do ipsum dolor dolore id. In elit elit non eu esse sint voluptate et anim sint quis et excepteur non.",
                          overlayPosition: const OverlayPosition.bottom(),
                          bottomNavigationBar: true,
                          theme: MaterialToastTheme.warning()),
                      child: const Text("Toast (warning)")),
                ],
              ),
              const Divider(),
              ElevatedButton(
                  onPressed: () => CustomOverlays.of(context).snackBar(
                        "Deserunt ipsum aute. Est ex laboris aute amet cillum sint anim commodo nostrud voluptate aliquip.",
                        overlayPosition: const OverlayPosition.bottom(),
                        bottomNavigationBar: true,
                      ),
                  child: const Text("SnackBar")),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.keyboard),
          onPressed: () =>
              SystemChannels.textInput.invokeMethod('TextInput.show'),
        ),
      ),
    );
  }
}

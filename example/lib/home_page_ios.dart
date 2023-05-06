import 'package:example/custom_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_overlay/simple_overlay.dart';

class HomePageIos extends StatefulWidget {
  const HomePageIos({super.key, required this.title});

  final String title;

  @override
  State<HomePageIos> createState() => _HomePageIosState();
}

class _HomePageIosState extends State<HomePageIos> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.iclarified.com/images/news/86246/417032/417032-1280.jpg'))),
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
                          overlayPosition: OverlayPosition.bottom,
                          theme: CupertinoNotificationTheme.reload()),
                      child: const Text("Notification (reload)")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).notification(
                          "Est non quis minim nostrud minim minim.",
                          theme: CupertinoNotificationTheme.success()),
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
                          theme: CupertinoNotificationTheme.stop()),
                      child: const Text("Notification (stop)")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).notification(
                          "Labore non non elit occaecat qui quis.",
                          overlayPosition: OverlayPosition.bottom,
                          theme: CupertinoNotificationTheme.error()),
                      child: const Text("Notification (error)")),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).notification(
                          "Amet nisi irure.",
                          theme: CupertinoNotificationTheme()),
                      child: const Text("Notification")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).notification(
                          "Adipisicing id eiusmod consequat sit dolor. Amet aute dolor dolore ipsum proident consectetur sint labore do aliqua ullamco nulla sit. Ex proident nulla proident anim amet nulla velit aliquip do ipsum dolor dolore id. In elit elit non eu esse sint voluptate et anim sint quis et excepteur non.",
                          theme: CupertinoNotificationTheme.warning()),
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
                          theme: CupertinoToastTheme.reload()),
                      child: const Text("Toast (reload)")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).toast(
                          "Est non quis minim nostrud minim minim.",
                          theme: CupertinoToastTheme.success()),
                      child: const Text("Toast (success)")),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).toast(
                          "Consectetur reprehenderit non tempor nulla nisi nulla.",
                          theme: CupertinoToastTheme.stop()),
                      child: const Text("Toast (stop)")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).toast(
                          "Labore non non elit occaecat qui quis.",
                          theme: CupertinoToastTheme.error()),
                      child: const Text("Toast (error)")),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).toast(
                          "Amet nisi irure.",
                          theme: CupertinoToastTheme()),
                      child: const Text("Toast")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => CustomOverlays.of(context).toast(
                          "Adipisicing id eiusmod consequat sit dolor. Amet aute dolor dolore ipsum proident consectetur sint labore do aliqua ullamco nulla sit. Ex proident nulla proident anim amet nulla velit aliquip do ipsum dolor dolore id. In elit elit non eu esse sint voluptate et anim sint quis et excepteur non.",
                          theme: CupertinoToastTheme.warning()),
                      child: const Text("Toast (warning)")),
                ],
              ),
              const Divider(),
              ElevatedButton(
                  onPressed: () => CustomOverlays.of(context).snackBar(
                      "Deserunt ipsum aute magna enim ex aliqua deserunt est deserunt minim eiusmod commodo irure ut. Cupidatat elit ipsum laboris enim duis exercitation excepteur laboris dolore. Laboris sunt nostrud aute culpa et et adipisicing consequat. Exercitation officia dolor velit proident qui et nostrud irure pariatur cillum sint."),
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

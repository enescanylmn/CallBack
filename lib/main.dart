import 'package:flutter/material.dart';

void main() {
  runApp(AnaSayfa());
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int adet = 0;
  late VoidCallback adetArttir = () {
    setState(() {
      adet++;
    });
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData.dark(),
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("CallBack"),
            ),
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("$adet kere basıldı"),
              Center(
                  child: CustomButton(
                callbackFalan: adetArttir,
              ))
            ])));
  }
}

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, required this.callbackFalan}) : super(key: key);
  final VoidCallback callbackFalan;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          widget.callbackFalan();
        },
        child: Text("Arttır"));
  }
}

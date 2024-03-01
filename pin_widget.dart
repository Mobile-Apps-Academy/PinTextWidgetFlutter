
import 'package:flutter/material.dart';


class PinWidget extends StatefulWidget {
  final String? phoneNumber;
  final String? code;
  String? from;

  PinWidget({super.key, this.phoneNumber, this.from, this.code});

  @override
  State<PinWidget> createState() => _PinWidgetState();
}

class _PinWidgetState extends State<PinWidget> {
  double? height;
  double? width;

  TextEditingController? controller1, controller2, controller3, controller4;

  String Code = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height! / 5,
                  ),
                  Text(
                    "We have sent a verification code on your mobile number",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height! / 40,
                  ),
                  pinTextField()
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Add resend function here
                      },
                      child: const Text(
                        "Resend OTP?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(5.0))),
                          visualDensity: VisualDensity(vertical: 2)),
                      onPressed: () {
                        if( controller1!.text.isNotEmpty &&
                            controller2!.text.isNotEmpty &&
                            controller3!.text.isNotEmpty &&
                            controller4!.text.isNotEmpty) {
                          String pin = controller1!.text + controller2!.text + controller3!.text + controller4!.text;
                        } else {
                          // Pin is empty
                        }
                      },
                      child: Container(
                        height: height! / 18,
                        width: width,
                        alignment: Alignment.center,
                        child: Text(
                          "Verify",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width! * 0.02345,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row pinTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // We need single digit pin text field to populate the row.
        singleDigitPinTextField(true, false, controller1),
        singleDigitPinTextField(false, false, controller2),
        singleDigitPinTextField(false, false, controller3),
        singleDigitPinTextField(false, true, controller4),
      ],
    );
  }

  Widget singleDigitPinTextField(
      bool? first, last, TextEditingController? controller) {
    return Container(
      height: height! / 12,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 2, color: Colors.black54)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 2, color: Colors.black54))),
        ),
      ),
    );
  }
}

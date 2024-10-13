import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class HTMLView extends StatelessWidget {
  final String htmlData;

  const HTMLView({super.key, required this.htmlData});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlData,
      shrinkWrap: true,
      style: {
        "body": Style(
          margin: Margins.zero,
          //  padding: EdgeInsets.zero,
        ),
        // tables will have the below background color
        "table": Style(
          backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        // some other granular customizations are also possible
        "tr": Style(
          border: const Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
          //  padding: const EdgeInsets.all(6),
          backgroundColor: Colors.grey,
        ),
        "td": Style(
          //   padding: const EdgeInsets.all(6),
          alignment: Alignment.topLeft,
        ),
        // text that renders h1 elements will be red
        "h1": Style(
          color:  Colors.black,
          fontSize: FontSize.xxLarge,
          textAlign: TextAlign.justify,
        ),
        "h2": Style(
          color: Colors.black,
          fontSize: FontSize.xLarge,
          textAlign: TextAlign.justify,
        ),
        "h3": Style(
          color:  Colors.black,
          fontSize: FontSize.large,
          textAlign: TextAlign.justify,
        ),
        "h4": Style(
          color: Colors.black,
          fontSize: FontSize.medium,
          textAlign: TextAlign.justify,
        ),
        "h5": Style(
          color: Colors.black,
          fontSize: FontSize.small,
          textAlign: TextAlign.justify,
        ),
        "h6": Style(
          color: Colors.black,
          fontSize: FontSize.xSmall,
          textAlign: TextAlign.justify,
        ),
        "p": Style(
          color: Colors.black,
          fontSize: FontSize.small,
          textAlign: TextAlign.justify,
        ),
        "span": Style(
          color:  Colors.black,
          fontSize: FontSize.medium,
          textAlign: TextAlign.justify,
        ),
      },
    );
  }
}
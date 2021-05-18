import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  final String sale;
  final List<String> tags;

  const TagsWidget({Key key, this.tags, this.sale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _tags = [];

    if (tags != null) {
      for (var i = 0; i < tags.length; i++) {
        _tags.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.check_rounded,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: tags[i],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    return Wrap(
      children: [
        Visibility(
          visible: sale.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.local_offer_rounded,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: sale,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        ..._tags,
      ],
    );
  }
}

import 'package:car_service_mobile/screens/company/company_page.dart';
import 'package:car_service_mobile/screens/company/widgets/rating/ratings_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class NewRatingPage extends StatefulWidget {
  final String id;
  final String title;

  const NewRatingPage({Key key, this.id, this.title}) : super(key: key);

  @override
  _NewRatingPageState createState() => _NewRatingPageState();
}

class _NewRatingPageState extends State<NewRatingPage> {
  final _controller = RatingsController();
  TextEditingController _controllerName;
  TextEditingController _controllerComment;
  double _rating = 0.0;

  @override
  void initState() {
    super.initState();
    _controllerName = TextEditingController();
    _controllerComment = TextEditingController();
    _controller.state = CompanyState.success;
    _controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerComment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.state == CompanyState.success) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              Text(
                'Avalie a',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '${widget.title}',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 32),
              SmoothStarRating(
                rating: _rating,
                isReadOnly: false,
                size: 48,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 5,
                allowHalfRating: false,
                color: Colors.amber[700],
                borderColor: Colors.amber[700],
                onRated: (value) {
                  _rating = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _controllerName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Seu nome',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _controllerComment,
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Como foi sua experiência na ${widget.title} ?',
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          textStyle: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          await _controller.sendRating(
                            companyId: widget.id,
                            comment: _controllerComment.text,
                            userName: _controllerName.text,
                            stars: _rating.toInt(),
                          );
                          Navigator.of(context).pop();
                          _showMyDialog();
                        },
                        child: Text('Enviar'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          textStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancelar'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      );
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Avaliação'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Obrigado por contribuir.'),
                Text('Sua avaliação será enviada ao nosso Parceiro!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

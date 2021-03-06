import 'package:flutter/material.dart';
import 'flashCardAlignment.dart';
import 'dart:math';
import 'Classes/JSONDataLoader.dart';
import 'Classes/Activity/Activity.dart';
import 'Classes/Profile/TestUser.dart';
import 'Classes/Activity/User.dart';

List<Alignment> cardsAlign = [ new Alignment(0.0, 1.5), new Alignment(0.0, 0.8), new Alignment(0.0, 0.0) ];
List<Size> cardsSize = new List(3);
List<Activity> liked = new List<Activity>();
List<Activity> hated = new List<Activity>(); 
List<Activity> activities = JSONDataLoader().loadCityActivities("Quebec");
int activitiesCount = activities.length;
int numero = 0;
int image = 0;
int imageNumber = 7;
User _user = TestUser().getUser();

List<Activity> getListActivity() => activities;

class CardsSectionAlignment extends StatefulWidget
{



  CardsSectionAlignment(BuildContext context)
  {
    cardsSize[0] = new Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.65);
    cardsSize[1] = new Size(MediaQuery.of(context).size.width * 0.85, MediaQuery.of(context).size.height * 0.6);
    cardsSize[2] = new Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.6);
  }

  @override
  _CardsSectionState createState() => new _CardsSectionState();
}

class _CardsSectionState extends State<CardsSectionAlignment> with SingleTickerProviderStateMixin
{

  int cardsCounter = 0;

  List<FlashCardAlignment> cards = new List();
  AnimationController _controller;

  final Alignment defaultFrontCardAlign = new Alignment(0.0, 0.0);
  Alignment frontCardAlign;
  double frontCardRot = 0.0;
  Color frontCardColor = Colors.green;

  @override
  void initState()
  {
    super.initState();

    // Init cards
    for (cardsCounter = 0; cardsCounter < 3; cardsCounter++)
    {
      cards.add(new FlashCardAlignment(cardsCounter, numero, image, activities[numero]));
      numero = (numero + 1) % activitiesCount;
      image = (image + 1) % imageNumber;
    }

    frontCardAlign = cardsAlign[2];

    // Init the animation controller
    _controller = new AnimationController(duration: new Duration(milliseconds: 700), vsync: this);
    _controller.addListener(() => setState(() {}));
    _controller.addStatusListener((AnimationStatus status)
    {
      if(status == AnimationStatus.completed) changeCardsOrder();
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return new Expanded
    (
      child: new Stack
      (
        children: <Widget>
        [
          backCard(),
          middleCard(),
          frontCard(),

          // Prevent swiping if the cards are animating
          _controller.status != AnimationStatus.forward ? new SizedBox.expand
          (
            child: new GestureDetector
            (
              // While dragging the first card
              onPanUpdate: (DragUpdateDetails details)
              {
                // Add what the user swiped in the last frame to the alignment of the card
                setState(()
                {
                  // 20 is the "speed" at which moves the card
                  frontCardAlign = new Alignment
                  (
                    frontCardAlign.x + 20 * details.delta.dx / MediaQuery.of(context).size.width,
                    frontCardAlign.y + 40 * details.delta.dy / MediaQuery.of(context).size.height
                  );
                  

                  frontCardRot = frontCardAlign.x; // * rotation speed;
                });
              },
              // When releasing the first card
              onPanEnd: (_)
              {
                // If the front card was swiped far enough to count as swiped
                if(frontCardAlign.x > 3.0 || frontCardAlign.x < -3.0)
                {
                  animateCards();
                }
                else
                {
                  // Return to the initial rotation and alignment
                  setState(()
                  {
                    frontCardAlign = defaultFrontCardAlign;
                    frontCardRot = 0.0;
                    frontCardColor = Colors.red;
                  });
                }
              },
            )
          ) : new Container(),
        ],
      )
    );
  }

  Widget backCard()
  {
    return new Align
    (
      alignment: _controller.status == AnimationStatus.forward ? CardsAnimation.backCardAlignmentAnim(_controller).value : cardsAlign[0],
      child: new SizedBox.fromSize
      (
        size: _controller.status == AnimationStatus.forward ? CardsAnimation.backCardSizeAnim(_controller).value : cardsSize[2],
        child: cards[2]
      ),
    );
  }

  Widget middleCard()
  {
    return new Align
    (
      alignment: _controller.status == AnimationStatus.forward ? CardsAnimation.middleCardAlignmentAnim(_controller).value : cardsAlign[1],
      child: new SizedBox.fromSize
      (
        size: _controller.status == AnimationStatus.forward ? CardsAnimation.middleCardSizeAnim(_controller).value : cardsSize[1],
        child: cards[1]
      ),
    );
  }

  Widget frontCard()
  {
    return new Align
    (
      alignment: _controller.status == AnimationStatus.forward ? CardsAnimation.frontCardDisappearAlignmentAnim(_controller, frontCardAlign, cards[0]).value : frontCardAlign,
      child: new Transform.rotate
      (
        angle: (pi / 180.0) * frontCardRot,
        child: new SizedBox.fromSize
        (
          size: cardsSize[0],
          child: cards[0]
        ),
      )
    );
  }

  void changeCardsOrder()
  {
    setState(()
    {
      // Swap cards (back card becomes the middle card; middle card becomes the front card, front card becomes a new bottom card)
      var temp = cards[0];
      cards[0] = cards[1];
      cards[1] = cards[2];
      cards[2] = temp;

      cards[2] = new FlashCardAlignment(cardsCounter, numero, image, activities[numero]);
      numero = (numero + 1) % activitiesCount;
      image = (numero + 1) % imageNumber;
      cardsCounter++;

      frontCardAlign = defaultFrontCardAlign;
      frontCardRot = 0.0;
    });
  }

  void animateCards()
  {
    _controller.stop();
    _controller.value = 0.0;
    _controller.forward();
  }
}

class CardsAnimation
{
  static Animation<Alignment> backCardAlignmentAnim(AnimationController parent)
  {
    return new AlignmentTween
    (
      begin: cardsAlign[0],
      end: cardsAlign[1]
    ).animate
    (
      new CurvedAnimation
      (
        parent: parent,
        curve: new Interval(0.4, 0.7, curve: Curves.easeIn)
      )
    );
  }

  static Animation<Size> backCardSizeAnim(AnimationController parent)
  {
    return new SizeTween
    (
      begin: cardsSize[2],
      end: cardsSize[1]
    ).animate
    (
      new CurvedAnimation
      (
        parent: parent,
        curve: new Interval(0.4, 0.7, curve: Curves.easeIn)
      )
    );
  }

  static Animation<Alignment> middleCardAlignmentAnim(AnimationController parent)
  {
    return new AlignmentTween
    (
      begin: cardsAlign[1],
      end: cardsAlign[2]
    ).animate
    (
      new CurvedAnimation
      (
        parent: parent,
        curve: new Interval(0.2, 0.5, curve: Curves.easeIn)
      )
    );
  }

  static Animation<Size> middleCardSizeAnim(AnimationController parent)
  {
    return new SizeTween
    (
      begin: cardsSize[1],
      end: cardsSize[0]
    ).animate
    (
      new CurvedAnimation
      (
        parent: parent,
        curve: new Interval(0.2, 0.5, curve: Curves.easeIn)
      )
    );
  }

  static Animation<Color> middleCardColorAnim(AnimationController parent) {
    return new ColorTween(
      begin: Colors.white,
      end: Colors.green
    ).animate(
      new CurvedAnimation (
        parent: parent,
        curve: new Interval(0.2, 0.5, curve: Curves.easeIn)
      )
    );
  }

  static Animation<Alignment> frontCardDisappearAlignmentAnim(AnimationController parent, Alignment beginAlign, FlashCardAlignment card)
  {
    var swiped = new AlignmentTween
    (
      begin: beginAlign,
      end: new Alignment(beginAlign.x > 0 ? beginAlign.x + 30.0 : beginAlign.x - 30.0, 0.0) // Has swiped to the left or right?
    );
    bool isSwipedRight = swiped.end.x > 0;

    if(isSwipedRight) 
    {
      //liked.add(card.activity);
      _user.addActivity(card.activity);
    }
    else{
      hated.add(card.activity);
    }
    return swiped.animate
    (
      new CurvedAnimation
      (
        parent: parent,
        curve: new Interval(0.0, 0.5, curve: Curves.easeIn)
      )
    );
  }
}
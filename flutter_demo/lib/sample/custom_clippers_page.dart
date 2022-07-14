import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CustomClippersPage extends StatelessWidget {
  const CustomClippersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter custom clipper example"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperOne(flip: true, reverse: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: const Center(
                child: Text("WaveClipperTwo(flip: true,reverse: true)"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperOne(flip: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: const Center(
                child: Text("WaveClipperTwo(flip: true)"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperTwo(flip: true, reverse: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: const Center(
                child: Text("WaveClipperTwo(flip: true,reverse:true)"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperTwo(flip: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: const Center(
                child: Text("WaveClipperTwo(flip: true)"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text("OvalBottomBorderClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: OvalRightBorderClipper(),
            child: Container(
              height: 100,
              color: Colors.red,
              child: const Center(
                child: Text("OvalRightBorderClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: SideCutClipper(),
            child: Container(
              height: 200,
              color: Colors.pink,
              //play with scales to get more clear versions
              child: const Center(
                child: Text("SideCutClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: OvalLeftBorderClipper(),
            child: Container(
              height: 100,
              color: Colors.green,
              child: const Center(
                child: Text("OvalLeftBorderClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: ArcClipper(),
            child: Container(
              height: 100,
              color: Colors.pink,
              child: const Center(
                child: Text("ArcClipper()"),
              ),
            ),
          ),
          ClipPath(
            clipper: PointsClipper(),
            child: Container(
              height: 100,
              color: Colors.indigo,
              child: const Center(
                child: Text("PointsClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: 100,
              color: Colors.deepOrange,
              child: const Center(
                child: Text("TriangleClipper()"),
              ),
            ),
          ),
          ClipPath(
            clipper: MovieTicketClipper(),
            child: Container(
              height: 100,
              color: Colors.deepPurple,
              child: const Center(
                child: Text("MovieTicketClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: MovieTicketBothSidesClipper(),
            child: Container(
              height: 100,
              color: Colors.green,
              child: const Center(
                child: Text("MovieTicketBothSidesClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: MultipleRoundedCurveClipper(),
            child: Container(
              height: 100,
              color: Colors.pink,
              child: const Center(
                child: Text("MultipleRoundedCurveClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          ClipPath(
            clipper: MultiplePointedEdgeClipper(),
            child: Container(
              height: 100,
              color: Colors.green,
              child: const Center(
                child: Text("MultiplePointedEdgeClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          ClipPath(
            clipper: OctagonalClipper(),
            child: Container(
              height: 220,
              color: Colors.red,
              child: const Center(
                child: Text("OctagonalClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: HexagonalClipper(),
            child: Container(
              height: 220,
              color: Colors.blueAccent,
              child: const Center(
                child: Text("HexagonalClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: HexagonalClipper(reverse: true),
            child: Container(
              height: 220,
              color: Colors.orangeAccent,
              child: const Center(
                child: Text("HexagonalClipper(reverse: true)"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: ParallelogramClipper(),
            child: Container(
              height: 220,
              color: Colors.pinkAccent,
              child: const Center(
                child: Text("ParallelogramClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: DiagonalPathClipperOne(),
            child: Container(
              height: 120,
              color: Colors.red,
              child: const Center(
                child: Text("DiagonalPathClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: DiagonalPathClipperTwo(),
            child: Container(
              height: 120,
              color: Colors.pink,
              child: const Center(
                child: Text("DiagonalPathClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 120,
              color: Colors.deepPurple,
              child: const Center(
                child: Text("WaveClipperOne()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperOne(reverse: true),
            child: Container(
              height: 120,
              color: Colors.deepPurple,
              child: const Center(
                child: Text("WaveClipperOne(reverse: true)"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: const Center(
                child: Text("WaveClipperTwo()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: WaveClipperTwo(reverse: true),
            child: Container(
              height: 120,
              color: Colors.orange,
              child: const Center(
                child: Text("WaveClipperTwo(reverse: true)"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 320,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
                color: Colors.orange,
              ),
              child: const Center(
                child: Text("RoundedDiagonalPathClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ClipPath(
            clipper: OvalTopBorderClipper(),
            child: Container(
              height: 120,
              color: Colors.yellow,
              child: const Center(
                child: Text("OvalTopBorderClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ClipPath(
            clipper: ArrowClipper(70, 80, Edge.LEFT),
            child: Container(
              height: 120,
              color: Colors.pink,
              child: const Center(
                child: Text("ArrowClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ClipPath(
            clipper: ArrowClipper(70, 80, Edge.RIGHT),
            child: Container(
              height: 120,
              color: Colors.red,
              child: const Center(
                child: Text("ArrowClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ClipPath(
            clipper: ArrowClipper(20, 300, Edge.TOP),
            child: Container(
              height: 70,
              width: 50,
              color: Colors.blue,
              child: const Center(
                child: Text("ArrowClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ClipPath(
            clipper: ArrowClipper(70, 80, Edge.BOTTOM),
            child: Container(
              height: 120,
              color: Colors.green,
              child: const Center(
                child: Text("ArrowClipper()"),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ClipPath(
            clipper: StarClipper(8),
            child: Container(
              height: 450,
              color: Colors.indigo,
              child: const Center(
                child: Text("StarClipper()"),
              ),
            ),
          ),
          ClipPath(
            clipper: MessageClipper(borderRadius: 16),
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                color: Colors.red,
              ),
              child: const Center(
                child: Text("MessageClipper()"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

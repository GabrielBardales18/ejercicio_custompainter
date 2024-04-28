import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue
          )
        ),
      home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('1390-22-18328'),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: MyCustomPainter(),
        child: const Center(
          
        ),
      )
    );
  }
}

class MyCustomPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
     // Definir un espacio vertical entre cada figura
    double espacio = 20;

    // Definir el tamaño de cada figura
    double figuraSize = size.width * 0.2; // Usar la mitad del ancho para las figuras

    // Offset para la posición vertical de cada figura
    double offsetY = 100;

    // 1. Borde de un cuadrado
    Paint pintarBordeCuadrado = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    Rect cuadradoRect = Rect.fromLTWH(
      (size.width - figuraSize) / 2,
      offsetY,
      figuraSize,
      figuraSize,
    );
    canvas.drawRect(cuadradoRect, pintarBordeCuadrado);
    offsetY += figuraSize + espacio;

    // 2. Línea
    Paint pintarLinea = Paint()
      ..color = Colors.red
      ..strokeWidth = 5.0;
    canvas.drawLine(
      Offset(size.width / 2 - figuraSize / 1, offsetY),
      Offset(size.width / 2 + figuraSize / 1, offsetY),
      pintarLinea,
    );
    offsetY += espacio;

    // 3. Círculo
    Paint pintarCirculo = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width / 2, offsetY + figuraSize / 2),
      figuraSize / 2,
      pintarCirculo,
    );
    offsetY += figuraSize + espacio;

    // 4. Borde de un círculo
    Paint pintarBordeCirculo = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(
      Offset(size.width / 2, offsetY + figuraSize / 2),
      figuraSize / 2,
      pintarBordeCirculo,
    );
    offsetY += figuraSize + espacio;

    // 5. Cuadrado con texto encima
    Paint pintarCuadradoTexto = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    Rect filledSquareRect = Rect.fromLTWH(
      (size.width - figuraSize) / 2,
      offsetY,
      figuraSize,
      figuraSize,
    );
    canvas.drawRect(filledSquareRect, pintarCuadradoTexto);

    // Añadir texto encima del cuadrado
    TextSpan span = const TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 24),
      text: 'Gabriel Odahir Bardales Otzoy',
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout(
      minWidth: 0,
      maxWidth: 200,
    );
    tp.paint(canvas, Offset(
      filledSquareRect.left + (filledSquareRect.width - tp.width) / 2,
      filledSquareRect.top + (filledSquareRect.height - tp.height) / 2,
    ));

    offsetY += figuraSize + espacio;

    // 6. Línea curva
    Paint pintarCurva = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    Path path = Path();
    path.moveTo(0, offsetY);
    path.quadraticBezierTo(size.width / 2, offsetY + figuraSize, size.width, offsetY);
    canvas.drawPath(path, pintarCurva);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyCustomPainter oldDelegate) => false;
}
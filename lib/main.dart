import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<dynamic> animais = [
    {
      "id": "78412",
      "tipo": "Bovino",
      "nome": "Estrela",
      "sexo": "Fêmea",
      "peso": 225.3,
      "idade": 2,
      "abate": 2.5,
      "raca": "Nelore",
      "lote": 123,
      "imagem": "1729798538466.jpg",
    },
    {
      "id": "35798",
      "tipo": "Equino",
      "nome": "Relampago",
      "sexo": "Macho",
      "peso": 250,
      "idade": 1,
      "abate": 15,
      "raca": "Quarto de Milha",
      "lote": 121,
      "imagem": "1729803527343.png",
    },
    {
      "id": "35780",
      "tipo": "Equino",
      "nome": "Ravana",
      "sexo": "Fêmea",
      "peso": 250,
      "idade": 1,
      "abate": 15,
      "raca": "Quarto de Milha",
      "lote": 121,
      "imagem": "1729803527343.png",
    },
    {
      "id": "96412",
      "tipo": "Suino",
      "nome": "Nevasca",
      "sexo": "Fêmea",
      "peso": 60.3,
      "idade": 2,
      "abate": 2.2,
      "raca": "Santa Ines",
      "lote": 123,
      "imagem": "1729803538413.png",
    },
    {
      "id": "96412",
      "tipo": "Suino",
      "nome": "Mardita",
      "sexo": "Fêmea",
      "peso": 55.3,
      "idade": 2,
      "abate": 2.2,
      "raca": "Santa Ines",
      "lote": 123,
      "imagem": "1729803538413.png",
    },
    {
      "id": "52147",
      "tipo": "Equino",
      "nome": "Horácio",
      "sexo": "Macho",
      "peso": 350.1,
      "idade": 2,
      "abate": 20,
      "raca": "Manga Larga",
      "lote": 123,
      "imagem": "1729803527343.png",
    },
    {
      "id": "85473",
      "tipo": "Bovino",
      "nome": "Zebu",
      "sexo": "Macho",
      "peso": 398.4,
      "idade": 1,
      "abate": 2.5,
      "raca": "Zebu",
      "lote": 121,
      "imagem": "1729798538466.jpg",
    },
    {
      "imagem": "1729798538466.jpg",
      "tipo": "Bovino",
      "nome": "Boisão",
      "sexo": "Macho",
      "peso": 398.4,
      "idade": 1,
      "abate": 2.5,
      "raca": "Zebu",
      "lote": 121,
      "id": "85474",
    },
  ];
  List<dynamic> tipos = [];
  List<dynamic> animaisFiltrados = [];

  @override
  initState() {
    super.initState();
    tipos = animais
        .map((e) => e['tipo'])
        .toSet()
        .map((e) => {'tipo': e})
        .toList();
    animaisFiltrados = animais;
  }

  void filtrar([String? tipo]) {
    if (tipo == null) {
      setState(() {
        animaisFiltrados = animais;
      });
      return;
    }
    setState(() {
      animaisFiltrados = animais.where((e) => e['tipo'] == tipo).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.yellow,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Animais')),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 20,
              children: [
                Text('Tipos de Animais', style: TextStyle(fontSize: 20)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    spacing: 20,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          filtrar();
                        },
                        child: Text('Todos'),
                      ),
                      ...tipos.map(
                        (item) => ElevatedButton(
                          onPressed: () {
                            filtrar(item['tipo']);
                          },
                          child: Text(item['tipo']),
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Lista de Animais', style: TextStyle(fontSize: 20)),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, i) => ListTile(
                      trailing: Text(animaisFiltrados[i]['nome']),
                      title: Text(animaisFiltrados[i]['raca']),
                      subtitle: Text(animaisFiltrados[i]['tipo']),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://raw.githubusercontent.com/wellifabio/agro-api-jserver-swagger/refs/heads/main/uploads/${animaisFiltrados[i]['imagem']}',
                        ),
                      ),
                    ),
                    separatorBuilder: (_, _) => Divider(),
                    itemCount: animaisFiltrados.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

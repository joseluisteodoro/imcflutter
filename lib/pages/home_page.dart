import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:imcflutter/config/imc_save.dart';
import 'package:imcflutter/pages/models/imc.dart';
import 'package:imcflutter/shared/widgets/appcolors.dart';
import 'package:imcflutter/shared/widgets/tabletext.dart';
import 'package:imcflutter/shared/widgets/text_subtitle.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  TextEditingController pesocontroller = TextEditingController(text: "");
  TextEditingController alturacontroller = TextEditingController(text: "");
  String resultadoimc = "";
  String imcvalor = "";
  String notacao = "";
  IMC imcuser = IMC(0, 0);
  final _formkey = GlobalKey<FormState>();
  final box = Hive.box<ImcSave>('imc');
  // fim das variáveis

  @override
  Widget build(BuildContext context) {
    return Scaffold( //scafold
      backgroundColor: Appcolors.greenlight,
      onDrawerChanged: (isOpened) => FocusScope.of(context).requestFocus(FocusNode()),


      drawer: 
      Drawer( //Drawer

        backgroundColor: Appcolors.bluemedium,
        elevation: 10,
        surfaceTintColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            SizedBox(height: 50,),
            ListTile(
              textColor: Colors.white,
              title: Text("O que é IMC?", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              
            ),

            ListTile(
              textColor: Colors.white,
              title: Text("O IMC (Índice de Massa Corporal) é um cálculo que relaciona o peso de uma pessoa (em quilogramas) com a sua altura (em metros) ao quadrado, usando a fórmula: IMC = peso / (altura x altura). Ele é usado para classificar o estado nutricional de um indivíduo e identificar riscos à saúde associados ao peso, como desnutrição, sobrepeso ou obesidade, servindo como ferramenta de triagem e acompanhamento. "
              ),
            ),



            SizedBox(height: 10,),
            Divider(),
            SizedBox(height: 10,),


            Container(
              padding: EdgeInsets.all(8),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(color: Colors.white),
                children: [
                  TableRow(children: [TextTable(texto: "< 16"), TextTable(texto: "Magreza Grave")],),
                  TableRow(children: [TextTable(texto: "16 - 16,9"), TextTable(texto: "Magreza Moderada")],),
                  TableRow(children: [TextTable(texto: "17 - 18,4"), TextTable(texto: "Magreza Leve")],),
                  TableRow(children: [TextTable(texto: "18,5 - 24,9"), TextTable(texto: "Saudável")],),
                  TableRow(children: [TextTable(texto: "25 - 29,9"), TextTable(texto: "Sobrepeso")],),
                  TableRow(children: [TextTable(texto: "30 - 34,9"), TextTable(texto: "Obesidade Grau I")],),
                  TableRow(children: [TextTable(texto: "35 - 39,9"), TextTable(texto: "Obesidade Grau II (Severa)")],),
                  TableRow(children: [TextTable(texto: "≥ 40"), TextTable(texto: "Obesidade Grau III (Mórbida)")],),
                ],
              ),
            )


          ],
        ),
      ),


      appBar: AppBar( //Appbar
        title: Text("Calcuradora IMC"),
        backgroundColor: Appcolors.bluedark,
        foregroundColor: Colors.white,
        elevation: 8,
        shadowColor: const Color.fromARGB(255, 0, 70, 58),
      ),
      body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 10,), // Fomrulário
            Form(
              key: _formkey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextSubtitle(texto: "Digite seu peso"),
                TextFormField( //Campo de peso
                  controller: pesocontroller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(3)],
                  decoration: InputDecoration(labelText: "Digite apenas números", border: OutlineInputBorder(),hint: Text("Kg")),
                  validator: (value) => (value == null || value.isEmpty ) ? "Preencha este campo" : null,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                ),
                SizedBox(height: 10),
                TextSubtitle(texto: "Digite sua altura"),
                TextFormField( //Campo de altura
                  controller: alturacontroller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(3)],
                  decoration: InputDecoration(labelText: "Digite apenas números", border: OutlineInputBorder(),hint: Text("cm")),
                  validator: (value) => (value == null || value.isEmpty ) ? "Preencha este campo" : null,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                ),
                SizedBox(height: 10),
              ],
            )),
        


            TextButton(onPressed: (){ //Calcuar
                    
              if (_formkey.currentState!.validate()) {

                setState(() {
                debugPrint("Sucesso");
                imcuser.setpeso = double.parse(pesocontroller.text.trim());
                imcuser.setalturacm = double.parse(alturacontroller.text.trim());
                imcuser.calcular();
                resultadoimc = imcuser.resultadoimc();
                imcvalor = imcuser.getimc.toString();
                notacao = "kg/m²";

                box.add(
                  ImcSave(peso: imcuser.getpeso,
                          altura: imcuser.getalturacm,
                          imc: imcuser.getimc,
                          classificacao: resultadoimc,
                          data: DateTime.now())

                );

                    
                FocusScope.of(context).requestFocus(FocusNode());
                pesocontroller.clear(); alturacontroller.clear();     
                });
                         
              }
            },
              style: TextButton.styleFrom( //estilo do botão
                backgroundColor: Appcolors.bluedark,
                foregroundColor: Appcolors.greenlight,
              ),child: Text("Calcular",style: TextStyle(fontWeight: FontWeight.bold),),
                    


            ),
            TextButton(onPressed: () { //limpar
              box.clear();
              setState(() {
              });
              
            }, child: Text("Limpar")),
            SizedBox(height: 10),
            TextSubtitle(texto: resultadoimc),
            SizedBox(height: 10),
            Row( //resultado atual
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextSubtitle(texto: imcvalor),
                TextSubtitle(texto: notacao)
        
              ],
            ),
            SizedBox(height: 10),
            ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, box, _) {
                if (box.isEmpty) {
                  return const Text("Nenhum histórico");
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final item = box.getAt(index);

                    if (item == null) return const SizedBox.shrink();

                    return ListTile(
                      leading: Icon(Icons.history, color: Appcolors.bluedark),
                      title: Text(
                        "${item.imc.toStringAsFixed(2)} Kg/m² - ${item.classificacao}"
                      ),

                      subtitle: Text(
                        "${item.data.day}/${item.data.month}/${item.data.year}"
                      ),
                    );
                  }
                  );
              })
            ,
            
        
            
          ],
        ),
      ),
    )
    );
  }
}
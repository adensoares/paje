import 'package:paje/src/modules/atos/data/model/ato_model.dart';

class AtoRepository {
  List<AtoModel> atos = [
    AtoModel(
        tipo: 'sentenca',
        processo: '0012345-67.2018.8.01.0001',
        magistrado: 'Fulano de Tal',
        vara: '1ª Vara Cível',
        classe: 'Ação de Indenização',
        titulo: 'Sentença de procedência',
        data: '05/02/2022',
        texto: '''
        Ação de Indenização nº 0012345-67.2018.8.01.0001

        Vistos etc.

        Trata-se de ação de indenização por danos morais movida por A em face de B.

        O autor alega ter sofrido danos morais em decorrência de ofensas proferidas pelo réu em rede social.

        A parte ré apresentou contestação, mas não logrou êxito em afastar a responsabilidade civil.

        Pelo exposto, JULGO PROCEDENTE o pedido para condenar o réu ao pagamento de indenização por danos morais no valor de R\$ 10.000,00 (dez mil reais), corrigido monetariamente a partir desta data e acrescido de juros de mora de 1% ao mês a contar da citação.

        Sem custas ou honorários advocatícios, na forma do art. 55 da Lei 9.099/95.

        Sentença sujeita a reexame necessário.

        Intimem-se.
      '''),
    AtoModel(
        tipo: 'sentenca',
        processo: '0009876-54.2021.8.01.0002',
        magistrado: 'Beltrana da Silva',
        vara: '2ª Vara de Família',
        classe: 'Divórcio consensual',
        titulo: 'Sentença de homologação de acordo',
        data: '18/07/2022',
        texto: '''
        Divórcio consensual nº 0009876-54.2021.8.01.0002

        Vistos etc.

        Trata-se de ação de divórcio consensual proposta por XXX e YYY, na qual as partes requereram a homologação do acordo entabulado.

        Anexo ao petitório inicial, os requerentes juntaram termo de acordo (fls. X-Y), o qual foi devidamente assinado pelas partes e por seus respectivos advogados.

        Diante do exposto, HOMOLOGO o acordo entabulado entre as partes, para que produza seus efeitos legais.

        Custas e honorários na forma pactuada.

        Sem reexame necessário.

        Intimem-se.
      '''),
    AtoModel(
        tipo: 'sentenca',
        processo: '0000123-45.2022.8.01.0001',
        magistrado: 'Luciana da Silva',
        vara: '1ª Vara Cível',
        classe: 'Ação de Indenização',
        titulo: 'Indenização por Danos Morais',
        data: '10/02/2022',
        texto: '''
  Ação de Indenização nº 0000123-45.2022.8.01.0001

Vistos etc.

Trata-se de ação de indenização por danos morais movida por A em face de B.

A parte autora alega ter sofrido danos morais em decorrência de comentários injuriosos proferidos pelo réu em redes sociais.

O réu apresentou contestação, mas não logrou êxito em afastar a responsabilidade civil.

Pelo exposto, JULGO PROCEDENTE o pedido para condenar o réu ao pagamento de indenização por danos morais no valor de R\$ 5.000,00 (cinco mil reais), corrigido monetariamente a partir desta data e acrescido de juros de mora de 1% ao mês a contar da citação.

Custas e honorários advocatícios na forma pactuada.

Sentença não sujeita a reexame necessário.

Intimem-se.
  '''),
    AtoModel(
        tipo: 'despacho',
        processo: '0023456-78.2021.8.01.0003',
        magistrado: 'Sicrano de Oliveira',
        vara: '3ª Vara Criminal',
        classe: 'Ação penal',
        titulo: 'Despacho de designação de audiência',
        data: '20/02/2023',
        texto: '''
    Trata-se de ação penal proposta pelo Ministério Público em face de XXX, pela prática do crime previsto no art. 157, §2º, inciso II, do Código Penal.

    Conforme consta dos autos, o acusado foi preso em flagrante delito, após ter praticado roubo em uma loja de conveniência.

    Considerando que a instrução processual encontra-se em estágio avançado e que há necessidade de produção de prova oral, designo audiência de instrução e julgamento para o dia 10/04/2023, às 14h.

    Intimem-se as partes e as testemunhas arroladas pela acusação e pela defesa, para comparecimento na referida data e horário.

    Determino, ainda, que a Secretaria da Vara providencie a oitiva de policiais militares que efetuaram a prisão do acusado, oficiando-se à autoridade responsável pela sua condução à audiência.
  '''),
    AtoModel(
        tipo: 'despacho',
        processo: '0012345-67.2022.8.01.0001',
        magistrado: 'Fulano de Tal',
        vara: '1ª Vara Cível',
        classe: 'Ação de cobrança',
        titulo: 'Despacho de intimação para manifestação',
        data: '10/03/2023',
        texto: '''
Trata-se de ação de cobrança proposta por A em face de B.

 Conforme decisão proferida em audiência de conciliação, as partes celebraram acordo, comprometendo-se a pagar a dívida em 5 parcelas.

 Todavia, a parte autora informa que a parcela referente ao mês de fevereiro/2023 não foi paga, tendo decorrido o prazo para quitação.

 Assim, intime-se a parte requerida para, no prazo de 15 (quinze) dias, manifestar-se acerca do inadimplemento da obrigação assumida no acordo.

 Decorrido o prazo, voltem os autos conclusos para decisão.
  '''),
    AtoModel(
        tipo: 'despacho',
        processo: '0013456-78.2023.8.01.0002',
        magistrado: 'Ciclano de Tal',
        vara: '2ª Vara de Fazenda Pública',
        classe: 'Ação anulatória de débito fiscal',
        titulo: 'Despacho de determinação de prova pericial',
        data: '15/03/2023',
        texto: '''
      Trata-se de ação anulatória de débito fiscal proposta por A em face do Estado.

      Considerando a complexidade da matéria e a necessidade de produção de prova pericial, determino a realização de perícia contábil para apuração da existência e extensão do suposto débito fiscal objeto da lide.

      Designo como perito o Sr. XXX, contabilista registrado no CRC/XX sob o número XXXXX.

      Fixo o prazo de 10 (dez) dias para que as partes se manifestem acerca da indicação do perito e apresentem quesitos, sob pena de preclusão.

      Decorrido o prazo sem manifestação, intime-se o perito para que apresente proposta de honorários.

      Após, intimem-se as partes para que recolham a quantia referente aos honorários periciais, no prazo de 5 (cinco) dias, sob pena de extinção do processo.

      Cumpridas as diligências acima determinadas, voltem os autos conclusos para sentença.
'''),
    AtoModel(
      tipo: 'decisao',
      processo: '0000456-78.9012.0.02.0002',
      magistrado: 'Fulana de Tal',
      vara: '2ª Vara Cível',
      classe: 'Ação de Indenização',
      titulo: 'Decisão de Mérito',
      data: '12/03/2022',
      texto: '''
          Trata-se de ação de indenização por danos morais proposta por XXX contra YYY, em decorrência de atraso na entrega de produto adquirido pela internet.

          Verifico que o autor apresentou documentos suficientes para comprovar a sua alegação. Por outro lado, a ré, apesar de ter sido devidamente citada e intimada, deixou transcorrer o prazo para apresentar defesa.

          Diante do exposto, julgo procedente o pedido, condenando a ré a pagar ao autor a quantia de R\$ 10.000,00 (dez mil reais) a título de indenização por danos morais, acrescida de juros e correção monetária a partir desta decisão.

          P.R.I.
      ''',
    ),
    AtoModel(
        tipo: 'decisao',
        processo: '0012345-67.2019.8.12.3456',
        magistrado: 'João da Silva',
        vara: '2ª Vara Cível',
        classe: 'Ação de Indenização',
        titulo: 'Decisão Liminar',
        data: '10/05/2021',
        texto: '''
        Trata-se de ação de indenização por danos materiais e morais, em que a parte autora alega ter sofrido prejuízos em razão da conduta ilícita da parte ré.
        
        Passo a analisar o pedido de liminar. Verifica-se que a parte autora apresentou prova suficiente do alegado dano material, consistente em notas fiscais que demonstram as despesas com a reparação do veículo danificado. Contudo, não há elementos suficientes para se afirmar, neste momento, a ocorrência de dano moral, que depende da análise mais aprofundada das circunstâncias do caso em questão.
        
        Desse modo, concedo parcialmente a liminar para determinar à parte ré que proceda ao ressarcimento do valor comprovadamente gasto pela parte autora com a reparação do veículo, sob pena de multa diária de R\$ 500,00 (quinhentos reais), limitada a 30 dias de descumprimento. Quanto ao pedido de danos morais, indefiro a liminar, sem prejuízo de nova apreciação após a instrução processual.
        
        Cite-se a parte ré para, querendo, apresentar contestação no prazo legal.
        '''),
    AtoModel(
        tipo: 'decisao',
        processo: '0009876-54.2020.8.12.3456',
        magistrado: 'José da Silva',
        vara: '3ª Vara Criminal',
        classe: 'Ação Penal',
        titulo: 'Decisão de Pronúncia',
        data: '20/02/2022',
        texto: '''
        Trata-se de ação penal em que o Ministério Público imputa à acusada a prática do crime previsto no artigo 157, § 2º, I e II, do Código Penal.
        
        Passo a analisar a admissibilidade da acusação, nos termos do artigo 413 do Código de Processo Penal. Com base nos elementos probatórios carreados aos autos, vislumbro a existência de indícios suficientes da autoria e materialidade do delito imputado à acusada, a ensejar o recebimento da denúncia e posterior instrução processual.
        
        Ante o exposto, pronuncio a acusada nos termos da denúncia, para que seja submetida a julgamento perante o Tribunal do Júri, nos termos do artigo 413, § 2º, do Código de Processo Penal.
        
        Intimem-se as partes para oferecimento das respectivas alegações finais, nos termos do artigo 411, caput, do Código de Processo Penal.
        '''),
  ];

  List<String> getMagistrados() {
    return atos.map((ato) => ato.magistrado).toSet().toList();
  }

  List<String> getClasses() {
    return atos.map((ato) => ato.classe).toSet().toList();
  }

  List<String> getVaras() {
    return atos.map((ato) => ato.vara).toSet().toList();
  }
}

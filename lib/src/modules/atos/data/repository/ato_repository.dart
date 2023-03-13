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
        Vistos etc.

        Trata-se de ação de indenização por danos morais proposta por XXX em face de YYY, em decorrência de XXX. 

        A ré, citada, apresentou contestação (fls. X-Y) sustentando que XXX.

        É o relatório. Decido.

        Razões recursais.

        Cuida-se de recurso interposto por XXX contra sentença que rejeitou os embargos à execução fiscal opostos pela parte apelante.

        Insurge-se a embargante contra o juízo negativo proferido em face da alegada inconstitucionalidade da cobrança do tributo e da decadência do direito de ação do Fisco.

        Pugna, assim, pela reforma da sentença combatida para julgar procedentes os embargos e, por consequência, declarar a inexistência da dívida tributária.

        É o breve relatório. Passo à análise do apelo.
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
        Vistos etc.

        Trata-se de ação de divórcio consensual proposta por XXX e YYY, na qual as partes requereram a homologação do acordo entabulado.

        Anexo ao petitório inicial, os requerentes juntaram termo de acordo (fls. X-Y), o qual foi devidamente assinado pelas partes e por seus respectivos advogados.

        É o relatório. Decido.

        Razões recursais.

        Cuida-se de recurso interposto por XXX contra sentença que rejeitou os embargos à execução fiscal opostos pela parte apelante.

        Insurge-se a embargante contra o juízo negativo proferido em face da alegada inconstitucionalidade da cobrança do tributo e da decadência do direito de ação do Fisco.

        Pugna, assim, pela reforma da sentença combatida para julgar procedentes os embargos e, por consequência, declarar a inexistência da dívida tributária.

        É o breve relatório. Passo à análise do apelo.
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
    Vistos, etc.

    Trata-se de ação de indenização por danos morais movida por João da Silva em face de Empresa XYZ.

    Segundo a inicial, o autor teria sido vítima de ofensas verbais e humilhações no ambiente de trabalho, em razão de sua orientação sexual.

    A parte ré apresentou contestação, alegando que as supostas condutas não ocorreram e que, de qualquer forma, não houve dano moral a ser indenizado.

    Analisando o conjunto probatório dos autos, verifico que as alegações do autor restaram comprovadas, pois as testemunhas ouvidas em juízo confirmaram as humilhações sofridas pelo autor.

    Dessa forma, é inegável que o autor sofreu danos morais, que devem ser indenizados pela parte ré.

    Ante o exposto, julgo procedente o pedido inicial para condenar a Empresa XYZ a pagar a João da Silva a quantia de R\$ 20.000,00 (vinte mil reais) a título de indenização por danos morais.

    Custas e honorários advocatícios, estes fixados em 10% sobre o valor da condenação, ficam a cargo da parte ré.

    Publique-se. Registre-se. Intimem-se.
  '''),
    AtoModel(
        tipo: 'despacho',
        processo: '0001234-56.7890.1.23.4567',
        magistrado: 'Cicrano de Tal',
        vara: 'Vara do Trabalho de São Paulo',
        classe: 'Classe 2',
        titulo: 'Despacho 1',
        data: '01/03/2023',
        texto: '''
    Vistos.

    Diante da petição de fl. 20, intime-se a parte requerida para, no prazo de 05 (cinco) dias, se manifestar acerca do pedido de tutela provisória de urgência.

    Intimem-se.

    São Paulo, 01 de março de 2023.

    Juiz Cicrano de Tal
  '''),
    AtoModel(
        tipo: 'despacho',
        processo: '0009876-54.3210.9.87.6543',
        magistrado: 'Beltrana de Tal',
        vara: '2ª Vara de Família de Belo Horizonte',
        classe: 'Classe 3',
        titulo: 'Despacho 2',
        data: '28/02/2023',
        texto: '''
    Vistos.

    Recebo os documentos de fls. 105-115 como complemento de instrução, determinando a inclusão da audiência para o dia 10/03/2023, às 14h00min.

    Intimem-se as partes e testemunhas, se o caso, via mandado ou carta AR, devendo constar nos mesmos todas as advertências acerca das sanções por ausência injustificada.

    Diligencie-se.

    Belo Horizonte, 28 de fevereiro de 2023.

    Juíza Beltrana de Tal
  '''),
    AtoModel(
      tipo: 'despacho',
      processo: '0000123-45.6789.0.01.0001',
      magistrado: 'Beltrano da Silva',
      vara: '1ª Vara Federal',
      classe: 'Ação Civil Pública',
      titulo: 'Despacho de Intimação',
      data: '23/02/2022',
      texto: '''
          Recebo o pedido inicial e determino que o réu seja citado para, querendo, apresentar defesa no prazo legal.
          
          Dê-se vista dos autos ao Ministério Público Federal para que se manifeste acerca do pedido de tutela antecipada.
          
          Intimem-se as partes.
      ''',
    ),
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

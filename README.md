# ticket_online

Grupo de integrantes:

João Victor Carvalho.
Alysson Victor dos Santos
Andrei João Peretto.

#### Descrição:

Projeto voltado para automatização de um problema real, diversas faculdades tem seus Restaurantes Universitários porém para se a realizar uma refeição é necessário, comprar um ticket de papel e entrega-lo no momento que vai consumir.

O app tem como Objetivo funcionar como um bilhete de ônibus onde podemos carregar com quantidades de tickets, porém voltado para a alimentação dos estudantes nos restaurantes universitários.

#### Instruções de uso

Para realizar o login, utilizar conta que é gerada ao utilizar o app "ra": "111111" e "senha": "Aluno22@22"
Para realizar uma compra de refeição, o QR escaneado deve representar o valor 10 (https://br.qr-code-generator.com/)
Para realizar uma compra de ticket você deve usar um dos cartões de teste do ML https://www.mercadopago.com.br/developers/pt/docs/checkout-api/integration-test/test-cards

#### Bibliotecas utilizadas:

flutter_barcode_scanner: ^2.0.0
pay: ^1.0.8
mercado_pago_mobile_checkout: ^0.1.1
http: ^0.13.4
sqflite: 2.0.2+1
provider: 6.0.2


#### Erros e ajustes faltantes:

Ao realizar uma compra, os dados no banco de dados são atualizados mas as listagens de histórico não são alteradas.
Ao realizar um login novamente o saldo do usuário é resetado para o inicial.




## Análise do Perfil de Consumo de Restaurante com SQL

Esse projeto faz parte do [8 Week SQL Challenge](https://8weeksqlchallenge.com/) elaborado e disponibilizado pelo [Data With Danny](https://www.datawithdanny.com/).

As análises foram realizadas com PostgreSQL utilizando o pgAdmin. 

## Introdução

Danny ama tanto comida japonesa, que decidiu abrir um restaurante no início de 2021, para fornecer seus 3 pratos favoritos: sushi, curry e ramen.
Porém, Danny notou que para manter seu restaurante funcionando, é necessário entender melhor seus clientes, suas preferências e padrões de comportamento.
O restaurante coletou alguns dados básicos dos primeiros meses de funcionamento, mas não tem ideia de como usar esses dados para trazer melhorias para o negócio.

## Problema

Danny quer usar os dados para responder algumas perguntas simples sobre seus clientes, especialmente sobre seus padrões de visita, quanto eles gastaram e quais itens do cardápio são os favoritos. Ter essa conexão mais profunda com seus clientes o ajudará a oferecer uma experiência melhor e mais personalizada para seus clientes leais.
Ele planeja usar essas informações para decidir se deve expandir o programa de fidelidade existente para os clientes. Além disso, ele precisa de ajuda para gerar alguns conjuntos de dados básicos para que sua equipe possa inspecionar os dados facilmente sem precisar usar SQL.
Danny forneceu uma amostra dos dados gerais de seus clientes devido a questões de privacidade, mas espera que esses exemplos sejam suficientes para você escrever consultas SQL totalmente funcionais para ajudá-lo a responder suas perguntas.

## Conjunto de Dados

Danny compartilhou três conjuntos de dados-chave para este estudo de caso: 

**1. Sales:** Esse conjunto de dados possui informações das transações que ocorrem no restaurante, como ID do cliente, pedidos realizados e a data da compra.

**2. Menu:** Inclui os itens disponíveis no menu, com seu identificador e o preço.

**3. Members:** Os dados incluem informações de quando os clientes aderiram ao programa de fidelidade e seus identificadores.

## Diagrama de Relacionamento
![image](https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/a97af4a3-4c1b-4209-b908-8af5dbc3a8b2)

## Database

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/8a276b2e-5f48-408a-bf7a-42d8aec83ebd" width="40%"/>

## Análises

**1. Qual é o valor total gasto por cada cliente no restaurante?**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/7c43df0b-1e57-4a98-8b38-35f51c90af86" width="40%"/>
</div>

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/8d6a39e0-6f16-4c85-bfe4-9f56936d74a5" width="40%"/>

&nbsp;

**2. Quantos dias cada cliente visitou o restaurante?**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/24cb91da-c864-42ef-952a-2691c3c96e10" width="40%"/>
</div>

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/56d1e820-1694-4594-8094-20c5683e34b3" width="40%"/>

&nbsp;

**3. Qual foi o primeiro item do cardápio comprado por cada cliente?**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/53526183-73ad-4e81-b107-03acf5713b61" width="60%"/>
</div>

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/b2b86158-d58a-4955-a9e2-c9844da8dd58" width="60%"/>

&nbsp;

**4. Qual é o item mais comprado no cardápio e quantas vezes foi pedido por todos os clientes?**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/e500e120-610f-4a26-b985-dc2cb9608ee1" width="60%"/>
</div>

&nbsp;

**Item mais comprado do cardápio**

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/b0f5195d-f83c-4345-a498-7e9e8d710daf" width="60%"/>

&nbsp;

**Itens comprados por clientes**

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/2d8dea0e-3bd8-4bd9-b7ab-cb60438388a9" width="60%"/>

&nbsp;

**5. Qual item foi mais popular para cada cliente?**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/7119a8bc-fdaa-4001-8ea1-d766effa2494" width="40%"/>
</div>

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/f0f81bf5-f24c-4665-8ff6-86b0dade5f77" width="40%"/>

&nbsp;

**6. Qual foi o primeiro item adquirido por cada cliente após tornar-se membro?**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/75d44105-2492-4088-8ce9-952ccf8855e4" width="60%"/>
</div>

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/3fdab66c-03ba-49e0-921c-d1a6903b743f" width="60%"/>

&nbsp;

**7. Qual item foi adquirido antes de o cliente se tornar um membro?**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/bd62d1c9-a2b8-4946-a79d-327e047c1cf6" width="60%"/>
</div>

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/763e7f9d-fb5e-4812-9fc0-5f2b2ee4b57e" width="60%"/>

&nbsp;

**8. Qual é o total de itens e valor gasto por cada membro antes de se tornarem membros?**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/5f5f530f-61fe-42b2-b990-660ee0973824" width="40%"/>
</div>

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/e351b72c-35c4-46e1-b248-35f998ecc73f" width="40%"/>

&nbsp;

**9. Se cada $1 gasto equivale a 10 pontos e o sushi tem um multiplicador de pontos de 2x, quantos pontos cada cliente teria?**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/1d06e900-fa89-4680-be5e-ba5d304979b0" width="50%"/>
</div>

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/b286b7c5-e2c6-4152-9b08-0f6ffae87d19" width="50%"/>

 &nbsp;

**10. Durante a primeira semana após a adesão de um cliente ao programa (incluindo a data de inscrição), eles recebem pontos em dobro em todos os itens, não se limitando ao sushi. Ao considerar essa promoção, quantos pontos os clientes A e B acumulariam no final de janeiro?**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/d2a7b2ca-7cf0-4c3e-b54f-51464518c699" width="40%"/>
</div>

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/3b7fe73b-c941-45ae-8765-eab0b038cf3c" width="40%"/>

&nbsp;

## Bônus

As questões a seguir estão relacionadas à criação de tabelas de dados que Danny e sua equipe podem usar para obter insights rapidamente, sem a necessidade de unir as tabelas subjacentes usando SQL.

### Join All The Things

Recrie a tabela abaixo usando os dados disponíveis:

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/0fa4ddaf-a6fd-461b-8bee-3e87620ca30e" width="50%"/>

&nbsp;

**Resultado:**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/a52ecb2d-5d3f-41a9-8724-9f54c749605b" width="50%"/>
</div>

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/5d09a2f9-a8e3-42b5-b513-73ec4c9e634e" width="50%"/>

 ### Rank All Things

Para aprimorar a análise, Danny precisa de mais informações sobre a classificação dos produtos pelos clientes. No entanto, ele especificamente dispensa a classificação para compras de não membros, e, portanto, espera valores de classificação nulos nos registros quando os clientes ainda não fazem parte do programa de fidelidade.

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/3dbcf3ae-aa6b-44d0-8035-1d0d86345e0b" width="50%"/>
</div>
&nbsp;

**Resultado:**

<div align='left'>
<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/6086f90e-e4b3-4103-8c2c-8746dc99049d" width="60%"/>
</div>

<img src="https://github.com/FernandaMP/project-dannys-dinner/assets/110065859/1c4c2334-8ec1-4f7b-bd20-0addbd0a6ef6" width="60%"/>




 

 





















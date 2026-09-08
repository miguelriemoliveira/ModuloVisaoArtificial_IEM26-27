# IEM — Módulo de Visão Artificial
# Aula Teórico-Prática — Da imagem às coordenadas

**Departamento de Engenharia Mecânica · Universidade de Aveiro**\
**Docente:** Miguel Riem de Oliveira · **Duração:** 1 hora

---

## Objetivo desta aula

Na primeira aula prática foram adquiridas as ferramentas de MATLAB necessárias
ao módulo, e foi resolvido, sobre uma **fotografia**, o problema de localizar
uma mancha vermelha.

Nesta aula estabelece-se a ponte para a aplicação final: compreender por que
razão aquele procedimento resolve o problema, e substituir a fotografia por uma
**câmara em funcionamento**. Na aula prática seguinte, o programa será
construído na íntegra.

---

# 1. Por que motivo isto é difícil

Estima-se que cerca de 90% da capacidade de processamento do cérebro humano
seja dedicada ao tratamento de informação visual. É a tarefa mais exigente que
o cérebro executa, e é executada sem qualquer esforço consciente: ao observar
esta sala, o reconhecimento das pessoas, dos objetos e das distâncias é
imediato.

# 2. O problema: substituir o rato

Considere um programa de desenho convencional. Quando o utilizador pinta com o
rato, aquilo que é efetivamente fornecido ao programa é uma sequência de
**coordenadas** `(x, y)` ao longo do tempo. O programa liga esses pontos e
surge o traço.

```
   rato ────────────────────┐
                            ├──► coordenadas (x,y) ──► traço no ecrã
   câmara + objeto vermelho ┘
```

O **IEM Paint** substitui o rato por uma câmara. O utilizador segura um objeto
vermelho, a câmara observa-o, e o programa determina a posição desse objeto na
imagem. O resto do programa de desenho mantém-se inalterado.

Toda a visão por computador deste módulo existe para produzir aquele par de
números. Assim que essas duas coordenadas estejam disponíveis, o problema
está resolvido.

# 3. Uma imagem é uma matriz

A imagem proveniente da câmara tem `L` linhas por `C` colunas, com uma terceira
dimensão de valor 3. Trata-se de **três matrizes sobrepostas**: uma indica,
para cada pixel, a quantidade de vermelho; outra a de verde; outra a de azul.

```
                   ┌──────────────┐
                   │              │ ← azul
                ┌──┴───────────┐  │
                │              │ ←│ verde
             ┌──┴───────────┐  │  │
             │              │ ←┘  │ vermelho
             │  L x C x 3   │─────┘
             └──────────────┘
```

O elemento mínimo da imagem é o **pixel**: um quadrado ao qual correspondem
três valores. Como a imagem é uma grelha regular de quadrados, e uma matriz é
uma grelha regular de elementos, a representação de imagens por matrizes é
imediata — e é a razão pela qual o MATLAB é adequado a este trabalho.

# 4. O cubo das cores

Representando os três valores — R, G e B — como três eixos, cada cor possível
corresponde a um ponto no interior de um cubo de lado unitário.

A analogia é a de um pintor com três guaches na paleta:

| Guaches utilizados | R, G, B | Resultado |
|---|---|---|
| apenas vermelho | 1, 0, 0 | vermelho puro |
| apenas azul | 0, 0, 1 | azul puro |
| nenhum guache | 0, 0, 0 | preto |
| todos no máximo | 1, 1, 1 | branco |
| vermelho e verde | 1, 1, 0 | amarelo |

Cada um dos vértices do cubo corresponde a uma destas situações; qualquer ponto
no seu interior corresponde a uma cor distinta.

![O cubo das cores RGB: cada ponto é uma cor, desenhada com a sua própria cor; os vértices são as cores puras da tabela](cubo_rgb.png)

A figura foi gerada em MATLAB: sorteiam-se 1500 cores e desenha-se cada uma na
posição correspondente do cubo, com a sua própria cor.

# 5. Detetar uma cor é definir uma região no cubo

A primeira ideia seria procurar, na imagem, os pixels de cor vermelha, isto é,
com `R = 1, G = 0, B = 0`.

**Essa abordagem não funciona**, porque no mundo real não existem cores puras.
Um objeto vermelho apresenta valores da ordem de `0.87, 0.12, 0.19`, e esses
valores variam com a iluminação da sala, com a sombra da mão e com a posição do
objeto.

Não se procura, portanto, *um ponto* no cubo, mas sim uma **região**: um
intervalo de valores admissíveis para cada canal.

```
   R entre 0.8 e 1.0   e   G entre 0.0 e 0.3   e   B entre 0.0 e 0.3
```

São seis parâmetros. Não existem valores universalmente corretos: dependem do
objeto e da iluminação, e terão de ser ajustados em cada situação. Por esse
motivo devem ficar reunidos numa secção de parâmetros no topo do programa, e não dispersos pelo
código.

Verificar se um pixel pertence a esta região é uma comparação. Verificar se
**todos** os pixels pertencem a esta região é a mesma comparação aplicada às
matrizes completas — precisamente o que foi praticado na secção 4 da
primeira aula prática. O resultado é uma **máscara**: uma matriz de valores
verdadeiro/falso, com a dimensão da imagem, verdadeira apenas nos pixels de
interesse.

# 6. Da máscara às coordenadas

Determinada a máscara, sabe-se *quais* são os pixels de interesse, mas ainda
não *onde* se encontram. Obtêm-se as coordenadas de linha e de coluna de todos
os pixels verdadeiros e calcula-se a sua média: o resultado é o **centro de
massa** da mancha.

São estas duas médias que substituem o rato.

Note-se o caso limite: quando o objeto não está presente na imagem, a máscara
não tem qualquer pixel verdadeiro, e a média de um conjunto vazio não é um
número. Esta situação terá de ser explicitamente tratada, sob pena de o
programa gerar um erro.

---

# Demonstração — ligar a câmara

A partir deste ponto a aula passa à construção, ao vivo, do início do programa.
Acompanhe no seu computador, se lhe for possível; o objetivo, contudo, é
compreender o procedimento, e não transcrevê-lo. O programa completo será
construído por cada aluno na aula prática seguinte.

**T1.** Listar as câmaras ligadas ao computador com `webcamlist` e criar o
objeto correspondente:
```matlab
cam = webcam(1);
```
Caso existam duas câmaras, experimentar ambos os índices: uma delas poderá ser
de infravermelhos.

**T2.** Adquirir **uma** imagem da câmara com `snapshot` e apresentá-la com
`imshow`. Verificar as suas dimensões e confirmar que se trata de uma matriz
idêntica às da primeira aula prática.

**T3.** Obter vídeo. Vídeo consiste em adquirir uma imagem e apresentá-la,
repetidamente e sem termo, pelo que se coloca a aquisição e a visualização no
interior de um ciclo infinito:
```matlab
while 1
    ...
    pause(0.05);
end
```
Antes de executar: que sucederia caso a pausa fosse omitida?

> Para interromper o programa: **Ctrl+C** na *Command Window*.

**T4.** Reduzir a imagem para metade (`imresize`) e convertê-la para valores
entre 0 e 1 (`im2double`), imediatamente após a aquisição. A redução torna o ciclo fluido; a conversão
coloca os valores na gama pressuposta pelos limiares de cor.

**T5.** Criar, antes do ciclo, uma variável contador com o valor zero e
incrementá-la em cada iteração. Fazer com que uma determinada instrução seja
executada **apenas na primeira iteração**.

Este padrão parece dispensável nesta fase. Na aula seguinte, é ele que cria a
folha em branco sobre a qual se pinta.

**T6.** Dividir a figura em duas células com `subplot`: a imagem da câmara na
superior e, na inferior, a máscara do vermelho — a mesma instrução escrita no
exercício 28 da primeira aula prática, aplicada agora à imagem da câmara.

**T7.** Apresentar um objeto vermelho à câmara e ajustar os seis limiares até
que a mancha branca corresponda ao objeto e a mais nada.

Se a mancha acompanhar o movimento do objeto, o programa **já o está a
detetar**. Falta determinar o seu centro e pintar — que é o trabalho da aula
prática seguinte.

---

## Avaliação do módulo

A avaliação consiste na construção do programa **IEM Paint** na aula prática 2,
seguindo o respetivo guião, em **grupos de 2 alunos**.

O que é entregue:

1. **O ficheiro `iem_paint.m`**, com um cabeçalho em comentário contendo o nome
   e o número mecanográfico de cada um dos dois membros do grupo, e ainda o
   **URL de um vídeo** que demonstre o programa a funcionar. O vídeo deve ter
   comentários, em voz ou em texto, a explicar o que o programa está a fazer em
   cada momento.

   Exemplo de cabeçalho, a copiar e ajustar:
   ```matlab
   % iem_paint.m — IEM Paint: pintar com a câmara em vez do rato
   % IEM 2026/27 — Módulo de Visão Artificial, DEM, Universidade de Aveiro
   %
   % Grupo:
   %   Maria Silva      NMec 123456
   %   João Santos      NMec 123457
   %
   % Vídeo de demonstração:
   %   https://youtu.be/xxxxxxxxxxx
   ```

2. **A submissão no e-learning.** É feita **por apenas um dos membros do
   grupo**; na submissão devem constar o nome e o número mecanográfico dos dois
   elementos. Não deve haver duas submissões para o mesmo grupo.

O programa base — vídeo, deteção de cor, centro de massa e pintura na tela —
corresponde a uma entrega suficiente. Valorizam a avaliação, entre outros:

- **Mais do que uma cor.** Detetar um segundo objeto, por exemplo azul, com o
  seu próprio conjunto de limiares, e pintar com uma cor diferente.
- **Largura do lápis ajustável** com o programa em execução, através do
  teclado, ou em função da distância do objeto à câmara.
- **Fluidez.** O programa deve correr sem engasgar: imagem reduzida, nada a
  escrever na *Command Window* dentro do ciclo, traço contínuo mesmo quando o
  objeto se move depressa.
- **Robustez da deteção.** Limiares bem afinados, que não perdem o objeto
  quando este se afasta ou muda de iluminação, e sem falsas deteções.
- **Interação por teclado**: mudar de cor, limpar a tela, borracha.
- **Pintura sobre o vídeo**, com transparência.
- **Guardar o desenho** num ficheiro de imagem.
- **Qualidade do código**: cabeçalho, parâmetros no topo, nomes claros,
  comentários.
- **Qualidade do vídeo**: curto, com o programa visível e os comentários a
  explicar o que se está a ver.

**Critérios de avaliação** (as secções referem-se ao guião da aula prática 2):

| | |
|---|---|
| Secções 1 e 2 — vídeo em execução e deteção de cor funcional | 25% |
| Secção 3 — centro de massa correto e assinalado na imagem | 20% |
| Secções 4 e 5 — tela, pintura e espessura | 25% |
| Legibilidade do código — cabeçalho, nomes claros, comentários, parâmetros no topo | 10% |
| Secções 6 a 8 e possíveis melhorias | 20% |

É preferível entregar um trabalho incompleto dentro do prazo do que um trabalho
completo fora de prazo. Não se espera uma entrega perfeita.

> **Prazo:** a definir.

---

## Preparação para a aula prática seguinte

- Traga um **objeto vermelho** de cor saturada. Em alternativa, poderá utilizar
  o ecrã do telemóvel preenchido a vermelho.
- Confirme que os passos T1 a T3 são executados corretamente no seu computador.
  Caso a câmara não seja detetada, resolva a instalação antes da aula: em
  <https://www.ua.pt/pt/stic/matlab> encontra a licença, e o componente em
  falta será, quase certamente, o *MATLAB Support Package for USB Webcams*.
- Reveja os exercícios 24 a 34 da primeira aula prática. São o núcleo do que
  será necessário.

## Funções e comandos desta aula

| | |
|---|---|
| Câmara | `webcamlist`, `webcam`, `snapshot` |
| Ciclo | `while`, `pause` |
| Imagem | `imresize`, `im2double`, `imshow`, `subplot` |
| Deteção | `I(:,:,1)`, operadores `>=`, `<=`, `&` |

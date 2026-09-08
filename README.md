# Módulo de Visão Artificial — IEM 2026/27

**Introdução à Engenharia Mecânica** · Departamento de Engenharia Mecânica,
Universidade de Aveiro · 1º semestre de 2026/27
**Docente:** Miguel Riem de Oliveira

## O módulo

Primeiro contacto dos alunos do 1º ano com a programação, através do MATLAB.
O fio condutor é uma única aplicação, construída passo a passo ao longo de
duas semanas: o **IEM Paint**, um programa de desenho em que o rato é
substituído pela câmara do computador portátil. O utilizador segura um objeto
vermelho, o programa localiza-o na imagem, calcula o seu centro e usa essas
coordenadas para pintar numa tela.

Conceitos trabalhados: variáveis, matrizes e indexação, operadores relacionais
e lógicos, máscaras binárias, ciclos e condições, funções e visualização — todos
com uma finalidade visível na aplicação final.

## Aulas

| Sessão | Duração | Conteúdo | Guião |
|---|---|---|---|
| Aula prática 1 | 3h | Primeiros passos em MATLAB; deteção de cor numa fotografia | [`aula1_prática/`](aula1_prática/) |
| Aula teórico-prática | 1h | Da imagem às coordenadas; ligar a câmara | [`aula1_tp/`](aula1_tp/) |
| Aula prática 2 | 3h | Construção do IEM Paint (avaliada) | [`aula2_prática/`](aula2_prática/) |

Cada pasta contém o guião da aula no respetivo `README.md`, juntamente com os
ficheiros necessários (por exemplo, a fotografia usada na aula prática 1).

## Antes da primeira aula

O MATLAB é disponibilizado gratuitamente aos estudantes da UA em
<https://www.ua.pt/pt/stic/matlab>. Instale, além do MATLAB:

- Image Processing Toolbox
- Image Acquisition Toolbox
- MATLAB Support Package for USB Webcams (instalado depois, através do
  *Add-On Explorer*; requer ligação à Internet)

Confirme que o comando `webcamlist` reconhece a câmara do computador portátil,
e traga um objeto vermelho de cor saturada.

## Avaliação

Definida no guião da aula prática 2.

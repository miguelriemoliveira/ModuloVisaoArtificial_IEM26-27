
%% Cabeçalho do programa
% Miguel Oliveira
% 16664
% Programa IEM 26-27 Aula P1
clc
clear all


%% Ex a

a = 5;
b = 6;
carlos = 9;
d = a + b + carlos

%% Ex matrizes
%tres instantes de tempo, av é um vetor com os tres valores em cada instante

vportugal = [11  12  13]

vespanha =  [20  22  25]

vfranca =   [30   25  20]


% consultar um dos valores da matrizx
total_20 = vportugal(1) + vespanha(1) + vfranca(1)
total_30 = vportugal(2) + vespanha(2) + vfranca(2)
total_40 = vportugal(3) + vespanha(3) + vfranca(3)


vtotais = vportugal + vespanha + vfranca

sum(vtotais)

%% Futebol

jogo1 = [10 10 12 14 22
         5  20 49 30 15
         3  5  15  8 12]

% jogo2 = [10 10 12 14 22
%     5  20 49 30 15
%     3  5  15  8 12]

jogo2 = rand(3,5)*10

% Será que este jogo demorou 90 minutos?

% sum(sum(jogo1))

% a) tempo total dos dois jogos

total_jogo1 = sum(sum(jogo1))
total_jogo2 = sum(sum(jogo2))
total_jogos = total_jogo1 + total_jogo2

total_jogos = sum(sum(jogo1)) + sum(sum(jogo2))

% b) obter um vetor do lado esquerdo completo do jogo
lado_esq_jogo2 = jogo2(1,:)

% c) calcular o tempo médio gasto nas balizas por jogo

tempos_balizas = [jogo1(2,1), jogo1(2,5) jogo2(2,1), jogo2(2,5)]
tempos_balizas = [jogo1(2,1), jogo1(2,5) jogo2(2, [1,5])]

tempo_medio_balizas = mean(tempos_balizas)


%% ex3 

I = imread('dem_ua.jpg');

Igray = rgb2gray(I); % converte para imagen cinzentos


% ver imagem
imshow(Igray)

% tornar a imagem mais brilhante
Igray_escura = Igray + 100; 


figure()

imshow(Igray_escura)

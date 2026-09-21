%% Cabeçalho 
% Autor: Miguel Oliviera
% Data: Setembro 2026
clc % limpar o terminal
clear all % limpar variaveis da memoria
close all % limpar todas as figuras

%% Variaveis 

antonio = 3;
b = 2;
c = antonio + b;


%% Matrizes


idades = [18 17 18 18];
idades(2);


tempos = [5  5  7
         10  15 22
         15  30 21
         3   9  5];

% a) soma do tempo total passado nas zonas de cantos

tempo_cantos = [tempos(1,1) tempos(1,3) tempos(4,1) tempos(4,3)];

soma_tempos_cantos = sum(tempo_cantos);

% alternativas:

soma_tempos_cantos = tempos(1,1) +tempos(1,3) +tempos(4,1) +tempos(4,3);

% b) media dos tempos passados em zonas da ala esquerda


tempos_ala_esquerda = tempos(1:4, 1);

media_tempos_ala_esquerda = mean(tempos_ala_esquerda);

% Santiago
% media_tempos_ala_esquerda = sum(tempos(1:4, 1))/4


%% Exercicio imagens


imagem = imread('dem_ua.jpg');

% coloca os valores da imagem entre 0 e 1
imagem = im2double(imagem);

% colocar a imagem em niveis de cinzento
imagem_cinzentos = rgb2gray(imagem);

imshow(imagem_cinzentos)


% Jorge
imagem_jorge = imagem_cinzentos;
imagem_jorge = imagem_jorge * 0 + 1;

figure(2)
imshow(imagem_jorge)
title('Imagem de Jorge')

% Santiago
imagem_santiago = imagem_cinzentos * 1.2;
figure(3)
imshow(imagem_santiago)
title('Imagem de Santiago')

%% Desafio tres partes (verticais)

% Separar a imagem cinzentos em 3 partes
parte_esquerda = imagem_cinzentos(:, 1:640);
parte_meio = imagem_cinzentos(:, 640:1280);
parte_direita = imagem_cinzentos(:, 1280:end);

% escurecer e clarear
parte_esquerda = parte_esquerda * 0.6;
parte_direita = parte_direita * 1.4;

% Juntar as partes
imagem_final = [parte_esquerda parte_meio parte_direita];

figure(4)
imshow(imagem_final)

%% Desafio tres partes (horizontais)

% Separar a imagem cinzentos em 3 partes
parte_esquerda = imagem_cinzentos(1:427, :);
parte_meio = imagem_cinzentos(428:854, :);
parte_direita = imagem_cinzentos(854:end, :);

% escurecer e clarear
parte_esquerda = parte_esquerda * 0.6;
parte_direita = parte_direita * 1.4;

% Juntar as partes
imagem_final = [parte_esquerda; parte_meio; parte_direita];



figure(4)
imshow(imagem_final)


%% Moldura

imagem_moldura = imagem_final;

imagem_moldura(1:50, :) = 0;
imagem_moldura(end-50:end, :) = 0;

figure(5)
imshow(imagem_moldura)

%% tornar moldura mais clara

imagem_moldura2 = imagem_final;

imagem_moldura2(1:50, :) = imagem_moldura2(1:50, :)*1.5;
imagem_moldura2(end-50:end, :) = 0;

figure(6)
imshow(imagem_moldura2clc
)
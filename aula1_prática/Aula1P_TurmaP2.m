%% Cabeçalho
% Autor: Miguel Oliveira
% Data: 21-9-26
% Programa para turma IEM P1

clc % limpar o command window
clear all % limpar a memoria do programa
close all; % fechar todas as figuras

%% Exercicio 1 

a = 8; % ponto e virgla para sumprimir a impressao para o terminal

bruna = 3;

c = a + bruna

%% Exercicio matrizes

v1 = [21 22 33 44];
v2 = [12 10];

% media do vetor 1
media_v1 = mean(v1)



% matriz é um vetor a duas dimensões

M = [1 2 3 4
     5 6 7 8
     9 10 11 12]


%% Exercicio campo futebol
clc

tempos = [20 25 17  2
          15 25 30  1
           5  5 10  3]

% a) obter a soma dos tempos nos cantos
tempos_cantos = [tempos(1,1) tempos(1,4) tempos(3,1) tempos(3,4)]
soma_tempos_cantos = sum(tempos_cantos)

% tudo ao molhe
% soma_tempos_cantos = sum([tempos(1,1) tempos(1,4) tempos(3,1) tempos(3,4)])

% b) obter a soma do tempo no lado esquerdo do campo
lado_esquerdo = tempos(1, :)
soma_lado_esquerdo = sum(lado_esquerdo)

% c) obter a media do tempo nas zonas do lado direito
lado_direito = tempos(3, :)
media_lado_direito = mean(lado_direito)

%% Exercicio imagens

clc

imagem = imread('dem_ua.jpg');

imagem = im2double(imagem); % converte os valores dos pixeis para [0 - 1]

imagem_gray = rgb2gray(imagem); % conversao para cores cinzentas

% imagem_gray(500:800, :) = 1; % pintar faixa branca

figure; 
imshow(imagem_gray)


figure;
imagem_gray_clara = imagem_gray * 1.2;
imshow(imagem_gray_clara)


%% Desafio escurecer, manter, clarear


%% partir a imagem em subimagens, altera-las e depois juntar
E = imagem_gray(:, 1:640);
M = imagem_gray(:, 641:2*640);
D = imagem_gray(:, 2*640+1:end);

% alterar as imagens
E = E *0.5;
D = D * 1.5;

figure; 
imshow(E) 
title('Esquerda')

figure; 
imshow(M) 
title('Meio')

figure; 
imshow(D) 
title('Direita')

% juntar as subimagens alteradas

imagem_alterada = [E M D];

% imagem_alterada = [E; M; D];

figure; 
imshow(imagem_alterada) 
title('imagem_alterada')

%% nao partir e alterar a imagem diretamente nas zonas alvo

imagem_alterada2 = imagem_gray;


% pintar a parte esquerda
imagem_alterada2(:, 1:640) =  imagem_alterada2(:, 1:640) * 0.5;


figure; 
imshow(imagem_alterada2) 
title('imagem_alterada2')







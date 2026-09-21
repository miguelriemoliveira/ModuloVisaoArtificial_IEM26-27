%% Cabeçalho
% Nome: Aula 1 IEM
% Autor: Miguel
clc
clear all% limpar toda a memoria

%% Ex1  
3 + 3;

5*5;

33-21;

4 + 6 -2 * 4;

%% Ex 2

ana = 3 + 3

b = 5*ana

c = 14

d = ana + b + c

%% Ex 3 - vetores e matrizes
clc

n1 = -2;
n2 = 9;
n3 = 3;

n4 = 7;
n5 = 65;
n6 = 11;

% construir vetores
g1 = [-2 9 3];
g2 = [7 65 11];

g1(2);

% Desafio: calcular a soma dos primeiro, segundo ...
% e terceiros numeros favoritos

%soma_1 = -2 + 7
%soma_2 = 9 + 65
%soma_3 = ?

%% Ex4

% Tempo de posse de bola num representação matricial 
% de um campo de futebol

campo = [10 11 12; 22 24 34
    34 45 44; 11 12 17]


% a) calcular a soma dos tempos em que a bola 
% esteve nas balizas
soma_balizas = campo(1, 2) + campo(4, 2)
soma_balizas_enzo = sum( campo( [1, 4], 2))

% b) media de minutos nas zonas do lado esquerdo
% usar a função "mean"

lado_esquerdo = campo( 1:4, 1)

media_lado_esquerdo = mean(lado_esquerdo)

% c ) criar um campo 2, e calcular a soma todos 
% os tempos em cantos

% criar uma matriz aleatória

campo2 = rand(4,3) * 30

valor_cantos = [campo(1,[1,3]), campo(4, [1,3]) ...
    campo2(1,[1,3]), campo2(4, [1,3])]

soma_cantos = sum(valor_cantos)


%% Ex 5 Imagens
clc

%& ler uma imagem

imagem = imread('dem_ua.jpg');

imagem_gray = rgb2gray(imagem);

imshow(imagem_gray)


figure(2)

imagem_gray_clara = imagem_gray + 50
imshow(imagem_gray_clara)


% desafio:

% tenho uma imagem do DEM



















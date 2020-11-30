%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Integrantes: Israel Arévalo 18267
%             José Ponce     18187
%             Carlos Letona  18082
%
%Materia: Teoría electromagnética 2
%
%Año: 2020
%
%Descripción: Este programa grafica el potencial, campo eléctrico y densidad de superficie
%             del problema 1.a de coordenadas cilíndricas.
%
%Referencias: Ninguna
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Código extraído de: https://stackoverflow.com/questions/58199830/how-do-you-create-a-uitab-or-uitabgroup
% in 'uitabs_octave_demo.m'

% Starting an m-file with an instruction as opposed to a 'function' keyword, 
%   interprets the m-file as a script, as opposed to a function definition. 
1;

% In octave, in-line functions need to be defined 'before' their use, as opposed
%   to matlab which demands them at the 'end' of a script.

function y_callback( Handle, Event, PlotHandle, XVal )
   YData = get( PlotHandle, 'ydata' );
   YData( XVal ) = str2num( get( Handle, 'string' ) );
   set( PlotHandle, 'ydata', YData );
end

% This is the "extra" bit we provide; since octave does not currently implement the
%   'uitabgroup' and 'uitab' functions, we provide our own definitions for them here

function Handle = uitabgroup( FigHandle, PosOpt, PosVal )
   Handle = uipanel( FigHandle, PosOpt, PosVal);
   setappdata( Handle, 'tabs_buttons', {} );
   setappdata( Handle, 'tabs_contents', {} );
end

function on_tab_select( Handle, Event, TabGroupHandle, TabContents )
   Tabs_contents = getappdata( TabGroupHandle, 'tabs_contents' )
   for i=1:length(Tabs_contents); set(Tabs_contents{i}, 'visible', 'off'); end
   set( TabContents, 'visible', 'on' );
end

function TabContents = uitab( TabGroupHandle, TitleOpt, TitleVal )
   Tabs_buttons  = getappdata( TabGroupHandle, 'tabs_buttons'  );
   Tabs_contents = getappdata( TabGroupHandle, 'tabs_contents' );
   TabContents = uipanel( TabGroupHandle, 'units', 'normalized', 'position', [ 0, 0, 1, 0.95 ] );
   TabButton   = uicontrol( TabGroupHandle, 'style', 'pushbutton' ,'string', TitleVal, 'units', 'normalized', 'position', [ length(Tabs_buttons) * 0.1, 0.95, 0.1, 0.05 ], 'callback', {@on_tab_select, TabGroupHandle, TabContents } );
   Tabs_buttons{end+1}  = TabButton;
   Tabs_contents{end+1} = TabContents;
   setappdata( TabGroupHandle, 'tabs_buttons' , Tabs_buttons );
   setappdata( TabGroupHandle, 'tabs_contents', Tabs_contents );
end


clear;
clc;

f = figure( 1 );   
set( f, 'position', [50, 50, 500, 500 ] );
tabgp = uitabgroup( f, 'position', [.05, .05, .9, .9] );
tab1 = uitab( tabgp, 'title','Potencial eléctrico');

%TM_11 con f<fc
%%%%%%%%%%%%%%%%%
ax1 = axes (tab1);
subplot(2,2,1,ax1)
rho = 5
Ecampo=10.*10.^( 12)
l=8
z1=linspace(-l./2,l./2,70)
phi1=linspace(0,2.*pi,70)
[phi,z]=meshgrid(phi1,z1)
e=8.85.*10.^(-12)

[x,y,z]=pol2cart(phi,rho,z)
neophi=atan(y./x)
sigma = 0.1111./phi.*Ecampo./(-198.77).*(3.832).*rho.*cos(phi).*e.^(277.83)

surf(x,y,z,sigma)
colorbar;
title("Campo eléctrico rho cuando f<fc en t = 0 y r = 5")
xlabel("x")
ylabel("y")
zlabel("z")



ax1 = axes (tab1);
subplot(2,2,3,ax1)
rho = 5
Ecampo=10.*10.^( 12)
l=8
z1=linspace(-l./2,l./2,70)
phi1=linspace(0,2.*pi,70)
[phi,z]=meshgrid(phi1,z1)
e=8.85.*10.^(-12)

[x,y,z]=pol2cart(phi,rho,z)
neophi=atan(y./x)
sigma = 0.1111./phi.*Ecampo./(-198.77).*(3.832).*rho.*cos(phi).*e.^(277.83)

surf(x,y,z,sigma)
colorbar;
title("Campo eléctrico phi cuando f<fc en t = 0 y r = 5")
xlabel("x")
ylabel("y")
zlabel("z")

ax1 = axes (tab1);
subplot(2,2,3,ax1)
rho = 5
Ecampo=10.*10.^( 12)
l=8
z1=linspace(-l./2,l./2,70)
phi1=linspace(0,2.*pi,70)
[phi,z]=meshgrid(phi1,z1)
e=8.85.*10.^(-12)

[x,y,z]=pol2cart(phi,rho,z)
neophi=atan(y./x)
sigma = 0.1111./phi.*Ecampo.*(3.832).*rho.*cos(phi).*e.^(277.83)

surf(x,y,z,sigma)
colorbar;
title("Campo H rho cuando f<fc en t = 0 y r = 5")
xlabel("x")
ylabel("y")
zlabel("z")



ax1 = axes (tab1);
subplot(2,2,3,ax1)
rho = 5
Ecampo=10.*10.^( 12)
l=8
z1=linspace(-l./2,l./2,70)
phi1=linspace(0,2.*pi,70)
[phi,z]=meshgrid(phi1,z1)
e=8.85.*10.^(-12)

[x,y,z]=pol2cart(phi,rho,z)
neophi=atan(y./x)
sigma = 0.1111./phi.*Ecampo.*(3.832).*rho.*cos(phi).*e.^(277.83)

surf(x,y,z,sigma)
colorbar;
title("Campo Hphi cuando f<fc en t = 0 y r = 5")
xlabel("x")
ylabel("y")
zlabel("z")


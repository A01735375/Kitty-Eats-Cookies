%Generating a mesh for each of the ecuations and its limits
[x1,y1,z1] = meshgrid (-32:32, -32:32, 8:32);
V1=-(x1-7.5).^2/2^2-y1.^2/1^2+(25-z1);
[faces1,verts1] = isosurface(x1, y1, z1, V1, 0.000001);

[x2,y2,z2] = meshgrid (-32:32, -32:32, 8:32);
V2=-(x2+7.5).^2/2^2-y2.^2/1^2+(25-z2);
[faces2,verts2] = isosurface(x2, y2, z2, V2, 0.000001);

[x3,y3,z3] = meshgrid (-32:32, 8:32, -32:32);
V3=-(z3+2).^2+4^2-x3.^2-(y3-9).^2;
[faces3,verts3] = isosurface(x3, y3, z3, V3, 0.000001);

[x4,y4,z4] = meshgrid (-32:32, -32:32, -32:32);
V4=-z4.^2+225-(225/350)*x4.^2-(225/100)*y4.^2;
[faces4,verts4] = isosurface(x4, y4, z4, V4, 0.000001);

[x5,y5,z5] = meshgrid (-32:32, -32:32, -32:32);
V5=-z5.^2+7^2-(7^2/4^2)*(x5-8.5).^2-(7^2/2.5^2)*(y5-9).^2+3;
[faces5,verts5] = isosurface(x5, y5, z5, V5, 0.000001);

[x6,y6,z6] = meshgrid (-32:32, -32:32, -32:32);
V6=-z6.^2+7^2-(7^2/4^2)*(x6+8.5).^2-(7^2/2.5^2)*(y6-9).^2+3;
[faces6,verts6] = isosurface(x6, y6, z6, V6, 0.000001);

%The results are two arrays: 
%faces has a list of points that create triangles
%verts has x, y, z coords of the points in faces

%Then the faces arrays are reordered in order to be unified
%The verts arrays are also unified
faces = [faces1 ; faces2+678*ones(1304,3);faces3+(678+678)*ones(324,3);faces4+(678+678+177)*ones(7640,3);faces5+(678+678+177+3822)*ones(744,3);faces6+(678+678+177+3822+374)*ones(744,3)];
verts = [verts1 ; verts2; verts3; verts4; verts5; verts6];

%After unifing all the arrays a triangulation is generated and saved in an
%stl file
tr=triangulation(faces,verts);
stlwrite(tr,"cabeza.stl")

%The same process is done for the body of the figure
[x7,y7,z7] = meshgrid (-32:32, -32:32, -32:32);
V7=-(z7+30).^2+50-(50/30)*(x7-8).^2-(50/100)*(y7-2.15).^2;
[faces7,verts7] = isosurface(x7, y7, z7, V7, 0.000001);

[x8,y8,z8] = meshgrid (-32:32, -32:32, -32:32);
V8=-(z8+30).^2+50-(50/30)*(x8+8).^2-(50/100)*(y8-2.15).^2;
[faces8,verts8] = isosurface(x8, y8, z8, V8, 0.000001);

[x9,y9,z9] = meshgrid (-32:32, -32:32, -32:-2);
V9=-(z9+16).^2+250-(225/325)*x9.^2-(225/200)*y9.^2;
[faces9,verts9] = isosurface(x9, y9, z9, V9, 0.000001);

[x10,y10,z10] = meshgrid (-32:32, 10:32, -32:32);
V10=-(z10+16.5).^2+150-(150/250)*x10.^2-(150/225)*(y10-2.25).^2;
[faces10,verts10] = isosurface(x10, y10, z10, V10, 0.000001);

faces0 = [faces7; faces8+675*ones(1288,3); faces9+(675+675)*ones(9708,3); faces10+(675+675+4885)*ones(1864,3)];
verts0 = [verts7; verts8; verts9; verts10];

tr=triangulation(faces0,verts0);
stlwrite(tr,"cuerpo.stl")
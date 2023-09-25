function [] = Drawing_Euler_Polyline(fid, var)


n = 50;
x = zeros(n,1); 
y = x;
r = 1;
t = linspace(0,r.*pi,n);
s = 25;                                     %Scale factor

fun_x = @(x) s*cos(x.^2);
fun_y = @(x) s*sin(x.^2);

for i=1:n-1
x(i) = integral(fun_x,t(i),t(i+1));
y(i) = integral(fun_y,t(i),t(i+1));

end
x_cum = cumsum(x); 
y_cum = cumsum(y);

points_1 = [{num2str(x_cum(1)/1000)}, {num2str(y_cum(1)/1000)}, {num2str(0)}];
for a = 2:length(x)
points_1 = [points_1;[{num2str(x_cum(a)/1000)}, {num2str(y_cum(a)/1000)}, {num2str(0)}]];
end


points_2 = [{num2str(-x_cum(1)/1000)}, {num2str(-y_cum(1)/1000)}, {num2str(0)}];
for a = 2:length(x)
points_2 = [points_2;[{num2str(-x_cum(a)/1000)}, {num2str(-y_cum(a)/1000)}, {num2str(0)}]];
end

hfssPolyline(fid, "Polyline1", points_1, 'true', 'Spline',[var.Colors.Orange], 0.25);
hfssPolyline(fid, "Polyline2", points_2, 'true', 'Spline',[var.Colors.Orange], 0.25);


end


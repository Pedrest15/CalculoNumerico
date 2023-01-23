p0 = [-2; -2; -2];
d = [1; 1; 1];

func = @(t) (3*t^2 - 12*t + 11);
dfunc = @(t) (6*t - 12);

t0 = 0;
tol = 1e-6;
kmax = 1000;

t = t0;
for k=1:kmax
  dt = func(t)/dfunc(t);
  t = t - dt;
  if (abs(dt) < tol)
    break;
  end
end

rx = [-2; 3];
ry = [-2; 3];
rz = [-2; 3];

xi = (-2 + t);
yi = xi;
zi = xi;

hold on
axis equal
sphere(32);
plot3(rx, ry, rz, 'r');
scatter3(xi, yi, zi, 75, 'filled');
hold off

disp("xi =")
disp(xi)

disp("yi =")
disp(yi)

disp("zi =")
disp(zi)

disp(k)
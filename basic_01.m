function x = basic_01(a, b, d) % a*cos(x) + b*sin(x) = d
    anp = atan2(b, a);
    x1 = anp + atan2(sqrt(a*a + b*b - d*d), d);
    x2 = anp + atan2(-sqrt(a*a + b*b - d*d), d);
    x = [x1; x2];
    
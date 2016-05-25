function alpha = goldenRatio(func, E, a, b, x, d)

	while (b - a) > E
		xa = b - 0.618 * (b - a);
		xb = a + 0.618 * (b - a);
		fa = feval(func, x + xa*d);
		fb = feval(func, x + xb*d);

		if (fa < fb)
			b = xb;
		else
			a = xa;
		end
	end
	alpha = (a + b)/2;

end
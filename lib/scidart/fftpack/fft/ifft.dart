import 'package:scidart/numdart/numdart.dart';
import 'package:scidart/scidart/fftpack/fft/fft.dart';

///  Compute the one-dimensional inverse discrete Fourier Transform.
///  [X] A ArrayComplex with the input
///  return A ArrayComplex with IFFT output
///  References
///  ----------
///  .. [1] "Fast Fourier Transform". // https://rosettacode.org/wiki/Fast_Fourier_transform#C++. Retrieved 2019-07-23.
///  Examples
///  --------
///  >>> var X = ArrayComplex([
///  >>>    Complex(real: 4.0, imaginary: 0.0),
///  >>>    Complex(real: 1.0, imaginary: -2.41421356),
///  >>>    Complex(real: 0.0, imaginary: 0.0),
///  >>>    Complex(real: 1.0, imaginary: -0.41421356),
///  >>>    Complex(real: 0.0, imaginary: 0.0),
///  >>>    Complex(real: 1.0, imaginary: 0.41421356),
///  >>>    Complex(real: 0.0, imaginary: 0.0),
///  >>>    Complex(real: 1.0, imaginary: 2.41421356)
///  >>> ]);
///  >>> ifft(X);
///  >>> ArrayComplex([
///  >>>   Complex(real: 1.00000000e+00, imaginary: 0.00000000e+00),
///  >>>   Complex(real: 9.99999999e-01, imaginary: -5.55111512e-17),
///  >>>   Complex(real: 1.00000000e+00, imaginary: 0.00000000e+00),
///  >>>   Complex(real: 9.99999999e-01, imaginary: -5.55111512e-17),
///  >>>   Complex(real: 0.00000000e+00, imaginary: 0.00000000e+00),
///  >>>   Complex(real: 8.39015857e-10, imaginary: 5.55111512e-17),
///  >>>   Complex(real: 0.00000000e+00, imaginary: 0.00000000e+00),
///  >>>   Complex(real: 8.39015857e-10, imaginary: 5.55111512e-17)
///  >>> ])
ArrayComplex ifft(ArrayComplex X) {
  // conjugate the complex numbers
  var XConj = X.conjugate();

  // forward fft
  var xImag = fft(XConj);

  // conjugate the complex numbers again
  xImag = xImag.conjugate();

  // scale the numbers
  xImag = xImag.divisionToScalar(xImag.length);

  return xImag;
}
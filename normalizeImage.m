function normalized = normalizeImage(i)

  [files, cols, ~] = size(i);
  im = double(i);
  sum = im(:,:,1) + im(:,:,2) + im(:,:,3);
  r = uint8(zeros(files, cols, 3));
  r(:,:,1) = uint8(255*im(:,:,1)./sum);
  r(:,:,2) = uint8(255*im(:,:,2)./sum);
  r(:,:,3) = uint8(255*im(:,:,3)./sum);

  a = min(r(:));  % a: buscar el min. valor dels pixels en totes les columnes
  c = min(a);     % c: buscar el min. value dels pixels en la image
  b = max(r(:));  % b: buscar el max. valor dels pixels en totes les columnes
  d = max(b);     % d: buscar el min. value dels pixels en la image
  m = 255/(d - c);  % find the slope of line joining point (0,255) to (rmin,rmax)
  normalized = (r - c) * m; % transform the image according to new slope

end

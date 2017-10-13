% loads all mat files in this directory into pixel_locations struct

files = dir('./games/HoN/pixel locations/*.mat');

pixel_locations = [];
for file = files
  tmp = load(file.name);
  fn = fieldnames(tmp);
  for k = 1:numel(fn)
    pixel_locations.(fn{k}) = tmp.(fn{k}) ;
  end
end
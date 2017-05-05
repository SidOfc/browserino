Browserino.config.emails do
  match %r{outlook}i, name: :outlook
  match %r{airmail}i, name: :airmail, engine: :webkit
  match %r{barca}i,   name: :barca,   version: %r{barca(?:pro)?/([\d\.]+)}i

  match %r{ggpht}i do
    name           :gmail
    engine         %r{(trident|gecko|webkit|presto|blink|servo|edge)}i
    engine_version %r{(?:rv:|trident|webkit|presto|blink
                      |servo|edge)[\s/]?([\d\.]+)}i
  end

  # these are the same as above except with engine set to gecko and
  # to look for engine_version using gecko version pattern
  preset engine: :gecko, engine_version: %r{rv:\s?([\d\.]+)}i do
    match %r{thunderbird}i, name: :thunderbird
    match %r{spicebird}i,   name: :spicebird
    match %r{postbox}i,     name: :postbox
  end
end

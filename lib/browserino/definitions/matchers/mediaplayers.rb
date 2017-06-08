# frozen_string_literal: true

Browserino.config.mediaplayers do
  match %r{itunes}i,      name: :itunes
  match %r{dailymotion}i, name: :dailymotion
  match %r{flycast}i,     name: :flycast
  match %r{coreplayer}i,  name: :coreplayer
  match %r{banshee}i,     name: :banshee
  match %r{foobar2000}i,  name: :foobar2000
  match %r{boxee}i,       name: :boxee
  match %r{gomplayer}i,   name: :gomplayer, version: %r{yer\s([\d,\s]+)}i
end

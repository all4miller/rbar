# Bechmarking model updates in a loop vs. an update statement

Demo repo showing typical "service" class that loops over 1k "company" models
and updates stuff.

*NB# only setup to work with PostgreSQL*

Sample results on my laptop:

```
               user     system      total        real
rbar       2.777057   0.113124   2.890181 ( 24.245212)
lightning  0.000602   0.000109   0.000711 (  0.130526)
```

To run:

1. Update database.yml with valid settings
2. Run `bundle install` from a terminal in the repo root
3. Run `ruby bench.rb` from a terminal in the repo root

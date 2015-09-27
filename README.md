# Chucky - A Distributed Fault-Tolerant Chuck Norris Facts Disher

[Chuck](http://i.imgur.com/wwFsWiA.jpg)

## Step 1: Figure out your hostname

```
% hostname -s
imac
```

## Step 2: Configure `config/NODE_NAME.config`

Here's an example:

```erlang
[{kernel,
  [{distributed, 
    [{chucky,
      5000,
      ['a@imac', {'b@imac', 'c@imac'}]}]},
   {sync_nodes_mandatory, ['b@imac', 'c@imac']},
   {sync_nodes_timeout, 30000}
  ]}].
```

Open 3 different terminals, and on each of them, run these commands:

```
% iex --sname a --erl "-config config/a.config" -S mix
% iex --sname b --erl "-config config/b.config" -S mix
% iex --sname c --erl "-config config/c.config" -S mix
```


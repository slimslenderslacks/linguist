# Ruby build

| no edge cache, no local cache | 1m31s |
| edge cache enabled, no local cache | 1m21s |
| local cache enabled | 5 seconds |

Build requires 74 public packages + 8 packages that must be built locally

These derivations will not be available in a public edge cache. They can be pushed to a private edge cache or stored in a cache mount.

```
/nix/store/9jv46kkg78ca94bn9v5qwk6si0srmnq0-ruby2.7.7-cgi-0.3.6
/nix/store/c3iap98jigx368jdsp2qkrkrxpp7lvrp-ruby2.7.7-charlock_holmes-0.7.7
/nix/store/d335snmkjivdasygs7ghmghvglh6ml0c-gemfile-and-lockfile
/nix/store/f6kxm8sq188m11932gk06mwswsa8gsy9-ruby2.7.7-mini_mime-1.1.2
/nix/store/y6my3d9wgzw3321fl2w5i03rjd20sndp-ruby2.7.7-rugged-1.6.3
/nix/store/pj2ay97k8b3d4d3qr9hiab3qcn5nfzpy-ruby2.7.7-github-linguist-7.25.0
/nix/store/sy0amg50k9qvwpj3iyrpfxdiwgr1c19g-gems-for-github-linguist
/nix/store/h98axmvb5y57bb301imidmgf7i9l3l13-linguist-0.1.0
```

## Scout compatibility

The `/nix/store` layer is scannable.

## Trying it out

```
docker build -t docker/linguist:latest --progress plain .
docker run -it --rm -v $HOME:$HOME docker/linguist:latest $HOME/slimslenderslacks/linguist
```

# install nix
curl https://nixos.org/nix/install | sh
nix-env -i boot

# boot commands
boot -h

# boot update
boot -u

# make project dir
mkdir -p ~/git/boot;
cd ~/git/boot

# make build.boot in project dir
v build.boot

(set-env!
 :source-paths #{"src/clj" "src/cljs"}
 :resource-paths #{"resources"}
 :dependencies '[[org.clojure/clojure "1.8.0-RC5" :scope "provided"]
 [org.clojure/clojurescript "1.9.293"]
 [adzerk/boot-cljs "1.7.228-2" :scope "test"]
 [adzerk/boot-cljs-repl "0.3.3" :scope "test"]
 [adzerk/boot-reload    "0.4.13" :scope "test"]
 [com.cemerick/piggieback "0.2.1" :scope "test"]
 [weasel "0.7.0" :scope "test"]
 [org.clojure/tools.nrepl "0.2.12" :scope "test"]
 ]
 )
(require '[adzerk.boot-cljs      :refer :all]
 '[adzerk.boot-cljs-repl :refer :all]
 '[adzerk.boot-reload :refer :all])
(deftask dev []
 (comp
  (watch)
  (reload)
  (cljs-repl)
  (cljs :optimizations :none)
 ))

# build project using options in build.boot
boot dev



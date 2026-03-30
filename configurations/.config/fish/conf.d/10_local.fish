# Source all local (gitignored) config files
for f in $__fish_config_dir/conf.d/local/*.fish
    source $f
end

# EcellModel.vim
[E-cell Version 3](https://github.com/ecell/ecell3) Model file (\*.em) syntax and indent for Vim.

### INSTALL
Using [NeoBundle](https://github.com/Shougo/neobundle.vim) is recommended.
Add following line to your `.vimrc` and run `:NeoBundleInstall`.
```
NeoBundle 'iTakeshi/EcellModel.vim'
```

If you use `NeoBundleLazy` to install this plugin, be sure to add following lines to `~/.vim/filetype.vim`:
```
if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  autocmd!

  " EcellModel
  au BufNewFile,BufRead *.em setf EcellModel
augroup END
```

### VERSION
1.0

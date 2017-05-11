# vim.file
My vim configuration dotfiles-O-Matic

## Install

* Download and place kaoriya-gvim
* delete following files in kaoriya-gvim dir: origdoc patch plugins switches CHANGES.md gvimrc README.txt vimrc

### font

* install Tamsyn font

### in shell

* `bash ./install.sh path/to/yourHomeDir`

### in cmd

* `cd path/to/kaoriyaGVimDir`
* `mklink /D ./vim.file/ path/to/thisREADMEdir/`

### in vim

* `:NeoBundleInstall`

## Plugins

### Vdebug

#### How to connect Vdebug (Vim plugin), and Xdebug is working in VirtualBox

* Make sure it's possible to telnet to host-machine's vdebug port (e.g., 9000) from guest-machine. Or check out windows-firewall settings.
* If `xdebug.remote_connect_back` is on, you must connect to guest-machine's webserver using guest-machine IP address (e.g., 169.254.x.x) to force using preferable network interface like 169.254.0.0 rarer than accessing via port-forwarding (127.0.0.1). Because once turn on xdebug.remote_connect_back, xdebug will try to connect back to `{ ip: $_SERVER['REMOTE_ADDR'] or $_SERVER['HTTP_X_FORWARDED_FOR'], port: xdebug.remote_port }`. Don't get xdebug connect back to wrong IP.
* If `xdebug.remote_connect_back` is off, set ip where to connect back `xdebug.remote_host` (and `xdebug.remote_port`).
* The option of Vdebug `g:vdebug_options['port']` is what port will be used to listen to handshake with server when running dbgp client in vim. Let them same value `g:vdebug_options['port']` and `xdebug.remote_port`.
* Make sure all ide-key configs are okay: `xdebug.idekey`, `g:vdebug_options['ide_key']`, and your browser dbgp extension option.
* Connection flow: Browser -> (HTTP with several headers) -> PHP Server -> Xdebug -> (connect back) -> DBGP Client (Vdebug etc..)

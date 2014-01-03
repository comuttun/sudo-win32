sudo-win32
=============

This is sudo for Windows, which in origin is a [superuser thread](http://superuser.com/questions/122418/theres-no-sudo-command-in-cygwin).


## Building

    git clone https://github.com/comutt/sudo-win32.git
    cd sudo-win32
    nmake

## Usage

    sudo <command> <arguments...>

## Notice

To use in the Cygwin environment, please be careful about the following:

* Something wrong with ``sudo bash -c``.
    * I gave up to know why it's worng.
* Normally, you cannot do ``sudo hoge.sh``
    * If you associate ``*.sh`` files to bash, it may be possible, but I don't test that.
* If ``sudo bash hoge.sh`` then Windows system path is prior to Cygwin's so you cannot use commands such as find, rsync, or so.
* If ``sudo bash --login hoge.sh`` then the current directory will be normally user's home directory so files specified in arguments cannot be found by bash.
    * To avoid that do ``sudo bash --login $(readlink -m hoge.sh)``.
* It's different from Unix sudo. 
    * A propmpt will be newely opened.
    * If scripts executed, a prompt will be closed immediately after execution finished.
        * To avoid that improve the script to pause with a command such as ``read -p``.
    * Command run with ``sudo`` will output to the new prompt, so for example, ``sudo rsync -av src/ dest/`` will not perform as expected.

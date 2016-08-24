# CSP models

I sometimes write [blog posts][dcreager.net] about [CSP][], and use the [FDR][]
refinement checker to automatically check the specifications I put together.
This repository contains the machine-readable CSP<sub>M</sub> files for those
specifications, and some helper scripts for easily invoking FDR.

[dcreager.net]: http://dcreager.net/
[CSP]: https://en.wikipedia.org/wiki/Communicating_sequential_processes
[FDR]: http://www.cs.ox.ac.uk/projects/fdr/manual/index.html

## FDR via docker

The University of Oxford provides `apt` and `yum` packages that let you install
FDR on Debian- and RPM-derived Linux distributions.  I've packaged that up in a
Docker image to make it even easier.  If you already have docker running on your
machine, you can just use

    $ docker run [options] dcreager/fdr

to get a working copy of FDR.

There is also a `refines` script in this repository, which makes it easier to
run the Docker version of FDR's [command-line interface][cli].  It takes care of
exposing all of the right directories on your machine inside of the container.
If I've written everything right, you should be able to run

    $ ./refines [arguments]

and have it "just work"; all of the `[arguments]` are whatever you would expect
to pass in to FDR's actual `refines` command, just as if it were installed on
your machine, instead of hidden away inside of a Docker container.

[cli]: http://www.cs.ox.ac.uk/projects/fdr/manual/command_line.html

### Licensing

FDR is not open-source, and you will have to get a license to be able to use it.
This process is mostly automated; the first time you run the `refines` script,
FDR will prompt you for which kind of license you want to obtain.  (FDR is free
to use in many situations; the licensing prompts go into all of the details.)

The `refines` wrapper script makes sure to store your license file outside of
the docker container, so that you can re-use it however many times you spin up a
container to run FDR.  You can find the license file in `$HOME/.config/fdr`.

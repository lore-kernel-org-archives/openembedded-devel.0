Received: from aa013msr.fastwebnet.it ([85.18.95.73])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pisa.t@teledata-i.com>) id 1NBQQJ-0007Nd-HH
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 11:09:06 +0100
Received: from [193.100.100.18] (27.253.111.36) by aa013msr.fastwebnet.it
	(8.5.016.6)
	id 4B033DEA00540BCC for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 11:07:38 +0100
From: Paolo Cremonese <pisa.t@teledata-i.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.0911190218370.28651@localhost>
References: <1258613177.16656.3.camel@ubuntu2>
	<alpine.LFD.2.00.0911190218370.28651@localhost>
Date: Fri, 20 Nov 2009 11:07:56 +0100
Message-Id: <1258711676.19444.3.camel@ubuntu2>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 85.18.95.73
X-SA-Exim-Mail-From: pisa.t@teledata-i.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Building problems
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Nov 2009 10:09:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,
I have updated the bitbake to 1.8.18, and now the problem is different:

Thanks in advance,
Paolo

ERROR: function do_compile failed
ERROR: log data follows
(/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/temp/log.do_compile.23255)
| NOTE: make
| Making all in doc
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/doc'
| make  all-am
| make[2]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/doc'
| make[2]: Nothing to be done for `all-am'.
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/doc'
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/doc'
| Making all in include
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/include'
| make  all-am
| make[2]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/include'
| make[2]: Nothing to be done for `all-am'.
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/include'
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/include'
| Making all in dix
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/dix'
| make  all-am
| make[2]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/dix'
| make[2]: Nothing to be done for `all-am'.
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/dix'
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/dix'
| Making all in fb
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/fb'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/fb'
| Making all in mi
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/mi'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/mi'
| Making all in Xext
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/Xext'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/Xext'
| Making all in miext
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/miext'
| Making all in damage
| make[2]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/miext/damage'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/miext/damage'
| Making all in shadow
| make[2]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/miext/shadow'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/miext/shadow'
| Making all in cw
| make[2]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/miext/cw'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/miext/cw'
| make[2]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/miext'
| make[2]: Nothing to be done for `all-am'.
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/miext'
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/miext'
| Making all in os
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/os'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/os'
| Making all in randr
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/randr'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/randr'
| Making all in render
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/render'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/render'
| Making all in Xi
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/Xi'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/Xi'
| Making all in dbe
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/dbe'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/dbe'
| Making all in record
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/record'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/record'
| Making all in xfixes
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/xfixes'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/xfixes'
| Making all in damageext
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/damageext'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/damageext'
| Making all in composite
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/composite'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/composite'
| Making all in exa
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/exa'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/exa'
| Making all in config
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/config'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/config'
| Making all in hw
| make[1]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw'
| Making all in kdrive
| make[2]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive'
| Making all in src
| make[3]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive/src'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive/src'
| Making all in linux
| make[3]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive/linux'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive/linux'
| Making all in fbdev
| make[3]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive/fbdev'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive/fbdev'
| Making all in epson
| make[3]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive/epson'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive/epson'
| Making all in vesa
| make[3]: Entering directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive/vesa'
| ccache i586-angstrom-linux-gcc -march=pentium -DHAVE_CONFIG_H -I.
-I../../../include -I../../../hw/kdrive/src -I../../../miext/damage
-I../../../miext/shadow -I../../../Xext -I../../../fb -I../../../mi
-I../../../hw/kdrive/linux -Wall -Wpointer-arith -Wstrict-prototypes
-Wmissing-prototypes -Wmissing-declarations -Wnested-externs
-fno-strict-aliasing -D_BSD_SOURCE -DHAS_FCHOWN -DHAS_STICKY_DIR_BIT
-DDBUS_API_SUBJECT_TO_CHANGE
-I/home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/include/freetype2 -I/home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/include/pixman-1 -I/home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/include/hal -I/home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/include/dbus-1.0 -I/home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/lib/dbus-1.0/include   -I../../../include -I../../../include -I../../../Xext -I../../../composite -I../../../damageext -I../../../xfixes -I../../../Xi -I../../../mi -I../../../miext/shadow  -I../../../miext/damage -I../../../render -I../../../randr -I../../../fb -DHAVE_KDRIVE_CONFIG_H    -isystem/home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/include  -isystem/home/paolo/oe/stuff/build/tmp/staging/i586-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -Os -ggdb3 -MT vm86.o -MD -MP -MF .deps/vm86.Tpo -c -o vm86.o vm86.c
| vm86.c: In function 'Vm86DoInterrupt':
| vm86.c:213: warning: too few arguments for format
| vm86.c:225: error: 'IF_MASK' undeclared (first use in this function)
| vm86.c:225: error: (Each undeclared identifier is reported only once
| vm86.c:225: error: for each function it appears in.)
| vm86.c:225: error: 'IOPL_MASK' undeclared (first use in this function)
| vm86.c: In function 'Vm86Debug':
| vm86.c:746: warning: format '%04lX' expects type 'long unsigned int',
but argument 2 has type 'int'
| vm86.c:746: warning: format '%04lX' expects type 'long unsigned int',
but argument 3 has type 'int'
| vm86.c:746: warning: format '%04lX' expects type 'long unsigned int',
but argument 4 has type 'int'
| vm86.c:746: warning: format '%04lX' expects type 'long unsigned int',
but argument 5 has type 'int'
| vm86.c:746: warning: format '%04lX' expects type 'long unsigned int',
but argument 6 has type 'int'
| make[3]: *** [vm86.o] Error 1
| make[3]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive/vesa'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw/kdrive'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/xorg-server-1.4.0.90/hw'
| make: *** [all-recursive] Error 1
| FATAL: oe_runmake failed
NOTE: Task
failed: /home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/xserver-kdrive-1_1.4.0.90-r7/temp/log.do_compile.23255
ERROR: TaskFailed event exception, aborting
ERROR: Build
of /home/paolo/oe/stuff/openembedded/recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb do_compile failed
ERROR: Task 169
(/home/paolo/oe/stuff/openembedded/recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 1854 tasks of which 1849 didn't need to
be rerun and 1 failed.
ERROR:
'/home/paolo/oe/stuff/openembedded/recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb' failed
paolo@ubuntu2:~/oe/stuff/build$





On gio, 2009-11-19 at 02:19 -0500, Robert P. J. Day wrote:
> On Thu, 19 Nov 2009, Paolo Cremonese wrote:
> 
> > Hi ALL,
> > I get suddenly a building problem.
> > this is the output:
> >
> >
> > paolo@ubuntu2:~/oe/stuff/build$ bitbake x11-image
> > Traceback (most recent call last):
> >   File "/home/paolo/oe/stuff/bitbake/bin/bitbake", line 143, in <module>
> >     main()
> >   File "/home/paolo/oe/stuff/bitbake/bin/bitbake", line 123, in main
> >     cooker.parseConfiguration()
> >   File "/home/paolo/oe/stuff/bitbake/lib/bb/cooker.py", line 69, in
> > parseConfiguration
> >     self.parseConfigurationFile( os.path.join( "conf",
> > "bitbake.conf" ) )
> >   File "/home/paolo/oe/stuff/bitbake/lib/bb/cooker.py", line 405, in
> > parseConfigurationFile
> >     bb.event.fire(bb.event.ConfigParsed(self.configuration.data))
> >   File "/home/paolo/oe/stuff/bitbake/lib/bb/event.py", line 67, in fire
> >     if tmpHandler(event) == Handled:
> >   File "tmpHandler(e)", line 4, in tmpHandler
> >   File "<bb>", line 18, in check_sanity
> > NameError: global name 'os' is not defined
> > paolo@ubuntu2:~/oe/stuff/build$
> >
> >
> > Any suggestion?
> 
>   what branch are you using?  there was a short period where that
> error was produced because of a removal of "import os", but it was
> replaced shortly thereafter.  make sure your checkout is up to date.
> 
> rday
> --
> 
> 
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
> 
>             Linux Consulting, Training and Kernel Pedantry.
> 
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




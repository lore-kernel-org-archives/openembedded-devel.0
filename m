Received: from [220.181.12.14] (helo=m12-14.163.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <lida_mail@163.com>) id 1M0lU0-0004Oy-6o
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 May 2009 01:52:32 +0200
Received: from [192.168.58.103] (unknown [116.227.146.13])
	by smtp10 (Coremail) with SMTP id DsCowLArWy3oLP5J+fZ9FA--.58086S2;
	Mon, 04 May 2009 07:46:49 +0800 (CST)
From: "Daniel.Li" <lida_mail@163.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090503231743.GC7973@smtp.west.cox.net>
References: <1241357669.13222.0.camel@daniel-laptop>
	<20090503165548.GB7973@smtp.west.cox.net>
	<1241391783.13222.4.camel@daniel-laptop>
	<20090503231743.GC7973@smtp.west.cox.net>
Organization: PALFocus (http://palfocus.oicp.net)
Date: Mon, 04 May 2009 07:46:41 +0800
Message-Id: <1241394401.12036.11.camel@daniel-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-CM-TRANSID: DsCowLArWy3oLP5J+fZ9FA--.58086S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFy3Cr4rZrWkZw17tFWkWFg_yoWrGw4UpF
	Z8tFy8tayv9FW3Aa4kCr18Zr1Fgry8Gry7W3s5Kw4xtF90qrW7XwsrKr13Kr13uws7Gr40
	9F93Xayj934rWaDanT9S1TB71UUUUUUv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UU
	UOz7k042IEc7kJM7k042IE42xK82IY6r43WwAYjxAI6xAIw28IcVAK0I8IjxAxM7k042IE
	4IxYO2xFxVAqjxCEw4Av424lb7Iv0xC_Jr1lb4IE77IF4wAFF20E14v26r1j6r4UM7C26x
	Cjj4IEI4klw4CSwwAFxVCaYxvI4VCIwcAKzIAtM7CIcVAFz4kK6r1j6r18M28EF7xvwVC0
	I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4
	vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAawVAYYI1S
	6c8GOVWUur45Jryln4vEF7Iv6F18KVAqrcv_GVWUtr1rJF1ln4vEF7Iv6F18KVAqrcv_XV
	WUtr1rJF1ln4vEF2I2jVAIwVAKzxkI7VAqrcv_JFW8Xr15M2vj6xkI62vS6c8GOVWUtr1r
	JFyl57IF6s8CjcxG0xyl52xGzVA2a4k0FcxF6xCjrcI26cIUMc02F40EFcxC0VAKzVAqx4
	xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lF7xvr2IY
	c2Ij64vIr41lFVAaXTZC67ZELSn0mTvEwaV2v3VFvVW8Mx02cVAKzwCY1Ik26cxK6x8Yrw
	CY02Avz4vE14v_uwCY0x0Ix7I2Y4AK6r1j6r15MxAIw28IcxkI7VAKI48JMxCjnVAqn7xv
	rwC2zVAF1VAY17CE14v26r1j6r15MIIYrxkI7VAKI48JMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUYAsqJUU
	UUU==
X-CM-SenderInfo: 5olgtshpdlzqqrwthudrp/
Subject: Re: qemu-native build fail
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
X-List-Received-Date: Sun, 03 May 2009 23:52:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-05-03 at 16:17 -0700, Tom Rini wrote:
> On Mon, May 04, 2009 at 07:03:03AM +0800, Daniel.Li wrote:
> > On Sun, 2009-05-03 at 09:55 -0700, Tom Rini wrote:
> > > On Sun, May 03, 2009 at 09:34:29PM +0800, Daniel.Li wrote:
> > > > Dear List,
> > > > 
> > > > I have found that qemu-native failed with gcc 3.4, see below.
> > > > Originally, qemu failed with 4.* gcc, now qemu is ok with gcc3.4 but
> > > > qemu-native failed. 
> > > > 
> > > > I googled, only found this http://pastebin.com/f75407ece# , which seems
> > > > failed on 20 Apr.
> > > 
> > > This sounds like a host-provided gcc-3.4, which isn't new enough, is
> > > being used, rather than the 3.4.6 that OE builds.  I thought this had
> > > been fixed, but perhaps not.  Can you confirm that you have a gcc-3.4
> > > package installed on your host?  Thanks.
> > 
> > Thanks Tom.
> > Yes,you are right. OE is using gcc-3.4 (host) instead of gcc-3.4 build
> > by OE.
> > Cause, I removed gcc3.4 from host, it reports command gcc3.4 not found.
> > 
> > Well, I'm new to OE. Could you please let me know how to build
> > qemu-native with it's internal gcc3.4? 
> > 
> > Any configuration change? Thanks in advance.
> 
> Do you have "ASSUME_PROVIDED += gcc3-native" or similar in your
> local.conf?  If so, remove that.

It seems there is no line at all.

$ cat conf/local.conf 
# require conf/distro/include/moko-autorev.inc
# require conf/distro/include/fso-autorev.inc

But I found gcc3-native in bb file, see below:
$ grep "gcc3-native" openembedded/recipes/qemu/ -R
openembedded/recipes/qemu/qemu-native.inc:DEPENDS = "libsdl-native
zlib-native gcc3-native"

So I remove gcc3-native in this file. and bitbake again.

Still failed with 
NOTE: make
make -C i386-softmmu all
make[1]: Entering directory
`/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/i386-softmmu'
gcc-3.4 -Wall -O2 -g -fno-strict-aliasing
-mpreferred-stack-boundary=2 -fomit-frame-pointer  -m32 -I. -I..
-I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/target-i386 -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk -MMD -MP -DNEED_CPU_H -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/tcg -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/tcg/i386 -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/fpu -DHAS_AUDIO -DHAS_AUDIO_CHOICE -I/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/slirp -c -o op.o /home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/target-i386/op.c
make[1]: gcc-3.4: Command not found
make[1]: *** [op.o] Error 127
make[1]: Leaving directory
`/home/daniel/work4/fso/fso-testing/tmp/work/i686-linux/qemu-native-0.9.1+svnr4242-r15/trunk/i386-softmmu'
make: *** [subdir-i386-softmmu] Error 2
FATAL: oe_runmake failed

And I have found gcc 3.4.6 in staging dir.
daniel@daniel-laptop:~/work4/fso/fso-testing/tmp/staging/i686-linux/usr/bin$ ./gcc-3.4.6 --version
gcc-3.4.6 (GCC) 3.4.6
Copyright (C) 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is
NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.

It seems that there is something wrong with Makefile."gcc-3.4 -Wall -O2
-g -fno-strict-aliasing"

Dose it means that bb file should be changed?
> 
-- 
Daniel.Li <lida_mail@163.com>
PALFocus (http://palfocus.oicp.net)





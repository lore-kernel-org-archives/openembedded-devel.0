Received: from [220.181.12.14] (helo=m12-14.163.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <lida_mail@163.com>) id 1M0yZe-00024f-R3
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 May 2009 15:51:15 +0200
Received: from [192.168.58.100] (unknown [116.227.146.13])
	by smtp10 (Coremail) with SMTP id DsCowLAb3P528f5Jgc6hFQ--.2874S2;
	Mon, 04 May 2009 21:45:28 +0800 (CST)
From: "Daniel.Li" <lida_mail@163.com>
To: openembedded-issues <openembedded-devel@lists.openembedded.org>
Organization: PALFocus (http://palfocus.oicp.net)
Date: Mon, 04 May 2009 21:45:17 +0800
Message-Id: <1241444718.4551.18.camel@daniel-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-CM-TRANSID: DsCowLAb3P528f5Jgc6hFQ--.2874S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFykCFyrAw1fXF45Xr48Xrb_yoWxJFWrpF
	1qqws7Wr4v9ryFvr95GwsFqa4xW3yfJw48Cwn7Gw4rJrW3A3yxWrWqkF109ayxGws8AFsY
	vrnxJr1Ygr4ruwUanT9S1TB71UUUUUUv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UU
	UYr7k042IEc7kJM7k042IE42xK82IY6r43WwAYjxAI6xAIw28IcVAK0I8IjxAxM7k042IE
	4IxYO2xFxVAqjxCEw4Av424lb7Iv0xC_Jr1lb4IE77IF4wAFF20E14v26r1j6r4UM7C26x
	Cjj4IEI4klw4CSwwAFxVCaYxvI4VCIwcAKzIAtM7CIcVAFz4kK6r1j6r18M28EF7xvwVC0
	I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4
	vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAawVAYYI1S
	6c8GOVWUur45Jryln4vEF2I2jVAIwVAKzxkI7VAqrcv_JFW8Xr15Mc804VCqF7xvr2I5Mc
	8Ir4CE8sxKj4xv1VCF748vxVAv7wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8I
	cVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UM4x0Y48IcxkI7VAKI48JM4IEnf9ElV
	AFpTB2q-sK649IAas0WaI_GwCjxxvEw4Wlc7Ca8VAvwVCjb41lc2xSY4AK67AK6ry8MxkI
	7II2jI8vz4v_Jr0_Jryl42xK82IYc2Ij64vIr41l4x8a6c8ajcxJMI8E67AF67kF1VAFwI
	0_Jr0_JrylIxkGc2Ij64vIr41lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU9fHUUUUUU
X-CM-SenderInfo: 5olgtshpdlzqqrwthudrp/
Subject: libxt_1.0.5.bb, do_compile failed
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
X-List-Received-Date: Mon, 04 May 2009 13:51:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Dear List,

With qemu fixed, I have met libxt_1.0.5 failed. Oh,,,, so many fail
during OE build. 

Any help is really appreciated. Thanks.


> NOTE: Running task 1191 of 6586 (ID:
> 4141, /home/daniel/work4/fso/fso-testing/openembedded/recipes/xorg-lib/libxt_1.0.5.bb, do_compile)
> NOTE: package libxt-1_1.0.5-r2: task do_compile: started
> ERROR: function do_compile failed
> ERROR: see log
> in /home/daniel/work4/fso/fso-testing/tmp/work/armv4t-angstrom-linux-gnueabi/libxt-1_1.0.5-r2/temp/log.do_compile.15659
> NOTE: Task
> failed: /home/daniel/work4/fso/fso-testing/tmp/work/armv4t-angstrom-linux-gnueabi/libxt-1_1.0.5-r2/temp/log.do_compile.15659
> NOTE: package libxt-1_1.0.5-r2: task do_compile: failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build
> of /home/daniel/work4/fso/fso-testing/openembedded/recipes/xorg-lib/libxt_1.0.5.bb do_compile failed
> ERROR: Task 4141
> (/home/daniel/work4/fso/fso-testing/openembedded/recipes/xorg-lib/libxt_1.0.5.bb, do_compile) failed
> NOTE: Tasks Summary: Attempted 1190 tasks of which 643 didn't need to
> be rerun and 1 failed.
> ERROR:
> '/home/daniel/work4/fso/fso-testing/openembedded/recipes/xorg-lib/libxt_1.0.5.bb' failed
> NOTE: build 200905041851: completed
> make[1]: *** [image] Error 1
> make[1]: Leaving directory `/home/daniel/work4/fso/fso-testing'
> make: *** [fso-gta02-testing-image] Error 2

Details see log file below.


> /bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC
> --mode=compile ccache arm-angstrom-linux-gnueabi-gcc -march=armv4t
> -mtune=arm920t -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -I. -I..
> -I../include/ -I../include/X11 -I../include -I../include/X11
> -isystem/home/daniel/work4/fso/fso-testing/tmp/staging/armv4t-angstrom-linux-gnueabi/usr/include   -DXFILESEARCHPATHDEFAULT=\"/etc/X11/%L/%T/%N%C%S:/etc/X11/%l/%T/%N%C%S:/etc/X11/%T/%N%C%S:/etc/X11/%L/%T/%N%S:/etc/X11/%l/%T/%N%S:/etc/X11/%T/%N%S:/usr/share/X11/%L/%T/%N%C%S:/usr/share/X11/%l/%T/%N%C%S:/usr/share/X11/%T/%N%C%S:/usr/share/X11/%L/%T/%N%S:/usr/share/X11/%l/%T/%N%S:/usr/share/X11/%T/%N%S:/usr/lib/X11/%L/%T/%N%C%S:/usr/lib/X11/%l/%T/%N%C%S:/usr/lib/X11/%T/%N%C%S:/usr/lib/X11/%L/%T/%N%S:/usr/lib/X11/%l/%T/%N%S:/usr/lib/X11/%T/%N%S\" -DERRORDB=\"/usr/lib/X11/XtErrorDB\" -DMALLOC_0_RETURNS_NULL -DXTMALLOC_BC -isystem/home/daniel/work4/fso/fso-testing/tmp/staging/armv4t-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -MT Convert.lo -MD -MP -MF .deps/Convert.Tpo -c -o Convert.lo Convert.c
> arm-angstrom-linux-gnueabi-libtool: compile:  ccache
> arm-angstrom-linux-gnueabi-gcc -march=armv4t -mtune=arm920t
> -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -I. -I.. -I../include/
> -I../include/X11 -I../include -I../include/X11
> -isystem/home/daniel/work4/fso/fso-testing/tmp/staging/armv4t-angstrom-linux-gnueabi/usr/include -DXFILESEARCHPATHDEFAULT=\"/etc/X11/%L/%T/%N%C%S:/etc/X11/%l/%T/%N%C%S:/etc/X11/%T/%N%C%S:/etc/X11/%L/%T/%N%S:/etc/X11/%l/%T/%N%S:/etc/X11/%T/%N%S:/usr/share/X11/%L/%T/%N%C%S:/usr/share/X11/%l/%T/%N%C%S:/usr/share/X11/%T/%N%C%S:/usr/share/X11/%L/%T/%N%S:/usr/share/X11/%l/%T/%N%S:/usr/share/X11/%T/%N%S:/usr/lib/X11/%L/%T/%N%C%S:/usr/lib/X11/%l/%T/%N%C%S:/usr/lib/X11/%T/%N%C%S:/usr/lib/X11/%L/%T/%N%S:/usr/lib/X11/%l/%T/%N%S:/usr/lib/X11/%T/%N%S\" -DERRORDB=\"/usr/lib/X11/XtErrorDB\" -DMALLOC_0_RETURNS_NULL -DXTMALLOC_BC -isystem/home/daniel/work4/fso/fso-testing/tmp/staging/armv4t-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -MT Convert.lo -MD -MP -MF .deps/Convert.Tpo -c Convert.c  -fPIC -DPIC -o .libs/Convert.o
> arm-angstrom-linux-gnueabi-libtool: compile:  ccache
> arm-angstrom-linux-gnueabi-gcc -march=armv4t -mtune=arm920t
> -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -I. -I.. -I../include/
> -I../include/X11 -I../include -I../include/X11
> -isystem/home/daniel/work4/fso/fso-testing/tmp/staging/armv4t-angstrom-linux-gnueabi/usr/include -DXFILESEARCHPATHDEFAULT=\"/etc/X11/%L/%T/%N%C%S:/etc/X11/%l/%T/%N%C%S:/etc/X11/%T/%N%C%S:/etc/X11/%L/%T/%N%S:/etc/X11/%l/%T/%N%S:/etc/X11/%T/%N%S:/usr/share/X11/%L/%T/%N%C%S:/usr/share/X11/%l/%T/%N%C%S:/usr/share/X11/%T/%N%C%S:/usr/share/X11/%L/%T/%N%S:/usr/share/X11/%l/%T/%N%S:/usr/share/X11/%T/%N%S:/usr/lib/X11/%L/%T/%N%C%S:/usr/lib/X11/%l/%T/%N%C%S:/usr/lib/X11/%T/%N%C%S:/usr/lib/X11/%L/%T/%N%S:/usr/lib/X11/%l/%T/%N%S:/usr/lib/X11/%T/%N%S\" -DERRORDB=\"/usr/lib/X11/XtErrorDB\" -DMALLOC_0_RETURNS_NULL -DXTMALLOC_BC -isystem/home/daniel/work4/fso/fso-testing/tmp/staging/armv4t-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -MT Convert.lo -MD -MP -MF .deps/Convert.Tpo -c Convert.c -o Convert.o >/dev/null 2>&1
> make[3]: *** [Convert.lo] Error 1
> make[3]: Leaving directory
> `/home/daniel/work4/fso/fso-testing/tmp/work/armv4t-angstrom-linux-gnueabi/libxt-1_1.0.5-r2/libXt-1.0.5/src'
> make[2]: *** [all] Error 2
> make[2]: Leaving directory
> `/home/daniel/work4/fso/fso-testing/tmp/work/armv4t-angstrom-linux-gnueabi/libxt-1_1.0.5-r2/libXt-1.0.5/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory
> `/home/daniel/work4/fso/fso-testing/tmp/work/armv4t-angstrom-linux-gnueabi/libxt-1_1.0.5-r2/libXt-1.0.5'
> make: *** [all] Error 2
> FATAL: oe_runmake failed


-- 
Daniel.Li <lida_mail@163.com>
PALFocus (http://palfocus.oicp.net)





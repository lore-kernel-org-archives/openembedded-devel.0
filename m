Return-Path: <idealsim@laposte.net>
Received: from smtp.laposte.net (smtpoutz25.laposte.net [194.117.213.100])
	by mail.openembedded.org (Postfix) with ESMTP id BD293605FE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 08:18:15 +0000 (UTC)
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout013 (Postfix) with ESMTP id 79919104C4C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:18:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=mail0;
	t=1503130696; bh=fVJKceC8QMQuictYWuKEI4wTvbGJXreolIZmXrqBl4w=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=G9ls3nlDuDeFlQP7bTQiMTbrVqdNZhbTWvBRj50CoFp3a+MWMKmftuwHthel2OkEN
	mUiY5iXHchM92cbnMlofNUjELPrzVlV11B37aKplYwsayg6Gni+G30MoHFhg+wB860
	kvf9GNDDY6C4SFZv2/iwB22lgHf7fRsagY9QjrQRLcYl6+6ndy3kb3XUEJkGEBxhpp
	Y0jpGQKmMf1VcKVwC5REWCaYUm7Fq+8IgqFS7Lc/zsda9sHWsbSpuK2smysmwkD7rf
	gpJG8NwCSOsK9FdNpwub3M8VTeOSeLQtsXKP4Z0VnKgbPqXisIvBQQfJ8beEm5kfZ+
	5jQMWrwQyWj/w==
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout013 (Postfix) with ESMTP id 591391046CE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:18:16 +0200 (CEST)
Received: from lpn-prd-vrin004 (lpn-prd-vrin004.laposte [10.128.63.5])
	by lpn-prd-vrout013 (Postfix) with ESMTP id 57B1D104C5E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:18:16 +0200 (CEST)
Received: from lpn-prd-vrin004 (localhost [127.0.0.1])
	by lpn-prd-vrin004 (Postfix) with ESMTP id 462FB714052
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:18:16 +0200 (CEST)
Received: from [192.168.1.19] (ARennes-654-1-118-187.w2-13.abo.wanadoo.fr
	[2.13.101.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lpn-prd-vrin004 (Postfix) with ESMTPSA id 865C7713F83;
	Sat, 19 Aug 2017 10:18:15 +0200 (CEST)
To: "Slater, Joseph" <joe.slater@windriver.com>,
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <c2b6cee4-59c7-c8f3-ebcb-5946172af1cc@laposte.net>
	<40e2291e-7b4a-17a2-853a-9b7c257f2a6a@windriver.com>
	<007BD92917A2324FA403BCF9A464CF84CF3E5925@ALA-MBD.corp.ad.wrs.com>
From: idealsim <idealsim@laposte.net>
Message-ID: <7992d32b-93b6-8a8d-836f-587d6bb53ecb@laposte.net>
Date: Sat, 19 Aug 2017 10:18:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF3E5925@ALA-MBD.corp.ad.wrs.com>
X-VR-SrcIP: 2.13.101.187
X-VR-FullState: 0
X-VR-Score: -100
X-VR-Cause-1: gggruggvucftvghtrhhoucdtuddrfeelkedruddthedgtdefucetufdoteggodetrfdotffvucfrrhho
X-VR-Cause-2: fhhilhgvmecunfetrffquffvgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhht
X-VR-Cause-3: shculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtsegrtderredtfeehnecuhfhrohhmpehi
X-VR-Cause-4: uggvrghlshhimhcuoehiuggvrghlshhimheslhgrphhoshhtvgdrnhgvtheqnecuffhomhgrihhnpeho
X-VR-Cause-5: phgvnhgvmhgsvgguuggvugdrohhrghenucfkphepvddrudefrddutddurddukeejnecurfgrrhgrmhep
X-VR-Cause-6: mhhouggvpehsmhhtphhouhhtpdhhvghloheplgduledvrdduieekrddurddulegnpdhinhgvthepvddr
X-VR-Cause-7: udefrddutddurddukeejpdhmrghilhhfrhhomhepihguvggrlhhsihhmsehlrghpohhsthgvrdhnvght
X-VR-Cause-8: pdhrtghpthhtohepjhhovgdrshhlrghtvghrseifihhnughrihhvvghrrdgtohhm
X-VR-AvState: No
X-VR-State: 0
X-VR-State: 0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [php5.6.26]error during build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Aug 2017 08:18:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for this. For information i tested to build php5 because i have 
an issue when i try to build php7 in pyro !*
*

But,  Khem Ra give me the solution (for php 5 and 7) :

http://git.openembedded.org/meta-openembedded/commit/?id=6cd249225ecdd0a4592afe1844541378acae6cea


Regards,

Le 18/08/2017 à 21:26, Slater, Joseph a écrit :
> There is a patch on master, 6cd2492, that you can cherry-pick.  It addresses more than just this issue, though.
>
> Joe
>
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel-bounces@lists.openembedded.org] on behalf of Randy MacLeod [randy.macleod@windriver.com]
> Sent: Friday, August 18, 2017 11:15 AM
> To: idealsim; openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [php5.6.26]error during build
>
> On 2017-08-17 06:32 AM, idealsim wrote:
>> Hi try to build an image with php5.6.26 in pyro branch. I have this
>> error during the build :
>>
>> /| ERROR: oe_runmake failed//
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o):
>> In function `ssl_onceonlyinit'://
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302:
>> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld:
>> TSRM/.libs/TSRM.o: undefined reference to symbol
>> 'pthread_getspecific@@GLIBC_2.4'//
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0:
>> error adding symbols: DSO missing from command line//
>> //| collect2: error: ld returned 1 exit status//
>> //| Makefile:270: recipe for target 'sapi/cli/php' failed//
>> //| make: *** [sapi/cli/php] Error 1//
>> //| make: *** Waiting for unfinished jobs....//
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o):
>> In function `ssl_onceonlyinit'://
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302:
>> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld:
>> TSRM/.libs/TSRM.o: undefined reference to symbol
>> 'pthread_getspecific@@GLIBC_2.4'//
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0:
>> error adding symbols: DSO missing from command line//
>> //| collect2: error: ld returned 1 exit status//
>> //| Makefile:306: recipe for target 'sapi/cgi/php-cgi' failed//
>> //| make: *** [sapi/cgi/php-cgi] Error 1//
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o):
>> In function `ssl_onceonlyinit'://
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302:
>> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld:
>> TSRM/.libs/TSRM.o: undefined reference to symbol
>> 'pthread_getspecific@@GLIBC_2.4'//
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0:
>> error adding symbols: DSO missing from command line//
>> //| collect2: error: ld returned 1 exit status//
>> //| Makefile:283: recipe for target 'sapi/fpm/php-fpm' failed//
>> //| make: *** [sapi/fpm/php-fpm] Error 1//
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o):
>> In function `ssl_onceonlyinit'://
>> //|
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302:
>> warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
>> //| WARNING: exit code 1 from a shell command.//
>> //| ERROR: Function failed: do_compile (log file is located at
>> /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/temp/log.do_compile.15528)//
>>
>> //ERROR: Task
>> (/media/modjo/data1TO/yocto/pyro/sources/meta-openembedded/meta-oe/recipes-devtools/php/php_5.6.26.bb:do_compile)
>> failed with exit code '1'//
>> //NOTE: Tasks Summary: Attempted 6275 tasks of which 6269 didn't need to
>> be rerun and 1 failed.//
>> //
>> //Summary: 1 task failed://
>> ///media/modjo/data1TO/yocto/pyro/sources/meta-openembedded/meta-oe/recipes-devtools/php/php_5.6.26.bb:do_compile//
>>
>> //Summary: There was 1 WARNING message shown.//
>> //Summary: There were 2 ERROR messages shown, returning a non-zero exit
>> code./
>>
>> Do you have an idea to resolve this ?
> Hmm, the recipe might just be missing a -lpthread?
>
> For example, see this fix for oe-core's apr recipe:
>
> $ git log -1 --stat ef9dfc361e5e97157d05dfeaf67a3e872648d372
> commit ef9dfc361e5e97157d05dfeaf67a3e872648d372
> Author: Andreas Müller <schnitzeltony@googlemail.com>
> Date:   Sat Mar 4 11:24:09 2017 +0100
>
>       apr: fix rss+perf+gold failure on do_compile_ptest_base
>
>       Was detected in Martin's world build
>
>       Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>       Signed-off-by: Ross Burton <ross.burton@intel.com>
>
>
> meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
> | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
>    meta/recipes-support/apr/apr_1.5.2.bb
>                         |  1 +
>    2 files changed, 51 insertions(+)
>
>
> but the bigger question is why bother with php5 rather than
> php7? Clearly few, if any, meta-oe users are using php5 and
> some people have suggested just removing it.
>
> Good luck,
> ../Randy
>
>
>> Mickael
>>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,
> Canada, K2K 2W5
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



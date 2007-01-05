Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <debasreeat@gmail.com>) id 1H2kEk-0007Bn-M3
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jan 2007 09:15:38 +0100
Received: by wx-out-0506.google.com with SMTP id t14so6918379wxc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jan 2007 00:14:18 -0800 (PST)
Received: by 10.90.52.2 with SMTP id z2mr704436agz.1167984858780;
	Fri, 05 Jan 2007 00:14:18 -0800 (PST)
Received: by 10.90.95.17 with HTTP; Fri, 5 Jan 2007 00:14:18 -0800 (PST)
Message-ID: <193b6ba30701050014t25df7b5cw16cd8b1eb40995ef@mail.gmail.com>
Date: Fri, 5 Jan 2007 17:14:18 +0900
From: "Debasree Mallick" <debasreeat@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <432beae0701050004n59458e75s53436646452806c0@mail.gmail.com>
MIME-Version: 1.0
References: <193b6ba30701050001t75ae1356s3bfb93e4834e1ba7@mail.gmail.com>
	<432beae0701050004n59458e75s53436646452806c0@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Please help me
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jan 2007 08:15:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
Thanks for your replay...
When i type bitbake nano...then

NOTE: Using cache in '/stuff/build/tmp/cache/c7x0'
NOTE: Handling BitBake files: / (2855/4065) [70 %]ERROR: Could not include
required file uboot_cvs.bb while parsing
/stuff/org.openembedded.dev/packages/uboot/uboot-devkitidp-pxa255_cvs.bb
NOTE: Handling BitBake files: \ (4065/4065) [100 %]
NOTE: Parsing finished. 3900 cached, 0 parsed, 164 skipped, 0 masked.

NOTE: build 200701051710: started

OE Build Configuration:
BB_VERSION     = "1.6.3"
OE_REVISION    = "624e4cbb972e04d84e15da2a3aeec793dc467ce3"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "c7x0"
DISTRO         = "openzaurus"
DISTRO_VERSION = ".dev-snapshot-20070105"
TARGET_FPU     = "soft"

NOTE: package fakeroot-native-1.2.13: started
NOTE: package fakeroot-native-1.2.13-r1: task do_fetch: started
NOTE: fetch http://openzaurus.org/mirror/fakeroot_1.2.13.tar.gz
--17:11:00--  http://openzaurus.org/mirror/fakeroot_1.2.13.tar.gz
           => `/root/sources/fakeroot_1.2.13.tar.gz'
Resolving openzaurus.org... 85.214.40.226
Connecting to openzaurus.org|85.214.40.226|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://openzaurus.linuxtogo.org/mirror/fakeroot_1.2.13.tar.gz[following]
--17:11:01--  http://openzaurus.linuxtogo.org/mirror/fakeroot_1.2.13.tar.gz
           => `/root/sources/fakeroot_1.2.13.tar.gz'
Resolving openzaurus.linuxtogo.org... 85.214.40.226
Reusing existing connection to openzaurus.org:80.
HTTP request sent, awaiting response... 404 Not Found
17:11:02 ERROR 404: Not Found.

NOTE: Task failed: Fetch failed:
http://openzaurus.org/mirror/fakeroot_1.2.13.tar.gz
NOTE: package fakeroot-native-1.2.13-r1: task do_fetch: failed
ERROR: TaskFailed event exception, aborting
NOTE: package fakeroot-native-1.2.13: failed
ERROR: Build of nano failed
[root@l5ac190 build]#

this r shown on the screen.......

under tmp/deploy/ipk nothing is store...means building package is
failed...what should i do..
thanks
Debasree
On 1/5/07, Justin Patrin <papercrane@gmail.com> wrote:
>
> On 1/5/07, Debasree Mallick <debasreeat@gmail.com> wrote:
> > Hi,
> > monotone has installed..
> > But when i try to run bitbake nano command
> > it shows some error at the end..
> > Errors r
> > ERROR: TaskFailed event exception, aborting
> > NOTE: package fakeroot-native-1.2.13: failed
> > ERROR: Build of nano failed
> >
>
> You only need to send help requests once.
>
> Something is failing. Please post the error that is showing higher up.
> You may need to include a log file.
>
> --
> Justin Patrin
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


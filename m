Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id DB2C9707D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 01:10:04 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so413634wgh.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=rWMCB/KOGGkIAIxuRko39bFP2Xog+mtE0Wn1jdneBU0=;
	b=Y4cG/s+ttxq68aUY/YhoI33mGn04L1cI/L5lfbxmeOYFwqBMAmcAqSBOu2rU3ICJ7B
	UhzMTWgxTlZBda9AljAZxtjaaI7UzUqTuPItGCDQOSa4Is2TA+MPwT7j7gLeckyFsvK6
	alg5yxpJwVfHXOS2CcfZdGiGjG6mbd1IhvLUwhIRjD+dMnYz/owbkTnBarTPzOnbJk/L
	i7oUbvT36oxbSKLcorcInL3ChaKBpOb2EpGeloLbvFcvOkQQ+QZAjHlqLo+szMYZpTHn
	AmPbsckj+Fb3bhmftKV5uTPBHl561shCmrKiTwSMYlRxKKlEtjRN9jpW+iyUuqxVk8Gm
	ijVQ==
MIME-Version: 1.0
X-Received: by 10.180.207.105 with SMTP id lv9mr19215049wic.23.1406077805377; 
	Tue, 22 Jul 2014 18:10:05 -0700 (PDT)
Received: by 10.194.18.114 with HTTP; Tue, 22 Jul 2014 18:10:05 -0700 (PDT)
In-Reply-To: <CAD2C2VSFVUi9surRZhB9mZih2MUrUYZ+-zsq=RhrDXCEvber0g@mail.gmail.com>
References: <CAD2C2VT=3DipX=8chChc6_NefZSfs3jocmYxePJp5THxANiKVg@mail.gmail.com>
	<53BC1835.90204@balister.org>
	<CAD2C2VTnHrLsfhRXcUxpcpXgWK+LzxxD87XrvrN6wiiMK+CMUw@mail.gmail.com>
	<CAD2C2VSTKS+NX=0CAwh1PAtkKgcHh+mpwMMVmh_b4dw9GeaABw@mail.gmail.com>
	<53C51AE2.4030100@bec-systems.com>
	<CAD2C2VR22ww51=1UQbW7OxtWvr8dV1PjLhr0d0O176JtX6PJKQ@mail.gmail.com>
	<CAD2C2VSFVUi9surRZhB9mZih2MUrUYZ+-zsq=RhrDXCEvber0g@mail.gmail.com>
Date: Tue, 22 Jul 2014 18:10:05 -0700
Message-ID: <CAOLEWZXWK0smRL0v+Ke+EGnNy_ho52rc9xmc3pq-f38s8mcsUQ@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: open embedded build issues with beagle board
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jul 2014 01:10:08 -0000
Content-Type: text/plain; charset=UTF-8

It's in the layer index, which will point to the beagleboard.org stuff on
github:

https://github.com/beagleboard

Have fun...

Steve


On Tue, Jul 22, 2014 at 3:15 AM, Bryan <just4tech83@gmail.com> wrote:

> Please suggest me link to get  meta layer for beagkeboard.
> On Jul 17, 2014 10:36 AM, "Bryan" <just4tech83@gmail.com> wrote:
>
> >
> > Hi,
> >    Thanks for your suggestion to use meta-ti layer. Cau you please tell
> us
> > where we can find this layer as we couldn't find it on openembedded git.
> >
> > We tried with following link to build but it gives error while building.
> > https://github.com/beagleboard/meta-beagleboard
> >
> >
> > Thanks
> > Bryan
> > On Jul 15, 2014 5:43 PM, "Cliff Brake" <cbrake@bec-systems.com> wrote:
> >
> >>  The meta-ti layer includes support for the beagleboard.  You probably
> >> want the linux-mainline 3.2 recipe.
> >>
> >> Cliff
> >>
> >> On 07/15/2014 12:29 AM, Bryan wrote:
> >>
> >> Hi Cliff,
> >>          thanks for your suggestion, i tried links which you mentioned
> in
> >> your mail. Now i am able to build minimal image for MACHINE = qmux6.
> >> Can you please tell us how can we make it for beagleboard omap 3530.
> >> Where can we find support layer for beagleboard.
> >>
> >> Thanks a lot in advance !
> >> On Jul 11, 2014 11:30 AM, "Bryan" <just4tech83@gmail.com> wrote:
> >>
> >>> Hi,
> >>>      As per your suggestion we took oe-core and other packages from
> >>> followinf link:
> >>> -> http://git.openembedded.org/meta-openembedded
> >>>
> >>> We are using bitbake version 1.23.1.
> >>>
> >>> We have to build image for beagleboard so we find following to build
> >>> image:
> >>>
> >>> ->
> >>>
> http://www.crashcourse.ca/wiki/index.php/Building_for_BBB_using_OpenEmbedded
> >>>
> >>> While following steps from the above link we have done following
> >>> settings in local.conf  and bblayers.conf file.
> >>>
> >>> MACHINE ??= "beaglebone"
> >>> BBLAYERS ?= " \
> >>>   /home/rpjday/oe/dist/layers/oe-core/meta \
> >>>   /home/rpjday/oe/dist/layers/meta-openembedded/meta-oe \
> >>>   /home/rpjday/oe/dist/layers/meta-beagleboard/common-bsp \
> >>>   "
> >>> Now while running "bitbake core-image-minimal" command we are getting
> >>> following issues :
> >>>
> >>> chown: changing ownership of
> >>>
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/intro_what.html':
> >>> Operation not permitted
> >>> chown: changing ownership of
> >>>
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/program_ram.html':
> >>> Operation not permitted
> >>> chown: changing ownership of
> >>>
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/arch_apis.html':
> >>> Operation not permitted
> >>> chown: changing ownership of
> >>>
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/transapp_reclimit.html':
> >>> Operation not permitted
> >>> chown: changing ownership of
> >>>
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/am_close.html':
> >>> Operation not permitted
> >>> chown: changing ownership of
> >>>
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/lock_stdmode.html':
> >>> Operation not permitted
> >>> chown: changing ownership of
> >>>
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/transapp_env_open.html':
> >>> Operation not permitted
> >>>
> >>> WARNING:
> >>>
> /home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/temp/run.do_install.26236:1
> >>> exit 1 from
> >>>   chown -R root:root
> >>>
> /home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image
> >>> ERROR: Function failed: do_install (log file is located at
> >>>
> /home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/temp/log.do_install.26236)
> >>>
> >>> one more doubt about the code base which we should follow as we found
> >>> one other link which have oe-core code at "
> >>> https://github.com/openembedded". We have tried both and found
> seperate
> >>> issues while using both.
> >>>
> >>> Please suggest us how we can overcome these issues to get test image
> >>> build for beagleboard.
> >>>
> >>> Thanks in advance
> >>> ---------- Forwarded message ----------
> >>> From: "Philip Balister" <philip@balister.org>
> >>> Date: Jul 8, 2014 9:42 PM
> >>> Subject: Re: [oe] open embedded build issues with beagle board
> >>> To: <openembedded-devel@lists.openembedded.org>
> >>> Cc:
> >>>
> >>> On 07/08/2014 02:54 AM, Bryan wrote:
> >>> > Hi All
> >>> >  I am trying to build  Openembeeded classic for Beagle board-XM but i
> >>> am
> >>> > getting lot of broken link issues. I have  set DISTRO as
> >>> angstrom-2010.x in
> >>> > local.conf.   Is this approach  ok? or should i move to openembedded
> >>> core ??
> >>> > Pls suggest.
> >>>
> >>> Use the current Angstrom instructions, oe-classic is pretty much
> >>> completely unsupported now.
> >>>
> >>> Philip
> >>>
> >>> >
> >>> > Broken link e.g.
> >>> >
> >>> > Resolving www.angstrom-distribution.org (
> www.angstrom-distribution.org
> >>> )...
> >>> > 140.211.169.177
> >>> >  Connecting to www.angstrom-distribution.org
> >>> > (www.angstrom-distribution.org)|140.211.169.177|:80...
> >>> > connected.
> >>> >  HTTP request sent, awaiting response...
> >>> > 404 Not Found  2014-07-08 10:13:43 ERROR 404: Not Found.
> >>> >
> >>> > Thanks in advance
> >>> >
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >>
> >>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


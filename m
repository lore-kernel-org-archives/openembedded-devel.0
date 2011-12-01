Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rizwancodes@gmail.com>) id 1RW4QH-0001xi-ME
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 12:03:27 +0100
Received: by faaa19 with SMTP id a19so959060faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 02:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ouJxfb4QvURTGzSO4CaM9yDePa3VPb7nz+Bvq1189AQ=;
	b=x/dAHYU5CsuBR55aXd9siZJiZQhFxFjK7vZ7WOyNHiniYvL7YLMRrwKzsLJbArigdv
	WxgBNwWvJQaHpnbdq2lEP0AUXu5CfuHMtrxWD11nYVJhK1la6wQSFVb8bV8+Azi8j6I7
	3WuIbHNfEZoPGIU/hvQMDlDt4kdkxh6AMOTrQ=
MIME-Version: 1.0
Received: by 10.180.94.71 with SMTP id da7mr4473355wib.29.1322736999888; Thu,
	01 Dec 2011 02:56:39 -0800 (PST)
Received: by 10.216.1.13 with HTTP; Thu, 1 Dec 2011 02:56:39 -0800 (PST)
In-Reply-To: <mailman.501.1322730000.26642.openembedded-devel@lists.openembedded.org>
References: <mailman.501.1322730000.26642.openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Dec 2011 16:26:39 +0530
Message-ID: <CAPdp9mwrRs2+m=ixuJCC=ASQ0jrz4Wy1MGFxFX6q=CzF9Z8LdQ@mail.gmail.com>
From: Rizwan Shaik <rizwancodes@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Openembedded-devel Digest, Vol 65, Issue 2
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
X-List-Received-Date: Thu, 01 Dec 2011 11:03:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear Sir/Madam,

I am getting the following error while building the OpenEmbedded Angstrom
image.

ERROR: Task 31
(/media/THARMA_OE_500GB/rizwan_oe_11.04/openembedded/recipes/shasum/
shasum-native.bb, do_fetch) failed
NOTE: Tasks Summary: Attempted 1 tasks of which 1 didn't need to be rerun
and 1 failed.
ERROR: '/media/THARMA_OE_500GB/rizwan_oe_11.04/openembedded/recipes/shasum/
shasum-native.bb' failed

Please give me a solution.Thank you in Advance.
Waiting for the solution.

Thanks and Regards,
Rizwan

On Thu, Dec 1, 2011 at 2:30 PM, <
openembedded-devel-request@lists.openembedded.org> wrote:

> Send Openembedded-devel mailing list submissions to
>        openembedded-devel@lists.openembedded.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> or, via email, send a message with subject or body 'help' to
>        openembedded-devel-request@lists.openembedded.org
>
> You can reach the person managing the list at
>        openembedded-devel-owner@lists.openembedded.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Openembedded-devel digest..."
>
>
> Today's Topics:
>
>   1. [meta-java] jamvm git: use proper PV (Koen Kooi)
>   2. Re: OE-core based java layer? (Stefan Schmidt)
>   3. Re: [oe-commits] Koen Kooi : pixman: update to 0.24.0 (Koen Kooi)
>   4. Re: [oe-commits] Koen Kooi : pixman: update to 0.24.0
>      (Martin Jansa)
>   5. Re: OE-core based java layer? (Henning Heinold)
>   6. Re: [meta-java] jamvm git: use proper PV (Henning Heinold)
>   7. Re: OE-core based java layer? (Steffen Sledz)
>   8. Re: OE-core based java layer? (Koen Kooi)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Thu,  1 Dec 2011 09:03:07 +0100
> From: Koen Kooi <koen@dominion.thruhere.net>
> Subject: [oe] [meta-java] jamvm git: use proper PV
> To: openembedded-devel@lists.openembedded.org
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Message-ID:
>        <1322726587-5992-1-git-send-email-koen@dominion.thruhere.net>
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-core/jamvm/jamvm_git.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/
> jamvm_git.bb
> index 6d06552..e6b6132 100644
> --- a/recipes-core/jamvm/jamvm_git.bb
> +++ b/recipes-core/jamvm/jamvm_git.bb
> @@ -4,7 +4,7 @@
>  require jamvm.inc
>
>  SRCREV = "4617da717ecb05654ea5bb9572338061106a414d"
> -PV = "0.0+git${SRCPV}"
> +PV = "1.5.5+1.6.0-devel+git${SRCPV}"
>
>  SRC_URI = "git://git.berlios.de/jamvm;protocol=git \
>            file://jamvm-jni_h-noinst.patch \
> --
> 1.7.2.5
>
>
>
>
> ------------------------------
>
> Message: 2
> Date: Thu, 1 Dec 2011 09:08:38 +0100
> From: Stefan Schmidt <stefan@datenfreihafen.org>
> Subject: Re: [oe] OE-core based java layer?
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <20111201080837.GB17111@novatech.datenfreihafen.org>
> Content-Type: text/plain; charset=us-ascii
>
> Hello.
>
> On Wed, 2011-11-30 at 20:22, Koen Kooi wrote:
> >
> > Beagleboard.org has moved to the OE-core metaverse to build the factory
> > images and we need java support to stay feature compatible with OE
> classic.
> >
> > Are there already people working on such a thing or should I just go
> ahead
> > and add a meta-java to the meta-oe repo and start importing recipes
> one-by-one?
>
> Henning already did it. https://github.com/woglinde/meta-java/
>
> I was able to build openjdk-6 from it. Still having some problems with
> some of our Buglabs java recipes but I think its not meta-java's
> fault. :)
>
> regards
> Stefan Schmidt
>
>
>
> ------------------------------
>
> Message: 3
> Date: Thu, 01 Dec 2011 09:13:10 +0100
> From: Koen Kooi <koen@dominion.thruhere.net>
> Subject: Re: [oe] [oe-commits] Koen Kooi : pixman: update to 0.24.0
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <jb7cun$3n6$1@dough.gmane.org>
> Content-Type: text/plain; charset=UTF-8
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 01-12-11 01:35, Martin Jansa schreef:
> > On Thu, Dec 01, 2011 at 12:18:54AM +0100, Martin Jansa wrote:
> >> On Wed, Nov 30, 2011 at 3:32 PM,  <git@git.openembedded.org> wrote:
> >>> Module: meta-openembedded.git Branch: master Commit:
> >>> 80e3a0c42db89fa2716b0a839b8ef71d6d6349db URL:
> >>>
> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=80e3a0c42db89fa2716b0a839b8ef71d6d6349db
> >>>
> >>>
> >>>
> Author: Koen Kooi <koen@dominion.thruhere.net>
> >>> Date:   Wed Nov 30 15:27:26 2011 +0100
> >>>
> >>> pixman: update to 0.24.0
> >>>
> >>> * All patches that went upstream are removed
> >>>
> >>> Tested on beagleboard/angstrom
> >>>
> >>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >>>
> >>
> >> FYI: this break my armv5t build, I'll try to test pixman-0.24.0 from
> >> oe-core or debug it tomorrow.
> >>
> >> | arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc
> >> -march=armv5te -mthumb -mthumb-interwork -mtune=xscale
> >> --sysroot=/OE/shr-core/tmp-eglibc/sysroo ts/spitz -O2 -pipe -g
> >> -feliminate-unused-debug-types -Wall -fno-strict-aliasing
> >> -fvisibility=hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o
> >> .libs/pdf-op-test pdf-op-test.o  ./.libs/libutils.a
> >> ../pixman/.libs/libpixman-1.so
> >> /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libpng12.so
> >> /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libz.so -lm |
> >> ../pixman/.libs/libpixman-1.so: undefined reference to
> >> `__builtin_arm_wslldi' | ../pixman/.libs/libpixman-1.so: undefined
> >> reference to `__builtin_arm_wor' | ../pixman/.libs/libpixman-1.so:
> >> undefined reference to `__builtin_arm_wunpckilb' |
> >> ../pixman/.libs/libpixman-1.so: undefined reference to
> >> `__builtin_arm_wsrldi' | ../pixman/.libs/libpixman-1.so: undefined
> >> reference to `__builtin_arm_waddbus' | ../pixman/.libs/libpixman-1.so:
> >> undefined reference to `__builtin_arm_waddhus' |
> >> ../pixman/.libs/libpixman-1.so: undefined reference to
> >> `__builtin_arm_wsrlhi' | ../pixman/.libs/libpixman-1.so: undefined
> >> reference to `__builtin_arm_wxor' | ../pixman/.libs/libpixman-1.so:
> >> undefined reference to `__builtin_arm_wpackhus' |
> >> ../pixman/.libs/libpixman-1.so: undefined reference to
> >> `__builtin_arm_wand' | ../pixman/.libs/libpixman-1.so: undefined
> >> reference to `__builtin_arm_wunpckihb' |
> >> ../pixman/.libs/libpixman-1.so: undefined reference to
> >> `__builtin_arm_wzero' | ../pixman/.libs/libpixman-1.so: undefined
> >> reference to `__builtin_arm_walign' | ../pixman/.libs/libpixman-1.so:
> >> undefined reference to `__builtin_arm_wmulul' | collect2: ld returned 1
> >> exit status | make[2]: *** [a1-trap-test] Error 1
> >>
> >> The same for region-test and pdf-op-test.
> >
> > Failed the same also for armv4t.. so for now I've added
> > --disable-arm-iwmmxt and replaced .bb with smaller .bbappend:
> >
> > FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
> >
> > DEPENDS += "perl-native" BBCLASSEXTEND = "native"
> >
> > PRINC = "6"
> >
> > SRC_URI += "
> > file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch"
> >
> > NEON = " --disable-arm-neon " NEON_armv7a = " " NEON_armv7a-vfp-neon = "
> > "
> >
> > IWMMXT = " --disable-arm-iwmmxt "
> >
> > EXTRA_OECONF += "${NEON} ${IWMMXT}"
>
> Do you want to send a patch for that?
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iEYEARECAAYFAk7XNxYACgkQMkyGM64RGpFMPQCfdUSdwDedEIoZVd0sDwFHoE+/
> bekAnjd6YDJhN2+1Do4Q3UVmJ/PWRhy1
> =H0/4
> -----END PGP SIGNATURE-----
>
>
>
>
> ------------------------------
>
> Message: 4
> Date: Thu, 1 Dec 2011 09:16:33 +0100
> From: Martin Jansa <martin.jansa@gmail.com>
> Subject: Re: [oe] [oe-commits] Koen Kooi : pixman: update to 0.24.0
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <20111201081633.GG29875@jama.jama.net>
> Content-Type: text/plain; charset="us-ascii"
>
> On Thu, Dec 01, 2011 at 09:13:10AM +0100, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Op 01-12-11 01:35, Martin Jansa schreef:
> > > On Thu, Dec 01, 2011 at 12:18:54AM +0100, Martin Jansa wrote:
> > >> On Wed, Nov 30, 2011 at 3:32 PM,  <git@git.openembedded.org> wrote:
> > >>> Module: meta-openembedded.git Branch: master Commit:
> > >>> 80e3a0c42db89fa2716b0a839b8ef71d6d6349db URL:
> > >>>
> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=80e3a0c42db89fa2716b0a839b8ef71d6d6349db
> > >>>
> > >>>
> > >>>
> > Author: Koen Kooi <koen@dominion.thruhere.net>
> > >>> Date:   Wed Nov 30 15:27:26 2011 +0100
> > >>>
> > >>> pixman: update to 0.24.0
> > >>>
> > >>> * All patches that went upstream are removed
> > >>>
> > >>> Tested on beagleboard/angstrom
> > >>>
> > >>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > >>>
> > >>
> > >> FYI: this break my armv5t build, I'll try to test pixman-0.24.0 from
> > >> oe-core or debug it tomorrow.
> > >>
> > >> | arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc
> > >> -march=armv5te -mthumb -mthumb-interwork -mtune=xscale
> > >> --sysroot=/OE/shr-core/tmp-eglibc/sysroo ts/spitz -O2 -pipe -g
> > >> -feliminate-unused-debug-types -Wall -fno-strict-aliasing
> > >> -fvisibility=hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o
> > >> .libs/pdf-op-test pdf-op-test.o  ./.libs/libutils.a
> > >> ../pixman/.libs/libpixman-1.so
> > >> /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libpng12.so
> > >> /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libz.so -lm |
> > >> ../pixman/.libs/libpixman-1.so: undefined reference to
> > >> `__builtin_arm_wslldi' | ../pixman/.libs/libpixman-1.so: undefined
> > >> reference to `__builtin_arm_wor' | ../pixman/.libs/libpixman-1.so:
> > >> undefined reference to `__builtin_arm_wunpckilb' |
> > >> ../pixman/.libs/libpixman-1.so: undefined reference to
> > >> `__builtin_arm_wsrldi' | ../pixman/.libs/libpixman-1.so: undefined
> > >> reference to `__builtin_arm_waddbus' | ../pixman/.libs/libpixman-1.so:
> > >> undefined reference to `__builtin_arm_waddhus' |
> > >> ../pixman/.libs/libpixman-1.so: undefined reference to
> > >> `__builtin_arm_wsrlhi' | ../pixman/.libs/libpixman-1.so: undefined
> > >> reference to `__builtin_arm_wxor' | ../pixman/.libs/libpixman-1.so:
> > >> undefined reference to `__builtin_arm_wpackhus' |
> > >> ../pixman/.libs/libpixman-1.so: undefined reference to
> > >> `__builtin_arm_wand' | ../pixman/.libs/libpixman-1.so: undefined
> > >> reference to `__builtin_arm_wunpckihb' |
> > >> ../pixman/.libs/libpixman-1.so: undefined reference to
> > >> `__builtin_arm_wzero' | ../pixman/.libs/libpixman-1.so: undefined
> > >> reference to `__builtin_arm_walign' | ../pixman/.libs/libpixman-1.so:
> > >> undefined reference to `__builtin_arm_wmulul' | collect2: ld returned
> 1
> > >> exit status | make[2]: *** [a1-trap-test] Error 1
> > >>
> > >> The same for region-test and pdf-op-test.
> > >
> > > Failed the same also for armv4t.. so for now I've added
> > > --disable-arm-iwmmxt and replaced .bb with smaller .bbappend:
> > >
> > > FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
> > >
> > > DEPENDS += "perl-native" BBCLASSEXTEND = "native"
> > >
> > > PRINC = "6"
> > >
> > > SRC_URI += "
> > > file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch"
> > >
> > > NEON = " --disable-arm-neon " NEON_armv7a = " " NEON_armv7a-vfp-neon =
> "
> > > "
> > >
> > > IWMMXT = " --disable-arm-iwmmxt "
> > >
> > > EXTRA_OECONF += "${NEON} ${IWMMXT}"
> >
> > Do you want to send a patch for that?
>
> I'll after more test
>
> >
> >
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.11 (Darwin)
> > Comment: GPGTools - http://gpgtools.org
> >
> > iEYEARECAAYFAk7XNxYACgkQMkyGM64RGpFMPQCfdUSdwDedEIoZVd0sDwFHoE+/
> > bekAnjd6YDJhN2+1Do4Q3UVmJ/PWRhy1
> > =H0/4
> > -----END PGP SIGNATURE-----
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> -------------- next part --------------
> A non-text attachment was scrubbed...
> Name: not available
> Type: application/pgp-signature
> Size: 198 bytes
> Desc: Digital signature
> URL: <
> http://lists.linuxtogo.org/pipermail/openembedded-devel/attachments/20111201/acfc0121/attachment-0001.pgp
> >
>
> ------------------------------
>
> Message: 5
> Date: Thu, 1 Dec 2011 09:26:55 +0100
> From: Henning Heinold <heinold@inf.fu-berlin.de>
> Subject: Re: [oe] OE-core based java layer?
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <20111201082655.GA4447@rhein.zuhause.netz>
> Content-Type: text/plain; charset=us-ascii
>
> On Thu, Dec 01, 2011 at 09:08:38AM +0100, Stefan Schmidt wrote:
> > Hello.
> >
> > On Wed, 2011-11-30 at 20:22, Koen Kooi wrote:
> > >
> > > Beagleboard.org has moved to the OE-core metaverse to build the factory
> > > images and we need java support to stay feature compatible with OE
> classic.
> > >
> > > Are there already people working on such a thing or should I just go
> ahead
> > > and add a meta-java to the meta-oe repo and start importing recipes
> one-by-one?
> >
> > Henning already did it. https://github.com/woglinde/meta-java/
> >
> > I was able to build openjdk-6 from it. Still having some problems with
> > some of our Buglabs java recipes but I think its not meta-java's
> > fault. :)
>
> Hi,
>
> thanks for the feedback. I did not found the time to announce it via
> E-Mail.
>
> But now it is.
>
> Which brings me to the question, if we should host meta-java on the oe git
> servers or not?
>
> Bye Henning
>
>
>
> ------------------------------
>
> Message: 6
> Date: Thu, 1 Dec 2011 09:38:10 +0100
> From: Henning Heinold <heinold@inf.fu-berlin.de>
> Subject: Re: [oe] [meta-java] jamvm git: use proper PV
> To: openembedded-devel@lists.openembedded.org
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Message-ID: <20111201083810.GB4447@rhein.zuhause.netz>
> Content-Type: text/plain; charset=us-ascii
>
> On Thu, Dec 01, 2011 at 09:03:07AM +0100, Koen Kooi wrote:
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> >  recipes-core/jamvm/jamvm_git.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/
> jamvm_git.bb
> > index 6d06552..e6b6132 100644
> > --- a/recipes-core/jamvm/jamvm_git.bb
> > +++ b/recipes-core/jamvm/jamvm_git.bb
> > @@ -4,7 +4,7 @@
> >  require jamvm.inc
> >
> >  SRCREV = "4617da717ecb05654ea5bb9572338061106a414d"
> > -PV = "0.0+git${SRCPV}"
> > +PV = "1.5.5+1.6.0-devel+git${SRCPV}"
> >
> >  SRC_URI = "git://git.berlios.de/jamvm;protocol=git \
> >             file://jamvm-jni_h-noinst.patch \
> > --
> > 1.7.2.5
>
> Hi Koen,
>
> thanks I applied the patch.
>
> Bye Henning
>
>
>
> ------------------------------
>
> Message: 7
> Date: Thu, 01 Dec 2011 09:51:00 +0100
> From: Steffen Sledz <sledz@dresearch-fe.de>
> Subject: Re: [oe] OE-core based java layer?
> To: openembedded-devel@lists.openembedded.org
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Message-ID: <4ED73FF4.1020406@dresearch-fe.de>
> Content-Type: text/plain; charset=UTF-8
>
> On 30.11.2011 20:40, Otavio Salvador wrote:
> > On Wed, Nov 30, 2011 at 17:22, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> >
> >> Are there already people working on such a thing or should I just go
> ahead
> >> and add a meta-java to the meta-oe repo and start importing recipes
> >> one-by-one?
> >>
> >
> > https://github.com/woglinde/meta-java
>
> In my opinion ths should be added to <
> http://www.openembedded.org/wiki/LayerIndex>.
>
> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch?ftsf?hrer: Dr. Michael Weber, Werner M?gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
>
>
>
> ------------------------------
>
> Message: 8
> Date: Thu, 01 Dec 2011 09:53:03 +0100
> From: Koen Kooi <koen@dominion.thruhere.net>
> Subject: Re: [oe] OE-core based java layer?
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <jb7f9f$j82$1@dough.gmane.org>
> Content-Type: text/plain; charset=UTF-8
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 01-12-11 09:26, Henning Heinold schreef:
> > On Thu, Dec 01, 2011 at 09:08:38AM +0100, Stefan Schmidt wrote:
> >> Hello.
> >>
> >> On Wed, 2011-11-30 at 20:22, Koen Kooi wrote:
> >>>
> >>> Beagleboard.org has moved to the OE-core metaverse to build the
> >>> factory images and we need java support to stay feature compatible
> >>> with OE classic.
> >>>
> >>> Are there already people working on such a thing or should I just go
> >>> ahead and add a meta-java to the meta-oe repo and start importing
> >>> recipes one-by-one?
> >>
> >> Henning already did it. https://github.com/woglinde/meta-java/
> >>
> >> I was able to build openjdk-6 from it. Still having some problems with
> >> some of our Buglabs java recipes but I think its not meta-java's fault.
> >> :)
> >
> > Hi,
> >
> > thanks for the feedback. I did not found the time to announce it via
> > E-Mail.
> >
> > But now it is.
> >
> > Which brings me to the question, if we should host meta-java on the oe
> > git servers or not?
>
> What's wrong with the current situation?
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iEUEARECAAYFAk7XQG0ACgkQMkyGM64RGpFBawCfWpmyTrc6JwV0HSRknTvlGRms
> 780AmIrF0T/plv6gWIs/36hsFfYo+6k=
> =TPJ7
> -----END PGP SIGNATURE-----
>
>
>
>
> ------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> End of Openembedded-devel Digest, Vol 65, Issue 2
> *************************************************
>


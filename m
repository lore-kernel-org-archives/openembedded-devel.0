Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nikunjbadjatya@gmail.com>) id 1OQfq1-0007xC-SB
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 14:10:56 +0200
Received: by gyg10 with SMTP id 10so2226148gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=5qNTG3e8MSU9aDWLz9FhbQlQKm2VniloUN0+OInU3YA=;
	b=TYlHEWoulbOW7y9Xf7/jbKdUJ7btb7AofL1tY99ApqpYYw82EHsjD+oHQxTD1822bz
	nZf7ys7QZGMz4q1X4lS/zIn1DZ0lKp2XmuXBaHyqN0Y+UUEbOqe78S5rmtBbvORp/7UE
	q3ZyHZuIbyDRnl6AwA9hGMaJeI07uX4XGN0qE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=hDpDB6K/NOHyOuIFf5mqu7dMIa7nZinxu4fSrZ0wPlot5Btdlk55fkM1W8PfbP6UD0
	6tt8u7MgK9I0HJtj/8v+UFlqwAgLdGuiSQT5kQXVF2Ei26y13L1scPgc2Uc+nQs+2iAE
	GknFuoTPkJFUMEItByCekEzX1UYPgfBxF2jEU=
Received: by 10.229.183.146 with SMTP id cg18mr2344681qcb.17.1277121977378; 
	Mon, 21 Jun 2010 05:06:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.191.12 with HTTP; Mon, 21 Jun 2010 05:05:57 -0700 (PDT)
In-Reply-To: <AANLkTilcZp2HZB8cSOdRurRuCfkMf_KpSiMxDmh_LgDY@mail.gmail.com>
References: <AANLkTilQUwinqS2HGJJzP3t_UTmXtH9daLEiN_fek-6i@mail.gmail.com> 
	<AANLkTikBqtzPB0rBp1DQ4Ekzo40HeAJcX1q7i1mLFaWy@mail.gmail.com> 
	<AANLkTim1FUHwT6lBvu2yoUUM8rvYRSaw-9e4VE_olNoa@mail.gmail.com> 
	<AANLkTilzhsHsHj4f-bd4FcB7Ka7fRspYX0iUsMxxzVuz@mail.gmail.com> 
	<AANLkTikK720KNmNjRKr6x12-kSben4t42KlmgHsSGEpS@mail.gmail.com> 
	<20100617193846.GC14941@mx.loc>
	<AANLkTikt8uUURjI56tmIEH0dCwtSJtwk0wre9oxNHEwF@mail.gmail.com> 
	<AANLkTikdhubttOOkUq58_nl5E62jtB7QN7widnkNVT0R@mail.gmail.com> 
	<AANLkTin0_Mk8gzfXnPgePnGGkOaDfzx2up1LkD44norg@mail.gmail.com> 
	<AANLkTilcZp2HZB8cSOdRurRuCfkMf_KpSiMxDmh_LgDY@mail.gmail.com>
From: nikunj badjatya <nikunjbadjatya@gmail.com>
Date: Mon, 21 Jun 2010 17:35:57 +0530
Message-ID: <AANLkTikBJpnUTeEyvFrToBSHTp0T4LV-SuYL4BAjZvR6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: nikunjbadjatya@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OSError: [Errno 2] No such file or directory
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
X-List-Received-Date: Mon, 21 Jun 2010 12:10:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
I couldnt find errors.

FILE *log.packagedstaging_fastpath* (
build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/temp/*  )
has:

*cp: cannot stat
`/home/nikunj/ope/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r=
36.3/sysroot-destdir///home/nikunj/ope/build/tmp/cross/armv5te/*':
No such file or directory*

FILE *log.do_package_update_index_ipk* (
build/tmp/work/omap5912osk-angstrom-linux-gnueabi/console-image-1.0-r0/temp=
/*
)  has

+ ipkgarchs=3D'all any noarch arm  armv4 armv4t armv5te omap5912osk'
+ '[' '!' -z '' ']'
+ mkdir -p /home/nikunj/ope/build/tmp/deploy/glibc/ipk
+ touch /home/nikunj/ope/build/tmp/deploy/glibc/ipk/Packages
+ ipkg-make-index -r /home/nikunj/ope/build/tmp/deploy/glibc/ipk/Packages -=
p
/home/nikunj/ope/build/tmp/deploy/glibc/ipk/Packages -l
/home/nikunj/ope/build/tmp/deploy/glibc/ipk/Packages.filelist -m
/home/nikunj/ope/build/tmp/deploy/glibc/ipk
/home/nikunj/ope/build/tmp/work/omap5912osk-angstrom-linux-gnueabi/console-=
image-1.0-r0/temp/run.do_package_update_index_ipk.13546:
line 222: ipkg-make-index: command not found

The *build/tmp/**deploy/glibc *contains
* a directory named *ipk/* ( 0 bytes )
* a lock file *ipk.lock* of 0 bytes.

Any help ?

Thanks,
Nikunj


On Sat, Jun 19, 2010 at 12:29 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Jun 18, 2010 at 5:07 AM, nikunj badjatya
> <nikunjbadjatya@gmail.com> wrote:
> > Hi again,
> >
> > The build was running successfully untill It came at this place.. : The
> last
> > few lines where error occured.
> >
> > $ bitbake console-image 2>&1 | tee console-image.log
> > ............................................
> > ............................................
> > *NOTE: Running task 959 of 3342 (ID: 134,
> > /home/nikunj/ope/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
> > NOTE: preparing tree for binary locale generation
> > NOTE: generating locale es_NI (UTF-8)
> > NOTE: Task failed: localedef returned an error (command was
> >
> PATH=3D"/home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/armv5te-an=
gstrom-linux-gnueabi:/home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin=
/armv5te-angstrom-linux-gnueabi:/home/nikunj/ope/build/tmp/sysroots/i686-li=
nux/usr/sbin:/home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin:/home/n=
ikunj/ope/build/tmp/cross/armv5te//bin:/home/nikunj/ope/build/tmp/sysroots/=
i686-linux/sbin:/home/nikunj/ope/build/tmp/sysroots/i686-linux/bin:/home/ni=
kunj/ope/bitbake/bin:/usr/lib/qt-3.3/bin:/usr/kerberos/bin:/usr/local/bin:/=
usr/bin:/bin:/usr/X11R6/bin:/home/nikunj/bin"
> >
> I18NPATH=3D"/home/nikunj/ope/build/tmp/work/armv5te-angstrom-linux-gnueab=
i/glibc-2.9-r36.3/locale-tree/usr/share/i18n"
> > qemu-arm -s 1048576 -r 2.6.24 -L
> >
> /home/nikunj/ope/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-=
r36.3/locale-tree
> > -E
> >
> LD_LIBRARY_PATH=3D/home/nikunj/ope/build/tmp/work/armv5te-angstrom-linux-=
gnueabi/glibc-2.9-r36.3/locale-tree/lib
> >
> /home/nikunj/ope/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-=
r36.3/locale-tree/bin/localedef
> > --force --old-style --no-archive
> >
> --prefix=3D/home/nikunj/ope/build/tmp/work/armv5te-angstrom-linux-gnueabi=
/glibc-2.9-r36.3/locale-tree
> > --inputfile=3D/usr/share/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
> > ERROR: TaskFailed event exception, aborting
> > ERROR: Build of
> > /home/nikunj/ope/openembedded/recipes/glibc/glibc_2.9.bbdo_package
> > failed
> > ERROR: Task 134 (/home/nikunj/ope/openembedded/recipes/glibc/
> glibc_2.9.bb,
> > do_package) failed
> > NOTE: Tasks Summary: Attempted 958 tasks of which 909 didn't need to be
> > rerun and 1 failed.
> > ERROR: '/home/nikunj/ope/openembedded/recipes/glibc/glibc_2.9.bb'
> failed*
> >
> >
> > What does this tell..?
>
> it tells nothing other than it seems that qemu is failing when
> generating locales. If you try to parse logs you will help yourself
> quite a bit.
> OE generates logs in builddir/temp then are called log.<task>.xxxx try
> to find errors in them
> if you can not at least post them when asking here.
>
> >
> > Nikunj Badjatya
> > BTech
> >
> >
> >
> >
> > On Fri, Jun 18, 2010 at 3:09 PM, nikunj badjatya
> > <nikunjbadjatya@gmail.com>wrote:
> >
> >> Hi All,
> >> I have found the cause of the problem.
> >> I did a reinstall of Python and YUM few days back.
> >> I was thinking that other software requirements ( texi2info, help2man,
> >> chrpath etc. ) need not to be installed again.
> >> But when I tried reinstalling them also, the error is gone..!!
> >>
> >> The strange thing is that bitbake was not reporting himself that this
> are
> >> the missing modules which it needs prior to running any build..!!
> >>
> >> Anyways, Thanks Very Much for your time.
> >>
> >>
> >> Nikunj
> >> Bangalore, India
> >>
> >>
> >>
> >>
> >>
> >> On Fri, Jun 18, 2010 at 10:02 AM, nikunj badjatya <
> >> nikunjbadjatya@gmail.com> wrote:
> >>
> >>> Hi Bernhard,
> >>>
> >>> *echo $BBPATH
> >>> /home/nikunj/ope/build:/home/nikunj/ope/openembedded*
> >>>
> >>> Is that wrong.?
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> On Fri, Jun 18, 2010 at 1:08 AM, Bernhard Reutner-Fischer <
> >>> rep.dot.nop@gmail.com> wrote:
> >>>
> >>>> On Thu, Jun 17, 2010 at 12:11:52PM -0700, Khem Raj wrote:
> >>>> >On Thu, Jun 17, 2010 at 5:39 AM, nikunj badjatya
> >>>> ><nikunjbadjatya@gmail.com> wrote:
> >>>> >> /home/nikunj/ope/openembedded/recipes/coreutils/
> >>>> coreutils-native_8.5.bb,
> >>>> >> do_populate_sysroot)
> >>>> >> NOTE: Testing
> >>>> >>
> >>>>
> /home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/sysroo=
t-destdir///home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/sleep
> >>>> >> for relocatability
> >>>>
> >>>> >Does
> >>>>
>  /home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/sysro=
ot-destdir///home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/sleep
> >>>> >exist ?
> >>>>
> >>>> huh? How would that supposed to be ok?
> >>>> Looks like home is leaking into some prefix, no?
> >>>> We should have a sanity for that one i suppose..
> >>>>
> >>>> Feb 14 22:25:04 <me> does anybody else see /home in their staging di=
r
> or
> >>>> did i goof up somehow?
> >>>> Feb 14 22:26:24 <me> would be nice if sanity would yell at /root and
> >>>> /home in the staging dir..
> >>>>
> >>>> where /home =3D=3D something in BBPATH, without looking into details=
.
> >>>>
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>>>
> >>>
> >>>
> >>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


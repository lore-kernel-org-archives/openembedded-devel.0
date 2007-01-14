Received: from [64.233.182.188] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <goxboxlive@gmail.com>) id 1H62rD-0006rF-6Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Jan 2007 11:44:59 +0100
Received: by nf-out-0910.google.com with SMTP id l24so1672765nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jan 2007 02:42:46 -0800 (PST)
Received: by 10.82.152.16 with SMTP id z16mr407268bud.1168771365437;
	Sun, 14 Jan 2007 02:42:45 -0800 (PST)
Received: by 10.82.108.10 with HTTP; Sun, 14 Jan 2007 02:42:45 -0800 (PST)
Message-ID: <7221c7d80701140242j714fa46bmd262dae3db19b5b5@mail.gmail.com>
Date: Sun, 14 Jan 2007 11:42:45 +0100
From: "GoXbox Live" <goxboxlive@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45AA0316.2080501@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <1888834532.20070112204308@vanille-media.de>
	<1168681959.5868.4.camel@localhost.localdomain>
	<45A905A7.4070300@dominion.kabel.utwente.nl>
	<200701132239.31919.alban@mycroft1.plus.com>
	<B194FC84-D017-4B53-8FB3-E30FCE2446A4@gmx.net>
	<45A97575.4060103@dominion.kabel.utwente.nl>
	<7221c7d80701140115k38daa2b5l33bc9d9046ff9c4b@mail.gmail.com>
	<45AA0316.2080501@dominion.kabel.utwente.nl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Angstrom cannot buile portabase
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
X-List-Received-Date: Sun, 14 Jan 2007 10:44:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Well, it seems like there will be a bug once in a while for several
packages, and thats goes also for other gui envirements.
Yesterday i had this bug when trying to build gpe-mini-browser so i guess
there isent just opie thats has some bugs.

http://pastebin.ca/315810

Just get used to it Koen, Opie is still alive and it's still beeing
worked on. The last weeks there have been major updates in the cvs.

gxl


2007/1/14, Koen Kooi <koen@dominion.kabel.utwente.nl>:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> GoXbox Live schreef:
> > Just for information.
> > Opie is not broken. There are now several of us wich build Opie right
> out of
> > oe.dev, without any hacks.
> > So please stop this nonsense about "Opie doesnt work" / "Opie doesnt
> build"
> > and so on.
>
> Yes, I can clearly see how well it works and builds when
> kernel-keymap.patch fails to apply.
>
>
> > Paul Psokolovsky has realy done a great job with Opie in the oe.dev.
> >
> > gxl
> >
> > 2007/1/14, Koen Kooi <koen@dominion.kabel.utwente.nl>:
> > Holger Freyther schreef:
> >>>> Am 13.01.2007 um 23:39 schrieb Alban J Pearce:
> >>>>
> >>>>> I have installed Angstrom
> >>>>> bitbake , nano works
> >>>>>
> >>>>>  NOTE: build 200701132219: started
> >>>>>
> >>>>> OE Build Configuration:
> >>>>> BB_VERSION     = "1.6.2"
> >>>>> OE_REVISION    = "28548b0eda864e1b3a44136bcced77ee8c1e9dab"
> >>>>> TARGET_ARCH    = "arm"
> >>>>> TARGET_OS      = "linux-gnueabi"
> >>>>> MACHINE        = "spitz"
> >>>>> DISTRO         = "angstrom"
> >>>>> DISTRO_VERSION = "test-20070113"
> >>>>> TARGET_FPU     = "soft"
> >>>>>
> >>>>> But bitbake portsabase fails
> >>>>>
> >>>>> NOTE: Applying patch 'kernel-keymap.patch'
> >>>>> Command Error: exit status: 1  Output:
> >>>>> Applying patch kernel-keymap.patch
> >>>>> can't find file to patch at input line 10
> >>>>> Perhaps you used the wrong -p or --strip option?
> >>>>> The text leading up to this was:
> >>>>
> >>>> Hi,
> >>>>
> >>>> did you run out of disk space?
> > This again highlights why angstrom doesn't support Opie. It is broken.
> > Feel free to fix it.
> >
> >>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFFqgMWMkyGM64RGpERAvDtAJ4nJODf82sCHHhONrcq/G1BH85/gQCgiUOF
> HKgksyYb1LzvXSmz0NTqnvA=
> =z+H5
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


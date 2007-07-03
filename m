Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1I5lKA-00078a-Sh
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jul 2007 18:33:59 +0200
Received: by wa-out-1112.google.com with SMTP id l24so2812703waf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2007 09:28:57 -0700 (PDT)
Received: by 10.114.135.1 with SMTP id i1mr6306499wad.1183480137617;
	Tue, 03 Jul 2007 09:28:57 -0700 (PDT)
Received: by 10.114.144.2 with HTTP; Tue, 3 Jul 2007 09:28:57 -0700 (PDT)
Message-ID: <432beae0707030928n3f6c468ds8131f61f1db4076@mail.gmail.com>
Date: Tue, 3 Jul 2007 09:28:57 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1183219412.6678.1.camel@localhost.localdomain>
MIME-Version: 1.0
References: <E1I3xL2-0002Jv-8j@linuxtogo.org>
	<1183219412.6678.1.camel@localhost.localdomain>
Subject: Re: [oe-commits] org.oe.dev linux-rp-2.6.21: add sharpsl-rc patch
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
X-List-Received-Date: Tue, 03 Jul 2007 16:34:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 6/30/07, Matthias Hentges <oe@hentges.net> wrote:
> Am Donnerstag, den 28.06.2007, 18:59 +0200 schrieb justinp commit:
> > linux-rp-2.6.21: add sharpsl-rc patch
> >
> > Author: justinp@openembedded.org
> > Branch: org.openembedded.dev
> > Revision: c80492670adbda2d61a72a0c64c1a2a873d10b51
> > ViewMTN: http://monotone.openembedded.org/revision.psp?id=c80492670adbda2d61a72a0c64c1a2a873d10b51
> > Files:
> > 1
> > packages/linux/linux-rp_2.6.21.bb
> > Diffs:
> >
> > #
> > # mt diff -rd85165b6d72282ba94622c1c0d0c9c3e4a6be821 -rc80492670adbda2d61a72a0c64c1a2a873d10b51
> > #
> > #
> > #
> > # patch "packages/linux/linux-rp_2.6.21.bb"
> > #  from [791613c9350e496eb591d9d3114c81a1e6b2c20c]
> > #    to [0611fe14d6ba36f9557f2f7c5814c1be6fbd7f84]
> > #
> > ============================================================
> > --- packages/linux/linux-rp_2.6.21.bb 791613c9350e496eb591d9d3114c81a1e6b2c20c
> > +++ packages/linux/linux-rp_2.6.21.bb 0611fe14d6ba36f9557f2f7c5814c1be6fbd7f84
> > @@ -1,6 +1,6 @@ require linux-rp.inc
> >  require linux-rp.inc
> >
> > -PR = "r4"
> > +PR = "r5"
> >
> >  # Handy URLs
> >  # git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;protocol=git;tag=ef7d1b244fa6c94fb76d5f787b8629df64ea4046
> > @@ -51,6 +51,7 @@ SRC_URI = "http://www.kernel.org/pub/lin
> >             file://connectplus-remove-ide-HACK.patch;patch=1;status=hack \
> >             file://squashfs3.0-2.6.15.patch;patch=1;status=external \
> >             file://vesafb-tng-1.0-rc2-2.6.20-rc2.patch;patch=1;status=external \
> > +           file://sharpsl-rc-r1.patch;patch=1 \
> >             file://defconfig-c7x0 \
> >             file://defconfig-hx2000 \
> >             file://defconfig-collie \
> >
> >
> >
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>
> You forgot to attach the actual patch ;)

Oops, sorry about that.

-- 
Justin Patrin



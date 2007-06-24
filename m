Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1I2ZXk-00077I-7U
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jun 2007 23:22:48 +0200
Received: by an-out-0708.google.com with SMTP id b33so249221ana
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2007 14:18:39 -0700 (PDT)
Received: by 10.100.95.19 with SMTP id s19mr2814303anb.1182719919210;
	Sun, 24 Jun 2007 14:18:39 -0700 (PDT)
Received: by 10.100.38.3 with HTTP; Sun, 24 Jun 2007 14:18:39 -0700 (PDT)
Message-ID: <ae36f8040706241418o1ba75ba3m47321bcb6ad7cb2c@mail.gmail.com>
Date: Sun, 24 Jun 2007 18:18:39 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <467EBE20.80607@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <ae36f8040706240937k4702d082ja29d8513a5599301@mail.gmail.com>
	<467EA28B.6090502@dominion.kabel.utwente.nl>
	<ae36f8040706241034pc1f2ebdgb840d540c61c8668@mail.gmail.com>
	<467EBE20.80607@dominion.kabel.utwente.nl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: angstrom image
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
X-List-Received-Date: Sun, 24 Jun 2007 21:22:49 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

OK, dear Koen the problem is for me that are working with OMAP (ARM+DSP),
the latest version of UDEV is working fine with DSP devices autmatic
creation inside /dev, this is the major reason.

On 6/24/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
>
> > On 6/24/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> > Lu=EDs Cargnini schreef:
> >>>> please could the distro mantainers upgrade udev from udev-092-r18 to
> >>>> udev-112-r1 please is the version that  I are using on my hand-made
> >>>> filesystem for omap5912 and it work perfectly
> > What doesn't work in 092 that 112 fixes?
>
> Lu=EDs Cargnini schreef:
> > I hope it answer, bug fixes:
>
> Ok, let's ask it in a different way:
>
> What bugs do *you* experience in 092 that are fixed in 112? Between 092
> and 100 the udev
> developers added regressions, bugs and incompatibilities faster than we
> could patch[1] and
> we decided to stick to a known good 092, so you'd need to have _very_ goo=
d
> reasons to
> convince us to switch to 112.
>
> regards,
>
> Koen
>
> [1] Busybox is another example of such a 'lovely' piece of software
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGfr4gMkyGM64RGpERAtKuAKCWhw7swWo7Pg/GNMmo2bpa1PKz8ACfQ4Kv
> 4JPtoSTucWn8g8ypQTuteJc=3D
> =3D+rJn
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
---------------------------------------------------------------------------=
---
Thanks && Regards
Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
IEEE Member
Electrical Engineer Faculty @ PUCRS
Ipiranga Avenue, 6681 =96 Building 30
P.O. Box: 90619-900 =96 Porto Alegre/RS
Phone: +55 51 3320 3500  extension: 7696
---------------------------------------------------------------------------=
------


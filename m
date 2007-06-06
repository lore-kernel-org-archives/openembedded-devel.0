Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1Hvlp9-0005F7-69
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2007 05:04:42 +0200
Received: by wa-out-1112.google.com with SMTP id l24so9519waf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2007 20:02:19 -0700 (PDT)
Received: by 10.114.175.16 with SMTP id x16mr65347wae.1181098939298;
	Tue, 05 Jun 2007 20:02:19 -0700 (PDT)
Received: by 10.114.144.2 with HTTP; Tue, 5 Jun 2007 20:02:19 -0700 (PDT)
Message-ID: <432beae0706052002q6ea96a46p46743ec6ec1b1341@mail.gmail.com>
Date: Tue, 5 Jun 2007 20:02:19 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ae36f8040706011335u7cf556afo7d9a36890b7df2a@mail.gmail.com>
MIME-Version: 1.0
References: <465F3C8B.80200@dominion.kabel.utwente.nl>
	<ae36f8040705311923r4a9e871ewf4c5a6bf76adc9ab@mail.gmail.com>
	<432beae0705311951p68201aa4u542ad050cbe5b609@mail.gmail.com>
	<ae36f8040706011335u7cf556afo7d9a36890b7df2a@mail.gmail.com>
Subject: Re: Glibc 2.6 added, please test
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
X-List-Received-Date: Wed, 06 Jun 2007 03:05:00 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 6/1/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
> I should always perform, pull before update ?
>

Without a pull you have nothing to update to.

> On 5/31/07, Justin Patrin <papercrane@gmail.com> wrote:
> >
> > On 5/31/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
> > > I did an mtn update but glibc 2.6 is not appearing on my packages/gli=
bc
> > > directory
> >
> > Did you mtn pull first?
> >
> > >
> > > On 5/31/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> > > >
> > > > -----BEGIN PGP SIGNED MESSAGE-----
> > > > Hash: SHA1
> > > >
> > > > Hi,
> > > >
> > > > Glibc 2.6 has just been added to OE, please test it and report bugs=
.
> > > >
> > > > TIA,
> > > >
> > > > Koen
> > > > -----BEGIN PGP SIGNATURE-----
> > > > Version: GnuPG v1.4.5 (Darwin)
> > > >
> > > > iD8DBQFGXzyLMkyGM64RGpERAk8EAJ9vszt8ghLdUoVvRLarLWNM40TpUgCfToVG
> > > > QCCW9dQifUQvV8H8H+5VVR0=3D
> > > > =3D9U8f
> > > > -----END PGP SIGNATURE-----
> > > >
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
> > > >
> > >
> > >
> > >
> > > --
> > >
> > -----------------------------------------------------------------------=
-------
> > > Thanks && Regards
> > > Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> > > IEEE Member
> > > Electrical Engineer Faculty @ PUCRS
> > > Ipiranga Avenue, 6681 =96 Building 30
> > > P.O. Box: 90619-900 =96 Porto Alegre/RS
> > > Phone: +55 51 3320 3500  extension: 7696
> > >
> > -----------------------------------------------------------------------=
----------
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
> > >
> >
> >
> > --
> > Justin Patrin
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
>
> --
> -------------------------------------------------------------------------=
-----
> Thanks && Regards
> Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> IEEE Member
> Electrical Engineer Faculty @ PUCRS
> Ipiranga Avenue, 6681 =96 Building 30
> P.O. Box: 90619-900 =96 Porto Alegre/RS
> Phone: +55 51 3320 3500  extension: 7696
> -------------------------------------------------------------------------=
--------
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


--=20
Justin Patrin



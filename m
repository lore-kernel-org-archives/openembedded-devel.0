Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1HyBKZ-0001Nc-AT
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jun 2007 20:43:06 +0200
Received: by an-out-0708.google.com with SMTP id b33so445274ana
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2007 11:40:04 -0700 (PDT)
Received: by 10.100.242.11 with SMTP id p11mr4285796anh.1181673603679;
	Tue, 12 Jun 2007 11:40:03 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Tue, 12 Jun 2007 11:40:03 -0700 (PDT)
Message-ID: <ae36f8040706121140g454d7fbcicad049bedd41129@mail.gmail.com>
Date: Tue, 12 Jun 2007 15:40:03 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ae36f8040706121106ve4d81fv5064afee90650da4@mail.gmail.com>
MIME-Version: 1.0
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>
	<ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<ae36f8040706061036i3662ee38x104bb1896550b64@mail.gmail.com>
	<ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>
	<ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
	<ae36f8040706120817w7f643176k722d3477bdaaa2e4@mail.gmail.com>
	<466EBA7A.9030606@dominion.kabel.utwente.nl>
	<ae36f8040706120934g447146b8l633358481c62dfb1@mail.gmail.com>
	<466ECDC8.4090909@dominion.kabel.utwente.nl>
	<ae36f8040706121106ve4d81fv5064afee90650da4@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: problems doing bitbake task-base
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
X-List-Received-Date: Tue, 12 Jun 2007 18:43:14 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

excuse me by the last 2 e-mails,
forget it is bitbake -c clean qemu-native
now I am doing an rm -rf and then will does all the task-base from zero
again and see what happens

On 6/12/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
>
>  how to make a clean using bitbake ?
>
> On 6/12/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> >
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Lu=EDs Cargnini schreef:
> > > ok first I use gentoo, so the command is emerge "=3D gcc-3.4.6" =3D)
> > >
> > > I already did it so I have gcc-3 installed on my system and now ?
> >
> > ln /usr/bin/gcc-3.4.6 /usr/bin/gcc-3.4 -s
> >
> > regards,
> >
> > Koen
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> >
> > iD8DBQFGbs3HMkyGM64RGpERAlUrAKCeN5N2E75ZE3yHM22uCYbJYjNXtgCgjsJS
> > b9puiA4q35quPrE+qCcuKhw=3D
> > =3D2Y4n
> > -----END PGP SIGNATURE-----
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
>
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
>
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


Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1HvyYB-0000Ft-Kw
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2007 18:40:00 +0200
Received: by an-out-0708.google.com with SMTP id b33so45048ana
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2007 09:37:37 -0700 (PDT)
Received: by 10.100.57.14 with SMTP id f14mr399796ana.1181147857320;
	Wed, 06 Jun 2007 09:37:37 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Wed, 6 Jun 2007 09:37:37 -0700 (PDT)
Message-ID: <ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
Date: Wed, 6 Jun 2007 13:37:37 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4666576A.9030608@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>
	<46641153.2050207@dominion.kabel.utwente.nl>
	<ae36f8040706051004j24debcd0g397143693f2f1285@mail.gmail.com>
	<ae36f8040706051136h36f72d93wd6c4df2845018c8a@mail.gmail.com>
	<7C28F02B-B392-4557-9E7A-2991BE0E1BF3@gmx.net>
	<ae36f8040706051251g22ae2a09ha560b3c8b6d0de57@mail.gmail.com>
	<4665CF19.2030501@dominion.kabel.utwente.nl>
	<ae36f8040706051806q120be1bdyae9da9c8f754ab59@mail.gmail.com>
	<4666520C.8060000@dominion.kabel.utwente.nl>
	<4666576A.9030608@dominion.kabel.utwente.nl>
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
X-List-Received-Date: Wed, 06 Jun 2007 16:40:00 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

thank you all for all the help, but first are everybody completely sure tha=
t
I should remove this ines from my conf file ?????
If yes, why I can remove ?

On 6/6/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Koen Kooi schreef:
> > Lu=EDs Cargnini schreef:
> >> so just to make it fast before I could upload everything to some serve=
r
> here
> >> follow my local.conf:
> >
> >
> >> TARGET_ARCH =3D "arm"
> >> TARGET_OS =3D "linux"
> >
> > Remove those
> >
> >> DISTRO =3D "angstrom-2007.1"
>
> That one is ok as well
>
> >
> >> GLIBC_GENERATE_LOCALES =3D "en en_GB.UTF-8 fr pt_BR.UTF-8"
> >> INHERIT =3D "package_tar"
> >
> > remove those
> >
> >> IMAGE_FSTYPES =3D "jffs2 tar cramfs"
> >
> > that one is ok
> >
> >> BBDEBUG =3D "yes
> >> BBINCLUDELOGS =3D "yes"
> >
> > and remove those as well
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGZldqMkyGM64RGpERAv+NAKCDQjW7q7ickqaTwJdZD5DQhZEAtACgrx8p
> Gez+xEq2RxWhnkZcrw97Ook=3D
> =3Dz96W
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


Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1HvbNn-0003Yy-Sw
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2007 17:55:44 +0200
Received: by an-out-0708.google.com with SMTP id b33so385680ana
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2007 08:53:27 -0700 (PDT)
Received: by 10.100.206.11 with SMTP id d11mr3333077ang.1181058803222;
	Tue, 05 Jun 2007 08:53:23 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Tue, 5 Jun 2007 08:53:23 -0700 (PDT)
Message-ID: <ae36f8040706050853y637e41acj50c22400c7a2029a@mail.gmail.com>
Date: Tue, 5 Jun 2007 12:53:23 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4664154E.5000302@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <ae36f8040706040616y6de8ab01hb8699de1fbd239b2@mail.gmail.com>
	<4664154E.5000302@dominion.kabel.utwente.nl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: target os of angstrom
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
X-List-Received-Date: Tue, 05 Jun 2007 15:55:49 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

so eabi is the embedded abpplication binary interface ?

On 6/4/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Lu=EDs Cargnini schreef:
> > please how to set the angstrom distro not to
> > TARGET_OS      =3D "linux-gnueabi"
> >
> > but to
> > TARGET_OS      =3D "linux-gnu"
> >
> > according to distro this is set to eabi (big-endian) and i need
> > little-endian
>
> Wrong. arm-angstrom-linux-gnueabi is little-endian,
> armeb-angstrom-linux-gnueabi
> bigendian. Note how 'eabi' has nothing to do with endiannes
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGZBVOMkyGM64RGpERArU/AJ9e09YEV3/MGra5HtCLzJWqRYhfhACfaUfU
> G0kj4pg1KPgjT+BCzFulAZc=3D
> =3DOGGK
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


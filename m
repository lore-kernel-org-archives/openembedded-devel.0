Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5PBk-0005VO-1T
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 23:13:56 +0200
Received: by bwz5 with SMTP id 5so2194751bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 14:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=lAdltloVSbCSksG7mTOBmelL+v+C/XJylSdqB1xowEI=;
	b=eU9GBmjnDzqxhR1yQ7dVknknm0wy4LrZ+OOPKTWVlFNPTcsmMF2bJTYxzN93TgMup1
	4XUkj9eBPH7UG1o3kGErxVfFYf2MyQv5vAf4OTO4EHG7eqaXLnEsvh89Oxd7CoAW5QJ8
	ymxPdilluuCQPXqw9UJke0DrbmnbDCTv4itwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=mHFFQFJvxm0X7PFmyAWTxz+Zuq++6HH1pJf59tXkZhRj14BoNvLd3ehm0mQRKFDOtD
	W/RvPANB993OQDMqEnAyXLuVawjJ/YkioJR3P+ajiA4R5ravI+PVP4F3ia/Y9H82UCN6
	oWxzAv6c7fQLa9sidNkoD3rMlV7BiHrLW+RUI=
Received: by 10.204.84.137 with SMTP id j9mr2842941bkl.120.1301605912626;
	Thu, 31 Mar 2011 14:11:52 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v21sm988080bkt.23.2011.03.31.14.11.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 14:11:51 -0700 (PDT)
Date: Thu, 31 Mar 2011 23:11:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20110331211144.GI3745@jama.jama.net>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
	<dff2afec47fd746f45b9f630bf14755f40a8fdc5.1301560589.git.Martin.Jansa@gmail.com>
	<AANLkTikvnKY+hdT9ck4TpG9vvTR9MHKvLxgjRGHjKY2R@mail.gmail.com>
	<20110331205342.GH3745@jama.jama.net>
	<AANLkTi=T+7_bep7Hy3MfSgQNAWXjyo49wUut+S8iN-qn@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=T+7_bep7Hy3MfSgQNAWXjyo49wUut+S8iN-qn@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/8] illume-keyboards-shr: add LICENSE
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
X-List-Received-Date: Thu, 31 Mar 2011 21:13:56 -0000
X-Groupsio-MsgNum: 30812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cVp8NMj01v+Em8Se"
Content-Disposition: inline

--cVp8NMj01v+Em8Se
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2011 at 02:03:23PM -0700, Khem Raj wrote:
> On Thu, Mar 31, 2011 at 1:53 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Mar 31, 2011 at 01:40:38PM -0700, Khem Raj wrote:
> >> On Thu, Mar 31, 2011 at 2:14 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>
> >> I hope you made sure that all license files in a package source are ch=
ecksummed.
> >
> > I've added LICENSE file only in case that package sources doesn't have
> > any licensing information (simple scripts without header etc) like in
> > this case
> > http://git.shr-project.org/git/?p=3Dillume-keyboards.git;a=3Dtree
> >
> > For all e-wm/efl/illume related recipes we have mostly in meta-shr I've
> > used LICENSE file from enlightenment repo, because our versions usually
> > just modifies original versions a bit so for me as not-a-lawyer-at-all
> > it makes sense to use same LICENSE.
>=20
>=20
> thats fine as long as we dont miss any new licenses. You can also chop of
> portions of source files with startline and endline in checksumming licen=
ses
> if there is no explicit LICENSE file

I know and I've used this in couple of recipes already, but there=20
sometimes there really is nothing..

> > Cheers,
> >
> >> whole series is ok where I had question I replied to individual patch
> >>
> >> Acked-by: Khem Raj <raj.khem@gmail.com>
> >>
> >> > ---
> >> > =A0.../recipes-efl/e17/illume-keyboards-shr/LICENSE =A0 | =A0 25 +++=
+++++++++++++++++
> >> > =A0.../recipes-efl/e17/illume-keyboards-shr_git.bb =A0 =A0| =A0 =A07=
 +++--
> >> > =A02 files changed, 29 insertions(+), 3 deletions(-)
> >> > =A0create mode 100644 meta-efl/recipes-efl/e17/illume-keyboards-shr/=
LICENSE
> >> >
> >> > diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE b=
/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
> >> > new file mode 100644
> >> > index 0000000..61bb2f6
> >> > --- /dev/null
> >> > +++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
> >> > @@ -0,0 +1,25 @@
> >> > +Copyright notice for Enlightenment:
> >> > +
> >> > +Copyright (C) 2000-2010 Carsten Haitzler and various contributors (=
see AUTHORS)
> >> > +
> >> > +All rights reserved.
> >> > +
> >> > +Redistribution and use in source and binary forms, with or without
> >> > +modification, are permitted provided that the following conditions =
are met:
> >> > +
> >> > + =A0 1. Redistributions of source code must retain the above copyri=
ght
> >> > + =A0 =A0 =A0notice, this list of conditions and the following discl=
aimer.
> >> > + =A0 2. Redistributions in binary form must reproduce the above cop=
yright
> >> > + =A0 =A0 =A0notice, this list of conditions and the following discl=
aimer in the
> >> > + =A0 =A0 =A0documentation and/or other materials provided with the =
distribution.
> >> > +
> >> > +THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRAN=
TIES,
> >> > +INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTAB=
ILITY AND
> >> > +FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL =
THE
> >> > +COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> >> > +INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING=
, BUT NOT
> >> > +LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF US=
E, DATA,
> >> > +OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THE=
ORY OF
> >> > +LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> >> > +NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS =
SOFTWARE,
> >> > +EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> >> > diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb b/=
meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
> >> > index fe34513..e3b182d 100644
> >> > --- a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
> >> > +++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
> >> > @@ -1,15 +1,16 @@
> >> > =A0SECTION =3D "x11/data"
> >> >
> >> > =A0SRC_URI =3D "git://git.shr-project.org/repo/illume-keyboards.git;=
protocol=3Dhttp;branch=3Dmaster \
> >> > - =A0 =A0 =A0 =A0 =A0 file://0001-Makefile-update-KEYBOARDS_DIR-for-=
new-illume2.patch"
> >> > + =A0 =A0 =A0 =A0 =A0 file://0001-Makefile-update-KEYBOARDS_DIR-for-=
new-illume2.patch \
> >> > + =A0 =A0 =A0 =A0 =A0file://LICENSE"
> >> > =A0S =3D "${WORKDIR}/git"
> >> >
> >> > =A0SRCREV =3D "4064489f359a1addf572089b582f317dff5f50e1"
> >> > =A0PV =3D "0.0+gitr${SRCPV}"
> >> > =A0PE =3D "1"
> >> > =A0PR =3D "r4"
> >> > -LICENSE =3D "unknown"
> >> > -
> >> > +LICENSE =3D "MIT BSD"
> >> > +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE;md5=3Df523ab5986cc7=
9b52a90d2ac3d5454a2"
> >> >
> >> > =A0PACKAGES =3D "\
> >> > =A0illume-keyboard-alpha \
> >> > --
> >> > 1.7.4.1
> >> >
> >> >
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
> >> >
> >
> > --
> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cVp8NMj01v+Em8Se
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2U7hAACgkQN1Ujt2V2gBwJWQCgq3mcsLyrYC0TZC7Ok7IvIK/N
GxsAnjx1VhzZjh+EgeMunvq4kO3HAct2
=Nu+f
-----END PGP SIGNATURE-----

--cVp8NMj01v+Em8Se--

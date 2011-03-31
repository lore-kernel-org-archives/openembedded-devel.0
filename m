Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5PKK-0006Fj-Nn
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 23:22:48 +0200
Received: by bwz5 with SMTP id 5so2199962bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=StDE/RVoDfpJRFHxzgvxVktGkKfAg3O2GTMnZ0ZTHJo=;
	b=gV2jCLlx4Q8cto6lFw5BuVrlUBCqN64clvHJ+VzsjSosF9uclUJmkw8X4tUp9Ls2oQ
	EAfhunZxRsp68zmF81fQbNQ2TnNwQCX84WJS13jlR9HN8vdoAscTQYqcsBj1+t6hYgNL
	/lbnSVgQIMbEGEpljhhL3e3lpLMUTsnQsbmy8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=eT2l/a+ciTvjHlKZ/aNtrl+nov/jw89YKCkGul9fZpRH00Dw1f7wxtQkimPYQxMYlu
	5HaeycIv8JMdyFta7aDTme+6F61Uw/m1yvC3cr4tb1+hFEFqpr1VJW2rRHXdWRUrYmXu
	E+M0PkAZwGt7HVscY89omypj8P9chM7c0X/q8=
Received: by 10.204.172.129 with SMTP id l1mr2813517bkz.99.1301606447203;
	Thu, 31 Mar 2011 14:20:47 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b6sm990588bkb.22.2011.03.31.14.20.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 14:20:44 -0700 (PDT)
Date: Thu, 31 Mar 2011 23:20:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20110331212042.GJ3745@jama.jama.net>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
	<dff2afec47fd746f45b9f630bf14755f40a8fdc5.1301560589.git.Martin.Jansa@gmail.com>
	<AANLkTikvnKY+hdT9ck4TpG9vvTR9MHKvLxgjRGHjKY2R@mail.gmail.com>
	<20110331205342.GH3745@jama.jama.net>
	<AANLkTi=T+7_bep7Hy3MfSgQNAWXjyo49wUut+S8iN-qn@mail.gmail.com>
	<20110331211144.GI3745@jama.jama.net>
	<AANLkTi=hbfe5cqqjEO0LuNc9H3tsmb3c885UgGVRBYwp@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=hbfe5cqqjEO0LuNc9H3tsmb3c885UgGVRBYwp@mail.gmail.com>
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
X-List-Received-Date: Thu, 31 Mar 2011 21:22:48 -0000
X-Groupsio-MsgNum: 30815
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xssso5lpTBgMxDfe"
Content-Disposition: inline

--Xssso5lpTBgMxDfe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2011 at 02:13:27PM -0700, Khem Raj wrote:
> On Thu, Mar 31, 2011 at 2:11 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Mar 31, 2011 at 02:03:23PM -0700, Khem Raj wrote:
> >> On Thu, Mar 31, 2011 at 1:53 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > On Thu, Mar 31, 2011 at 01:40:38PM -0700, Khem Raj wrote:
> >> >> On Thu, Mar 31, 2011 at 2:14 AM, Martin Jansa <martin.jansa@gmail.c=
om> wrote:
> >> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> >>
> >> >> I hope you made sure that all license files in a package source are=
 checksummed.
> >> >
> >> > I've added LICENSE file only in case that package sources doesn't ha=
ve
> >> > any licensing information (simple scripts without header etc) like in
> >> > this case
> >> > http://git.shr-project.org/git/?p=3Dillume-keyboards.git;a=3Dtree
> >> >
> >> > For all e-wm/efl/illume related recipes we have mostly in meta-shr I=
've
> >> > used LICENSE file from enlightenment repo, because our versions usua=
lly
> >> > just modifies original versions a bit so for me as not-a-lawyer-at-a=
ll
> >> > it makes sense to use same LICENSE.
> >>
> >>
> >> thats fine as long as we dont miss any new licenses. You can also chop=
 of
> >> portions of source files with startline and endline in checksumming li=
censes
> >> if there is no explicit LICENSE file
> >
> > I know and I've used this in couple of recipes already, but there
> > sometimes there really is nothing..
>=20
> if there is nothing then let it be so I would think and state no license

that's why I had and still have in few recipes
LICENSE =3D "unknown"
without it I cannot even parse recipes

but
package_qa_check_license() in insane.bbclass does not allow empty
LIC_FILES_CHKSUM so I had to resolve it somehow

In most shr cases I can just push LICENSE file to upstream repo and bump
SRCREV if latest rev is OK.. but adding LICENSE file to OE was just
faster and easier for me.

Cheers,

>=20
> >
> >> > Cheers,
> >> >
> >> >> whole series is ok where I had question I replied to individual pat=
ch
> >> >>
> >> >> Acked-by: Khem Raj <raj.khem@gmail.com>
> >> >>
> >> >> > ---
> >> >> > =A0.../recipes-efl/e17/illume-keyboards-shr/LICENSE =A0 | =A0 25 =
++++++++++++++++++++
> >> >> > =A0.../recipes-efl/e17/illume-keyboards-shr_git.bb =A0 =A0| =A0 =
=A07 +++--
> >> >> > =A02 files changed, 29 insertions(+), 3 deletions(-)
> >> >> > =A0create mode 100644 meta-efl/recipes-efl/e17/illume-keyboards-s=
hr/LICENSE
> >> >> >
> >> >> > diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENS=
E b/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
> >> >> > new file mode 100644
> >> >> > index 0000000..61bb2f6
> >> >> > --- /dev/null
> >> >> > +++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
> >> >> > @@ -0,0 +1,25 @@
> >> >> > +Copyright notice for Enlightenment:
> >> >> > +
> >> >> > +Copyright (C) 2000-2010 Carsten Haitzler and various contributor=
s (see AUTHORS)
> >> >> > +
> >> >> > +All rights reserved.
> >> >> > +
> >> >> > +Redistribution and use in source and binary forms, with or witho=
ut
> >> >> > +modification, are permitted provided that the following conditio=
ns are met:
> >> >> > +
> >> >> > + =A0 1. Redistributions of source code must retain the above cop=
yright
> >> >> > + =A0 =A0 =A0notice, this list of conditions and the following di=
sclaimer.
> >> >> > + =A0 2. Redistributions in binary form must reproduce the above =
copyright
> >> >> > + =A0 =A0 =A0notice, this list of conditions and the following di=
sclaimer in the
> >> >> > + =A0 =A0 =A0documentation and/or other materials provided with t=
he distribution.
> >> >> > +
> >> >> > +THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WAR=
RANTIES,
> >> >> > +INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHAN=
TABILITY AND
> >> >> > +FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHA=
LL THE
> >> >> > +COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIR=
ECT,
> >> >> > +INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUD=
ING, BUT NOT
> >> >> > +LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF=
 USE, DATA,
> >> >> > +OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY =
THEORY OF
> >> >> > +LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLU=
DING
> >> >> > +NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF TH=
IS SOFTWARE,
> >> >> > +EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> >> >> > diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb=
 b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
> >> >> > index fe34513..e3b182d 100644
> >> >> > --- a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
> >> >> > +++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
> >> >> > @@ -1,15 +1,16 @@
> >> >> > =A0SECTION =3D "x11/data"
> >> >> >
> >> >> > =A0SRC_URI =3D "git://git.shr-project.org/repo/illume-keyboards.g=
it;protocol=3Dhttp;branch=3Dmaster \
> >> >> > - =A0 =A0 =A0 =A0 =A0 file://0001-Makefile-update-KEYBOARDS_DIR-f=
or-new-illume2.patch"
> >> >> > + =A0 =A0 =A0 =A0 =A0 file://0001-Makefile-update-KEYBOARDS_DIR-f=
or-new-illume2.patch \
> >> >> > + =A0 =A0 =A0 =A0 =A0file://LICENSE"
> >> >> > =A0S =3D "${WORKDIR}/git"
> >> >> >
> >> >> > =A0SRCREV =3D "4064489f359a1addf572089b582f317dff5f50e1"
> >> >> > =A0PV =3D "0.0+gitr${SRCPV}"
> >> >> > =A0PE =3D "1"
> >> >> > =A0PR =3D "r4"
> >> >> > -LICENSE =3D "unknown"
> >> >> > -
> >> >> > +LICENSE =3D "MIT BSD"
> >> >> > +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE;md5=3Df523ab5986=
cc79b52a90d2ac3d5454a2"
> >> >> >
> >> >> > =A0PACKAGES =3D "\
> >> >> > =A0illume-keyboard-alpha \
> >> >> > --
> >> >> > 1.7.4.1
> >> >> >
> >> >> >
> >> >> > _______________________________________________
> >> >> > Openembedded-devel mailing list
> >> >> > Openembedded-devel@lists.openembedded.org
> >> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> >> >> >
> >> >
> >> > --
> >> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> >> >
> >
> > --
> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Xssso5lpTBgMxDfe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2U8CoACgkQN1Ujt2V2gBxo7gCgjHKSfwxkNYcO4XuZ3zwGbktu
aaYAnRO+JCdzW49FZ1vxCdnwSywMvTPZ
=1n4a
-----END PGP SIGNATURE-----

--Xssso5lpTBgMxDfe--

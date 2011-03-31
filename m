Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5OpD-0000GY-SK
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:50:45 +0200
Received: by bwz5 with SMTP id 5so2179405bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=wDTPyIfTEvY7dSDIh17TomEWAErFNvvQ7NFBo9L9EGI=;
	b=FNmGGz/1fwQCV/tQY7QkZG2bH2ipbFA+fWTvayKUgjJGxbZDycfOLcw3c/C4dNflE1
	CnSHfAKr6jh+CGonjI0I0zX0XSiFM8iBO1W7URRdooif0Dd994Ozf+A5kIT3ILe45r+u
	CbrUNapkwoKcA2LEu5/hVb5D/DeNbUCUxnJOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=BH0u0WngYvAW5e0F2C7YorLcTYeQWLFE39omY7fdFYViVT0pg0uJMvujHoMIhzeI5g
	81r5/iVum1wG0BN9iXbMc3uIwAv7p2LnjmJbvwhObtUoajEPAhWr5PRHz4NCuqDaVUt1
	VWjqcbMg7n9LP28Mb895DE2B38tvJF4R0LKQI=
Received: by 10.204.46.34 with SMTP id h34mr2932557bkf.19.1301604481914;
	Thu, 31 Mar 2011 13:48:01 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm979895bkm.18.2011.03.31.13.48.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 13:48:00 -0700 (PDT)
Date: Thu, 31 Mar 2011 22:47:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20110331204758.GG3745@jama.jama.net>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
	<8d76bc22e6b97944d4af16b2d9a6e318200d857b.1301560589.git.Martin.Jansa@gmail.com>
	<AANLkTimZoMAuYXF4BruMZyZVU8T_M-AcaJ8S2BWZVmtW@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimZoMAuYXF4BruMZyZVU8T_M-AcaJ8S2BWZVmtW@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 7/8] task-x11-illume: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Mar 2011 20:51:01 -0000
X-Groupsio-MsgNum: 30805
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Content-Disposition: inline

--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2011 at 01:39:03PM -0700, Khem Raj wrote:
> On Thu, Mar 31, 2011 at 3:17 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > =A0meta-efl/recipes-efl/tasks/task-x11-illume.bb | =A0 =A01 +
> > =A01 files changed, 1 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta-efl/recipes-efl/tasks/task-x11-illume.bb b/meta-efl/r=
ecipes-efl/tasks/task-x11-illume.bb
> > index 8b14adb..e197cc7 100644
> > --- a/meta-efl/recipes-efl/tasks/task-x11-illume.bb
> > +++ b/meta-efl/recipes-efl/tasks/task-x11-illume.bb
> > @@ -1,6 +1,7 @@
> > =A0DESCRIPTION =3D "The Illume Windowing Environment -- install this ta=
sk to get the Enlightenment Window Manager + the Illume environment."
> > =A0SECTION =3D "x11/wm"
> > =A0LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://${TOPDIR}/meta-openembedded/meta-efl/COPY=
ING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420"
>=20
> why not copy the license file to workdir first

you mean introduce SRC_URI for task-* recipes?

I don't really like hardcoding meta-openembedded path here, so maybe we can=
 introduce=20
METAOEBASE for this, like oe-core does with POKYBASE in LIC_FILES_CHKSUMs

bitbake@jama ~/shr-core/openembedded-core/meta/recipes-core/tasks $ git gre=
p LIC_FILES_CHKSUM
task-base.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D3f40d79=
94397109285ec7b81fdeb3b58 \
task-cross-canadian.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=
=3D3f40d7994397109285ec7b81fdeb3b58 \
task-poky-boot.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D3f=
40d7994397109285ec7b81fdeb3b58 \
task-poky-nfs.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D3f4=
0d7994397109285ec7b81fdeb3b58 \
task-poky-sdk.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D3f4=
0d7994397109285ec7b81fdeb3b58 \
task-poky-ssh-dropbear.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;=
md5=3D3f40d7994397109285ec7b81fdeb3b58 \
task-poky-ssh-openssh.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;m=
d5=3D3f40d7994397109285ec7b81fdeb3b58 \
task-poky-standalone-sdk-target.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}=
/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
task-poky-tools.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D3=
f40d7994397109285ec7b81fdeb3b58 \
task-sdk-host.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D3f4=
0d7994397109285ec7b81fdeb3b58 \

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2U6H4ACgkQN1Ujt2V2gByRzACZAR9TjTH9QdRUtitYRV9Xj8YW
L9YAnjoSqr6+8X2oiYnOIVVXQUquCqEd
=MFJJ
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--

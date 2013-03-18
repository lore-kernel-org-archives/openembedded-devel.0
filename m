Received: from mail-qe0-f51.google.com ([209.85.128.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UHXRk-0005Fj-2w
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 11:37:41 +0100
Received: by mail-qe0-f51.google.com with SMTP id nd7so3183706qeb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2013 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JwPZKDasB15/WdaECxAiqxTAYY4mPQmI6wQyZjR83kE=;
	b=r60ahiEMKW6ozbTRSH5GabKFp4ch/wWs6ZpIBKos5M/9TxdzBGo8MLN7olkONkaGD8
	nmhx/hX2vNgESeXE1DUXYDwmwuXGVr7INP2y6+eSjvKjaYAhZVkn/wOvtUMxGC8PvHOj
	GLaVksL/XoPAmQZhmWidcjTJk7iwrGjGHzBJI7kw18PFktYxSgK4ZrEpu7CBGkh/8RVu
	T7j5+zCxyunWN3qBrirPaRY9shKW/Ozz25PuYFgGULnzk23ZL8GpvvcXAh5fa4H2WFht
	r6ulDAMYMz+wPPH5kY3IaJbzpXymH4WcnRLesKXv0xpwBsCM/8Wexyls0wFiDrV5qQ0i
	KFIg==
X-Received: by 10.49.24.110 with SMTP id t14mr21055653qef.48.1363602050975;
	Mon, 18 Mar 2013 03:20:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id g6sm33851050qav.6.2013.03.18.03.20.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 03:20:50 -0700 (PDT)
Date: Mon, 18 Mar 2013 11:20:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130318102043.GA3195@jama>
References: <1363146643-30820-1-git-send-email-b28495@freescale.com>
	<20130313162013.GM3260@jama>
	<AF604684617F454390621992F367F169012C4AD0@039-SN2MPN1-022.039d.mgd.msft.net>
	<CA+chaQeC26Any2ZHPuct90Ta8PxgYsijGT7gMDjCL0UhOK2qBA@mail.gmail.com>
	<AF604684617F454390621992F367F169012C5F81@039-SN2MPN1-022.039d.mgd.msft.net>
MIME-Version: 1.0
In-Reply-To: <AF604684617F454390621992F367F169012C5F81@039-SN2MPN1-022.039d.mgd.msft.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] tclap: initial add 1.2.1
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
X-List-Received-Date: Mon, 18 Mar 2013 10:37:41 -0000
X-Groupsio-MsgNum: 43578
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2013 at 10:08:25AM +0000, Liu Ting-B28495 wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Martin Jansa
> > Sent: Thursday, March 14, 2013 2:40 PM
> > To: openembedded-devel
> > Subject: Re: [oe] [meta-oe][PATCH] tclap: initial add 1.2.1
> >=20
> > If it generates doc/html on your host, then it's probably autodetecting
> > some doc generating tool from host which isn't on my. It would be better
> > to disable docs completely (I'll let you know if it builds and doc is
> > empty).
> >=20
>=20
> Any update?

I don't know, do you know why it builds docs on your host?

> > On Thu, Mar 14, 2013 at 3:38 AM, Liu Ting-B28495
> > <B28495@freescale.com>wrote:
> >=20
> > > > -----Original Message-----
> > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > > > Of Martin Jansa
> > > > Sent: Thursday, March 14, 2013 12:20 AM
> > > > To: openembedded-devel@lists.openembedded.org
> > > > Subject: Re: [oe] [meta-oe][PATCH] tclap: initial add 1.2.1
> > > >
> > > > On Wed, Mar 13, 2013 at 11:50:43AM +0800, b28495@freescale.com wrot=
e:
> > > > > From: Ting Liu <b28495@freescale.com>
> > > > >
> > > > > TCLAP (Templatized C++ Command Line Parser Library ) is a small,
> > > > > flexible library that provides a simple interface for defining and
> > > > > accessing command line arguments. Templatized C++ Command Line
> > > > > Parser Library.
> > > > >
> > > > > Use the commit of tag tclap-1-2-1-release-final.
> > > > >
> > > >
> > > > fails in do_install:
> > > >
> > > > | /bin/mkdir -p
> > > > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5t
> > > > | e-oe -linux-gnueabi/tclap/1.2.1-r0/image/usr/share/doc/tclap
> > > > | cp -R
> > > > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5t
> > > > | e-oe -linux-gnueabi/tclap/1.2.1-r0/git/docs/html
> > > > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5t
> > > > | e-oe -linux-gnueabi/tclap/1.2.1-r0/image/usr/share/doc/tclap
> > > > |  /bin/mkdir -p '/home/jenkins/oe/shr-core-branches/shr-core/tmp-
> > > > eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-
> > > > r0/image/usr/share/doc/tclap'
> > > > | cp: cannot stat
> > > > | `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5
> > > > | te-o
> > > > | e-linux-gnueabi/tclap/1.2.1-r0/git/docs/html': No such file or
> > > > | directory
> > > > | make[2]: *** [install-data-local] Error 1
> > > > | make[2]: *** Waiting for unfinished jobs....
> > > > |  /usr/bin/install -c -m 644 index.html manual.html style.css
> > > > '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te
> > > > -oe- linux-gnueabi/tclap/1.2.1-r0/image/usr/share/doc/tclap'
> > > > | make[2]: Leaving directory
> > > > | `/home/jenkins/oe/shr-core-branches/shr-
> > > > core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-
> > r0/git/docs'
> > > > | make[1]: *** [install-am] Error 2
> > > > | make[1]: Leaving directory
> > > > | `/home/jenkins/oe/shr-core-branches/shr-
> > > > core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-
> > r0/git/docs'
> > > > | make: *** [install-recursive] Error 1
> > > > | ERROR: oe_runmake failed
> > > > | ERROR: Function failed: do_install (see
> > > > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5t
> > > > | e-oe
> > > > | -linux-gnueabi/tclap/1.2.1-r0/temp/log.do_install.29945 for
> > > > | further
> > > > | information)
> > > > NOTE: recipe tclap-1.2.1-r0: task do_install: Failed
> > > >
> > > > Whole log in:
> > > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-
> > > > branches/log.world.20130313_114357.log/
> > > >
> > >
> > > I did tests before sending the patch :-( Patch v3 has been sent.
> > > Please review. Thanks.
> > >
> > > -Ting
> > >
> > > > > Signed-off-by: Ting Liu <b28495@freescale.com>
> > > > > ---
> > > > >  meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb |   13 +++++++++++=
++
> > > > >  1 files changed, 13 insertions(+), 0 deletions(-)  create mode
> > > > > 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > > > >
> > > > > diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > > > > b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > > > > new file mode 100644
> > > > > index 0000000..c2b03a4
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > > > > @@ -0,0 +1,13 @@
> > > > > +DESCRIPTION =3D "Templatized C++ Command Line Parser"
> > > > > +HOMEPAGE =3D "http://tclap.sourceforge.net/"
> > > > > +SECTION =3D "tclap"
> > > > > +LICENSE =3D "MIT"
> > > > > +LIC_FILES_CHKSUM =3D
> > > > "file://COPYING;md5=3Dc8ab0ff134bcc584d0e6b5b9f8732453"
> > > > > +
> > > > > +SRCREV =3D "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
> > > > > +SRC_URI =3D "git://tclap.git.sourceforge.net/gitroot/tclap/tclap"
> > > > > +
> > > > > +S =3D "${WORKDIR}/git"
> > > > > +inherit autotools
> > > > > +
> > > > > +BBCLASSEXTEND =3D "native nativesdk"
> > > > > --
> > > > > 1.7.3.4
> > > > >
> > > > >
> > > > >
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-d
> > > > > evel
> > > >
> > > > --
> > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFG6nsACgkQN1Ujt2V2gBxS/QCfUpB80/ZGEIju4x7DJeUOco22
Kr0An1RtccnzNQbpeTczOaHkOgG+z+uE
=QoDp
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--

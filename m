Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBLYu-0004cM-8W
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 08:38:56 +0100
Received: by wibhm17 with SMTP id hm17so2331365wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 00:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Uej5CWdD2xt3e3TTvGqSOv/cRdNQw3hmjSz0QO+QTbA=;
	b=uNNWD5Tory7mXvM4PBaJXyK3K3ffinZ/XjLBn3g+nZGtsVnLAAc2pUTAD+CXcsROnU
	aiftBEnk4vqp96n1eVjl+1/6KB1sIcxQQABiJofPn06kinh8m8RT/i1c0VKAAb+jdTyq
	gzTkCNGi27rDO6kPkw0Ttfp8U4fxBtcXQ7oXeqoMpHenTVSdgaqk40Sm02625czuBX8B
	1nP/kQ/5xIVYGL+XswFU730VhTQou/nUv5MBeUjqyI3ekDydGna93qMZtekmzLJfe4jc
	slJ1/v+bBZ+15x0xeP8XGshhH4YZV3SPy1FImjDC7R4Tw9T5cSMJg84kawbo3ztYn5iQ
	oe9g==
Received: by 10.180.95.34 with SMTP id dh2mr3147605wib.15.1332574199218;
	Sat, 24 Mar 2012 00:29:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gp8sm20327606wib.5.2012.03.24.00.29.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 00:29:58 -0700 (PDT)
Date: Sat, 24 Mar 2012 08:30:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120324073000.GG4604@jama.jama.net>
References: <cover.1332485253.git.Martin.Jansa@gmail.com>
	<CAAQYJAu2DTKS=RTXJNjQHiUwn+JUiTT-+EsxF+P2Kro8hXt3eg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAu2DTKS=RTXJNjQHiUwn+JUiTT-+EsxF+P2Kro8hXt3eg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 0/3] kernel.bbclass update
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
X-List-Received-Date: Sat, 24 Mar 2012 07:38:56 -0000
X-Groupsio-MsgNum: 37973
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8S1fMsFYqgBC+BN/"
Content-Disposition: inline

--8S1fMsFYqgBC+BN/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 01:16:07PM +0100, Andrea Adami wrote:
> On Fri, Mar 23, 2012 at 7:48 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > The following changes since commit 986de01251408605161e0f8343866a0e7ffe=
7910:
> >
> > =A0qmake2: remove (2012-03-21 13:50:44 +0100)
> >
> > are available in the git repository at:
> > =A0git://git.openembedded.org/meta-openembedded-contrib jansa/kernel
> > =A0http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/=
?h=3Djansa/kernel
> >
> > Martin Jansa (3):
> > =A0kernel.bbclass: import s/1/True/ changes from oe-core version
> > =A0kernel.bbclass: import QA warning fix for unpackaged files from
> > =A0 =A0oe-core
> > =A0kernel.bbclass: populate /etc/modules-load.d/ with module_autoload
> > =A0 =A0entries too
> >
> > =A0meta-oe/classes/kernel.bbclass | =A0 64 +++++++++++++++++++++++++---=
------------
> > =A01 files changed, 40 insertions(+), 24 deletions(-)
> >
> > --
> > 1.7.8.5
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> Can we hope this copy of kernel.bbclass will be removed from meta-oe one =
day?
> Is it still here because the  machine_kernel_pr  ?

Yes it's still mostly because of machine_kernel_pr.

> I ask, because the differences between the two copies are not too many
> but are increasing with the time, i.e. do_compile_kernelmodules,
> do_uboot_mkimage, kernel_do_deploy.

That's why I was syncing some before my patches, feel free to merge rest
if you test it.

> IMHO it is very bad keeping two copies of a basic class like this one.

Yes it is, you can ask for machine_kernel_pr inclusion in that old oe-core=
=20
thread too..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8S1fMsFYqgBC+BN/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9td/gACgkQN1Ujt2V2gBwQDgCdG1R+69Ai1cANXLFeVMyve63E
x68An0ZZxUdwNcgH+y3LTcARTxceGxj0
=mXYW
-----END PGP SIGNATURE-----

--8S1fMsFYqgBC+BN/--

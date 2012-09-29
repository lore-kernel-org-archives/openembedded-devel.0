Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THrf3-0006yr-Dk
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Sep 2012 09:40:29 +0200
Received: by wgbdq11 with SMTP id dq11so2039828wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2012 00:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0CEs5+ZEvjbAatRlxmrKCcVYK9UdShqQV5xrVRpreSM=;
	b=o0utW/CaimTmJP/dz+LciJ2MJnyzH21E7Uy/JHr622431VS38VTKrUDVcvLXf5vGR9
	VY68L37jJOcRJgFm1QtSaZm4Lh/L9dTRNbqvj1K9p8C/2KBGrbxqn79lAmgth27fRopz
	Y3o+kz9a/lkG+BztsKUa6S5IrSSedH0assl5tFLOnWt0UjtW1WvbyVqF0MXOGL8y9qu+
	Bn0M1Ffv+uuMESKhSQayaoHiBvX2dpB6abnu3eSYnlv2FwnOx8uSgD5qhW4qWsWf72Hh
	wnoyWmL7Um2ug++36QigkloP3a+UDwjGKhXUHJAks3dGPf58pFo7jSNTwH+2xiUN7Rqq
	KErA==
Received: by 10.180.89.7 with SMTP id bk7mr1791029wib.0.1348903655479;
	Sat, 29 Sep 2012 00:27:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm3945982wiz.7.2012.09.29.00.27.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Sep 2012 00:27:34 -0700 (PDT)
Date: Sat, 29 Sep 2012 09:27:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120929072747.GG3049@jama.jama.net>
References: <1348802495-13651-1-git-send-email-jackie.huang@windriver.com>
	<k45351$rm0$1@ger.gmane.org> <5066568D.5090801@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5066568D.5090801@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-networking][PATCH v2 1/2] ptpd: migrate from meta-oe into meta-networking
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
X-List-Received-Date: Sat, 29 Sep 2012 07:40:29 -0000
X-Groupsio-MsgNum: 40838
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qoTlaiD+Y2fIM3Ll"
Content-Disposition: inline

--qoTlaiD+Y2fIM3Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 29, 2012 at 10:01:49AM +0800, jhuang0 wrote:
>=20
>=20
> On 9/29/2012 5:00 AM, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Op 28-09-12 05:21, jackie.huang@windriver.com schreef:
> >> From: Jackie Huang <jackie.huang@windriver.com>
> >>
> >> Signed-off-by: Jackie Huang <jackie.huang@windriver.com> ---
> >> .../ptpd/ptpd-1.0.0/add-limit-h.patch              |   26
> >> ++++++++++++++++++++ meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.b=
b |
> >> 20 +++++++++++++++ .../ptpd/ptpd-1.0.0/add-limit-h.patch              |
> >> 26 -------------------- meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
> >> |   20 ---------------
> >
> > Can you resend that with -m?
>=20
> Resent, thanks!

And was it really with -M? Looks the same to me..

Cheers,

>=20
> Thanks,
> Jackie
>=20
> >
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> > Comment: GPGTools - http://gpgtools.org
> >
> > iD8DBQFQZg/jMkyGM64RGpERAmQGAJ9FvNdtkcgp25H/NSAQn0jUH3adAgCeIdTv
> > OYcMi5OfStUutSiA4pTuEG8=3D
> > =3DTXyy
> > -----END PGP SIGNATURE-----
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> --=20
> Jackie Huang
> WIND RIVER | China Development Center
> MSN:jackielily@hotmail.com
> Tel: +86 8477 8594
> Mobile: +86 138 1027 4745
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qoTlaiD+Y2fIM3Ll
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBmovMACgkQN1Ujt2V2gBxJ6gCfQR3AweTjTs+1hcIsLjh2A9jz
awkAnRtedR69S+bOfPDyz5j9IwDSeL1N
=lsnL
-----END PGP SIGNATURE-----

--qoTlaiD+Y2fIM3Ll--

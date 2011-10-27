Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RJP9R-0002RJ-HS
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 14:33:41 +0200
Received: by wyg19 with SMTP id 19so2932974wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2011 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NDFWX2pGD8azZrTO2ueWYflyej/uIu1XWRt+RFItkQw=;
	b=Y32rx/otTtUsASLODBxkQiKWx8VckU51mueSasfyH8FGzMhvTP/FkTKo0rEWapRO+U
	YKWJyTmijBK33fDODkWT6W6d1MD1EPJ4Xtn0zOXBhX+uGQYf5O1qM1kRxMPGsoOh1qpA
	pz0aa+f+WtD2Khx0nCRZIdAvGdUV0Xplj7fnY=
Received: by 10.227.203.198 with SMTP id fj6mr16120832wbb.24.1319718461531;
	Thu, 27 Oct 2011 05:27:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei16sm9060779wbb.21.2011.10.27.05.27.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Oct 2011 05:27:40 -0700 (PDT)
Date: Thu, 27 Oct 2011 14:27:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111027122735.GC12609@jama.jama.net>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<20111027115643.GA13369@mi.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <20111027115643.GA13369@mi.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Thu, 27 Oct 2011 12:33:41 -0000
X-Groupsio-MsgNum: 35036
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Content-Disposition: inline

--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2011 at 01:56:43PM +0200, Henning Heinold wrote:
> On Thu, Oct 27, 2011 at 10:53:13AM +0000, Mats K=E4rrman wrote:
> > Hi,
> >=20
> > Are there any plans for new releases and/or maintenance branches of OE =
classic?
> >=20
> > BR / Mats
>=20
> Hi,
>=20
> http://cgit.openembedded.org/openembedded/log/?h=3Dorg.openembedded.dev
>=20
> and
>=20
> http://cgit.openembedded.org/openembedded/log/?h=3D2011.03-maintenance
>=20
> Bye Henning

Are you showing that maintenance ibranch is not so old and that only few
things changed in old OE-classic since then? :)

Afaik: nobody plans to do another release from OE-classic and
oe-core/meta-oe/BSP's/... are veryclose to first release

Regards

>=20
> PS: Feel free to update the wiki
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6pTjcACgkQN1Ujt2V2gBxE6wCfcpRKugEvsTa6+coIgPzwharI
wC8An3Rc2gP4ni25D207l6bi6QFCNTEM
=kl/1
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 47F11703EF
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 19:05:53 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so4295242wes.5
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 12:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZsdNwU2PpIcufr3ZipQ+RfYDmcBt+wXg+WCmbkoitds=;
	b=BtUmtSNpu6aVeNiEJRBZ+oE826xnwxg4ZvOHs16p+eVJGz0HCEPSXUGc1/67JkvTqy
	Oa2ZgMo2hJdCtsp09SnawrafeRHp9eUAnmqYy0CzWCuFp14edbZO3ivHenCROTGNLkjs
	egGAKqMhbssnL0jTnez9dS5CWGq1EgUMHufqbBC5kQKxE4wP5W7JUJDdgKAT/zj8cOrc
	HSmdmecPK8va3kND6m5RsqJ19C9adXpye9yPdswNeu1sd1xqGGOoPeRyxoMxY4XLAY26
	GLrMs0HkC2VCcH5Jy02a4X2gVD7c5Wc0WXrwNwIZmecDQGyXlzh2c8awUELvAkHJsCLP
	EGJQ==
X-Received: by 10.180.75.75 with SMTP id a11mr7642816wiw.3.1405451154447;
	Tue, 15 Jul 2014 12:05:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bx2sm34416446wjb.47.2014.07.15.12.05.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 12:05:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Jul 2014 21:06:03 +0200
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140715190603.GQ2433@jama>
References: <lauren.post@freescale.com>
	<1403889196-11872-1-git-send-email-lauren.post@freescale.com>
	<CAP9ODKqccAwSGjkv15wmvFgcLsL3+MCWte+KvA4-6TDf_U9uxw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqccAwSGjkv15wmvFgcLsL3+MCWte+KvA4-6TDf_U9uxw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OpenEmbedded Devel List <Openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] cpuburn-neon: Upgrade to version 20140626
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2014 19:06:00 -0000
X-Groupsio-MsgNum: 50976
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3XZQkxCYp0f/VEFS"
Content-Disposition: inline

--3XZQkxCYp0f/VEFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2014 at 03:27:58PM -0300, Otavio Salvador wrote:
> Martin,
>=20
> On Fri, Jun 27, 2014 at 2:13 PM, Lauren Post <lauren.post@freescale.com> =
wrote:
> > Previous location is no longer accessible and breaks builds that include
> > cpuburn-neon.  This updates the location to fix the build breaks
> >
> > Signed-off-by: Lauren Post <lauren.post@freescale.com>
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>=20
> Ping?
>=20
> This is an important fix as it breaks builders.

It was merged earlier today.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3XZQkxCYp0f/VEFS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPFe5sACgkQN1Ujt2V2gBxTSwCgn/Byh6PMFBhGxMq86e6kh9bl
K0AAnid+bzBWqtKxPk1Pr1LJN89Vjqfs
=SPnm
-----END PGP SIGNATURE-----

--3XZQkxCYp0f/VEFS--

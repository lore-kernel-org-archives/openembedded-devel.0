Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9D06158C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:53:36 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so4168342eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zqbzYb7VSU1QfOZvlbqhXERQGcUEPy56DvndBg6J3dA=;
	b=n7LlkgicfM6cZAvtpZFgKJv0vV0R91+CWiUwVyEWL+y8Kki4KRJ8HOGeupfLxQdiTG
	0IUM5OltCoy2J4sdGv5O8Z7yITE3ol0mM1OVBe4aFhSORTIiOXpYz7uw8oGj3KGwCsBU
	rp6tu63KKZAdnzxCYzWLNoWmLHp1aBHIJR7B7EuvCDxepcaCO9rOzKbXhNn/jNu5h8bi
	q9tYQ02rwE2A2FyJHR3NI0MG8wGm9HW9dytYrCNdRRHinvukaTmF98AbPNKDNru5SSwt
	ccBcMq5EhS1uyoVOgC2yG54t62EBrz8ekn2jMwPWd5dST0rUw6iI2UdZIqf5Vt3aCuk3
	GB2g==
X-Received: by 10.14.98.8 with SMTP id u8mr2053443eef.59.1379595217905;
	Thu, 19 Sep 2013 05:53:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm11105411eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 05:53:36 -0700 (PDT)
Date: Thu, 19 Sep 2013 14:55:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130919125515.GH18414@jama>
References: <20130913135936.GD11500@jama>
MIME-Version: 1.0
In-Reply-To: <20130913135936.GD11500@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-perl, meta-filesystems maintenance
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
X-List-Received-Date: Thu, 19 Sep 2013 12:53:37 -0000
X-Groupsio-MsgNum: 46253
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4LFBTxd4L5NLO6ly"
Content-Disposition: inline

--4LFBTxd4L5NLO6ly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 03:59:36PM +0200, Martin Jansa wrote:
> Hi,
>=20
> there were some patches for meta-perl, meta-filesystems
> do you want me to merge patches which looks OK without your ACK or
> should I always wait for it (you're listed in meta-perl as Maintainer
> and in meta-filesystems for couple of recipes + you created it)?
>=20
> If you don't have write access I'm OK with pushing them for you once
> they are acked on ML - or even better if you send me list of patchwork
> IDs to merge or some consolidated pull request.
>=20
> You can see what's in queue:
> http://patches.openembedded.org/bundle/jama/meta-filesystems/?archive=3Db=
oth
> http://patches.openembedded.org/bundle/jama/meta-perl/?archive=3Dboth
>=20
> If you don't have maintainer permission for patchwork, please ask Khem
> to add it for you.

ping

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4LFBTxd4L5NLO6ly
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI69DMACgkQN1Ujt2V2gBwH6gCfXvWrbBOvwnH/FtjMmeKzTGHD
SR0AoJ4rWbZXMPQuUjaBHkGIyDVZN08/
=Vgn2
-----END PGP SIGNATURE-----

--4LFBTxd4L5NLO6ly--

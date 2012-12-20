Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlgfK-0006kD-DC
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 15:00:03 +0100
Received: by mail-da0-f50.google.com with SMTP id h15so1533852dan.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 05:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=KX9zZFZK8xz5odeXFppq2xtqR498F37MQvzEuI+Qyig=;
	b=sxquyaXIxBftdEcG9zl/RbFS36ymhp17rKK/V2d61/rtOB6I+uxkujWkk4GZudwTNp
	Z43xysrtVb1dj6djXRugO6z85F4X3FAQFmg3pRyYfAsF9BkDHplhqKpctLKPP7Sv5DLB
	TYC1cY1fNFeVvhC+YlCLt4PBuxYo5LBD7imeyr1wNSu8moQn5UfcVhIniuLLxtT67FFO
	h9Kny3ODLncHKsx1kWgsHVfqJ05MqrmptjPoopdJDRSNcvFTWmD3iuu6ker7N2gfsCud
	UPwi9JmroNQwHCVr1+TuoIDXvoOc80jJrQMcEXlHfwceGPMmDMQZ6eokkOIJ1m6y3Ppr
	F98A==
X-Received: by 10.66.85.74 with SMTP id f10mr27651796paz.38.1356011117280;
	Thu, 20 Dec 2012 05:45:17 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qb3sm5077995pbb.35.2012.12.20.05.45.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 05:45:16 -0800 (PST)
Date: Thu, 20 Dec 2012 14:45:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: vladimir.redzhepoff@promwad.com
Message-ID: <20121220134514.GN14543@jama.palm1.palmone.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [07/10] Add recipe for postgresql 9.0.2
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
X-List-Received-Date: Thu, 20 Dec 2012 14:00:09 -0000
X-List-Received-Date: Thu, 20 Dec 2012 14:00:09 -0000
X-Groupsio-MsgNum: 42283
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/JIF1IJL1ITjxcV4"
Content-Disposition: inline

--/JIF1IJL1ITjxcV4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, sorry for late reply, can you update your patch=20
http://patches.openembedded.org/patch/20145/
to apply on latest meta-openembedded?

Your patch seems to be for oe-core, but meta-oe already has postgresql,
but a bit older version 8.4.7.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/JIF1IJL1ITjxcV4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDTFmoACgkQN1Ujt2V2gBw/cQCeOrahlnAInrdRhS23VecuscEM
5fgAn0pex8mxpmaZV7tJLTyl6D3xCmP+
=5Dm4
-----END PGP SIGNATURE-----

--/JIF1IJL1ITjxcV4--

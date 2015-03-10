Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id ECC5373A15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 18:37:18 +0000 (UTC)
Received: by wivr20 with SMTP id r20so32651997wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 11:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s2Smj19TR8u4Z/ZGGXLWt0A77jS28cKTxOdkYC8yC+A=;
	b=ZI1kDe3Z8eyrUc/5HZGeX/J7FWnL8yM7AOdkKTtBNXNtAydo7MrnyW4wNxYsFiDL44
	1gIjGN27UkpW9dbnv2Y/rCUCqjNg/EW3x/ic6lWzNlmZeUMG/yuc5K+0SsIdEysWZRQm
	JmMD12gMnPKzylQxKbqn53VtFvz7mgz++hVX5aYfF2Y1PLZXozwdjVLD8KPGWIt0AuE9
	XFfGS7K4yJpJAdm1dCiw5ThxZnTE4PXdUAem89wAtXAp+yFqDRku4Ggb2vc2DMIIahLc
	WDLm+rCpDh3eb+FQqHwmkNHlYJ6ArVCoHqy8lmxrYrUC27f1Tw27LtP5jyZVur6SyQHS
	IvSA==
X-Received: by 10.194.234.40 with SMTP id ub8mr72203820wjc.100.1426012639343; 
	Tue, 10 Mar 2015 11:37:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cf12sm2062064wjb.10.2015.03.10.11.37.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 11:37:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Mar 2015 19:37:50 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150310183750.GG2340@jama>
References: <CAL0pqZ15mf+jANcqzD=EAYs-BOKThCdWdzO2J2aRaV1v4moO=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL0pqZ15mf+jANcqzD=EAYs-BOKThCdWdzO2J2aRaV1v4moO=g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Recipe Name Change
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
X-List-Received-Date: Tue, 10 Mar 2015 18:37:23 -0000
X-Groupsio-MsgNum: 54721
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="APlYHCtpeOhspHkB"
Content-Disposition: inline

--APlYHCtpeOhspHkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 11:59:52AM -0600, Leah wrote:
> Hi,
>=20
> We have recently changed the name of our product from CyaSSL to wolfSSL. I
> would like to update to a recipe reflecting this name. Our current recipe
> is located at
> https://github.com/openembedded/meta-oe/tree/master/meta-networking/recip=
es-connectivity/cyassl.
> Should I make a commit to delete cyassl and a separate commit to add the
> new wolfssl recipe? Or should this be done in one commit?

In one commit.

>=20
> Thanks,
>=20
> Leah
>=20
>=20
> --=20
>=20
> Leah Thompson
> www.wolfssl.com
> leah@wolfssl.com
> 406-570-1389
> Skype: lchristina26
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--APlYHCtpeOhspHkB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT/Of4ACgkQN1Ujt2V2gBydCACfa6EreVijC4YIc2a1NDfl9xYm
Z/EAoKqhk9sGJQnBhhpZCyFzoFEYFeAn
=fbO5
-----END PGP SIGNATURE-----

--APlYHCtpeOhspHkB--

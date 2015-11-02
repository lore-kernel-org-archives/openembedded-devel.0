Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDD575852
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 13:22:58 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so49678139wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2015 05:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=StrVPEmZ37Jj7I5iK+K2SVuh9V16ejOdXyGBXyXS2SY=;
	b=KCVfSUU0B4F8N+5dFIxvnTrlvlM/tKnGoZiNSZPulpSHix8ibbL64MI7KMLom2sdLc
	GBrNtG4Tra3TKU3ZSus4EIEyNK53GMTSOSQ3+3SgTJyzsaZ+7QCc0d5aAyu0cz+jnWMX
	P9itkh+FAuREyDYWnm/y8ohqFv9dE7wB+mo7pIvRpPE2Lewk7VCoO2IdqShQUUNypH1T
	mb7Xd9p3uCk8nEJoko/JphQVKNLEkq+SnCyWUC5QgpqQ3Ee9QCdQLe4LOdgN/ZyVXpLm
	9Edo46UbsMEY5ju+Bwwe3Axd0XBBZuCXgwYiyW47itXSrIqSu7n8QybLc2nruvm+goSi
	k7OQ==
X-Received: by 10.194.179.33 with SMTP id dd1mr27008095wjc.79.1446470578101;
	Mon, 02 Nov 2015 05:22:58 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t20sm18146190wme.0.2015.11.02.05.22.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Nov 2015 05:22:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Nov 2015 14:23:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151102132303.GA2567@jama>
References: <CAKpvFF1iKmibZaEh8FGDLrkR7sSbWkVfNxu_oddq89PUYchehA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKpvFF1iKmibZaEh8FGDLrkR7sSbWkVfNxu_oddq89PUYchehA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: interest@qt-project.org
Subject: Re: meta-qt5 (fido) in my yocto project (dizzy)
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
X-List-Received-Date: Mon, 02 Nov 2015 13:23:02 -0000
X-Groupsio-MsgNum: 58243
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2015 at 11:14:13AM +0100, Stefano Gurrieri wrote:
> Hi people,
> I'd like to use meta-qt5 layer (downloaded from fido branch) in my yocto
> project that is a dizzy.
>=20
> Is it possible?

Yes it's possible. Not officially supported, but this combination should
work without any extra effort needed to integrate them.

> I'd like use an update qt version (5.4 included in fido branch) instead of
> 5.3 (include in dizzy branch).
>=20
> Thanks a lot for the help.
> Greetings,
> Stefano
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY3Y7cACgkQN1Ujt2V2gBx/DgCdG3Y+ROwe36T8gZadDCiLjvfg
6AYAoJPjIetWgpc8FepLr22u9DoS1PDd
=L04x
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--

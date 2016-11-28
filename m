Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id DCDAF608B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 08:51:30 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id g23so198280914wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 00:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+Mh0+epvCg7MkyaH2d4H91NRjT8BCbcL+4EnI3ulDTI=;
	b=CZG2OnVPCwOkdeUjHgkLxbjssrzcpWGolcP9aCPlZIIuAVbL0Y36D2Go0AH/BJK8na
	VaEo6083QbT0+4CGgz54AbDO+IyiW8GW2rk5Dp6xCO/kZtiBu0ngx/b33i0m48jfj+8d
	XpomOn9iZWCqbCMnr8QDWl2j/dYRCfVFEl7FJRA70xjS+aHzQVW1BUBXCA2et/GuAL5n
	NdyUsNh3NO6RDJHVugmB7o523JPjKburB1mhusIedKXIZ7qnnMGSzk+tJhZ7BnY0mkWs
	spH0tYWxudd4ZKB+x2i8tkoCbj5jlhOyChs/LJ7BeE5gIHVPbYZU4WxwtRtQm26ObhBV
	9F7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+Mh0+epvCg7MkyaH2d4H91NRjT8BCbcL+4EnI3ulDTI=;
	b=efk4t7U9Ho7ZzrpwBxjqGn7WKZ71/q0QakElF/ZyffuLpqCG/g4sPccH1iKNGWSM34
	jwZdow6mklXQHFarQ3anGeRi5UDFB4ZapTIFROwhwX2mjmcpBPm8NLlbtj8YDVsYwCy/
	D3nu/mms6J8gJ2/3X44z0Fg7LdYBqXClhZMwSvhyV3/3f7yoG+WHSZekPN5gCAM5Pb+c
	pAZZz2Ak7VDBBwyw3SfGjDKC66M3HL/k4Gs0Oj9ndwF1iQPNZfINYTvGd08iVQrND7ka
	SUmq6rvRWS27F7rR19aUvotFxEfhjSo6HgETSx5k/+X896zKKEwHuHhhlz4o0sIZJsHX
	7O/w==
X-Gm-Message-State: AKaTC0178P59wrNuy4e4z9u7fQEj7z5QevAC4ht8OlZ2/NtmaaAMiGuphe2q0QFpr8xF2A==
X-Received: by 10.28.170.202 with SMTP id t193mr17042926wme.10.1480323091586; 
	Mon, 28 Nov 2016 00:51:31 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v202sm27482705wmv.8.2016.11.28.00.51.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Nov 2016 00:51:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 28 Nov 2016 09:51:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161128085130.GA3018@jama>
References: <1479913709-20703-1-git-send-email-joe_macdonald@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1479913709-20703-1-git-send-email-joe_macdonald@mentor.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-networking][PATCH] iscsi-initiator-utils: Update to 2.0.874
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2016 08:51:35 -0000
X-Groupsio-MsgNum: 64066
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 10:08:29AM -0500, Joe MacDonald wrote:
> The latest iscsi-initiator-utils has been available for a while now,
> update our recipe.  The new version no longer bundles its own ISNS server,
> so this update brings in open-isns as a dependency.
>=20
> Additionally, open-iscsi.org is defunct, the new home is at
> open-iscsi.com, update the SRC_URI and homepage accordingly.

You should add systemd to required DISTRO_FEATURES, because now it's
required by open-isns.

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDvwEgAKCRA3VSO3ZXaA
HLZOAJ98uv9rwk7Pe+LhLsFGuSNtmPRh6gCdFf7UdiOzua9P/uagzjWs2RmCdZk=
=LSfM
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id DB110783FB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 22:04:47 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id i189so49546473wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rQvffXOmVPQatYqQgLEtlNfkgKGq+4cLVD5j6JPxCWM=;
	b=tSksQIaQ6JzZUAg2aa9wH6iJxD0JwJDg5GyGf+jxNcmbUW6nXAgDodvrM4twGRLPCX
	8MiJgQBR7UPdgpvzsiTpyQC1QAgWdrniZBomaWQO21+Hv+zBdmM4fOiSjY5WfIK9P+zF
	stSH0+hugZb4pLoCQl0OWsEiaFgkfyIRL/D/LWnxayVtKzVgGDHonh4uQclGpS9gSxbC
	QpSnyRIFRMaLOwBAzmxD7rh+wn4pdNBftnLtzYm6XkNVBxZlZJ9PomJNMA8u90M9KdHT
	JPvhpwthfjEND6I9xLu4RoOmRmlFn0+fkHdFYGoRDgtSEEzz0tYkvERg3K60uZjZnmrR
	NWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rQvffXOmVPQatYqQgLEtlNfkgKGq+4cLVD5j6JPxCWM=;
	b=UaK6w/GYMQhZKhiPhMBPsDiShiD2T6MCM7ZszxXnqfCLNMkszQ7jlUgZbH96j3w99x
	yamaTHO6TTM+shbnaLRpVah0ZybPAPoMMgugMhCGbzj6KvAdpgNgUZNh9dBb4gIznZXJ
	jDhaR7o9xobrAq3met0Q7o7P4p4XHo2YHnESfBFwMWzfszFEX5pbaspLkZvZi2yAclAS
	eq3i28POqTIAKTNo47psYOkkzC72ZGXLrp0Nh//S4cgSnNZw8NipjeS3XUQ1Gf2qr1lp
	ES469/FZ8OECfRB6MMyx7e/I6XQFj8Ko2quktDm8e7zcBrPlqNmwfCNf5N/VkD7nhS+S
	sFww==
X-Gm-Message-State: AHPjjUjsCskBkcyJ8cSU1Q5fOUKEtwQuSjvAV0TCY3b1SJTJR/4UDeCp
	5DU1nKJppYHKew==
X-Google-Smtp-Source: AOwi7QA2YYzGthIP2jzLzXZGX9Jyu2RiU9IH+DKb5w8xILc1uwrtlOJBWEgsHeaQVaNt/n5ZNlHdBw==
X-Received: by 10.28.152.70 with SMTP id a67mr8313926wme.132.1505167488736;
	Mon, 11 Sep 2017 15:04:48 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o82sm16725707wmg.36.2017.09.11.15.04.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 15:04:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Sep 2017 00:07:04 +0200
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20170911220704.GA4102@jama>
References: <cover.1505143034.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1505143034.git.akuster808@gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 000/126] Pyro-next pull request
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
X-List-Received-Date: Mon, 11 Sep 2017 22:04:48 -0000
X-Groupsio-MsgNum: 68713
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2017 at 08:21:02AM -0700, Armin Kuster wrote:
> Please concider these changes for pyro
>=20
> The following changes since commit 5e82995148a2844c6f483ae5ddd1438d87ea9f=
b7:
>=20
>   opencv: disable broken Intel FP16 detection (2017-05-09 16:00:31 +0200)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib akuster/pyro-next
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dakuster=
/pyro-next
>=20
> Kai Kang (3):
>   snort: enable static daq

This one adds daq-native which depends on libpcap-native, but without
this commit in oe-core/pyro:
commit 12373003cc3753421321d558813b1de95667c192
Author: Kai Kang <kai.kang@windriver.com>
Date:   Wed May 24 17:33:58 2017 +0800

    libpcap: add native package

    Add package libpcap-native required by recipe daq-native in layer
    meta-networking. And daq-native is added to fix snort start error.

it fails with:
ERROR: Nothing PROVIDES 'libpcap-native' (but virtual:native:meta-oe/meta-n=
etworking/recipes-connectivity/daq/daq_2.0.6.bb DEPENDS on or otherwise req=
uires it). Close matches:

Is there oe-core/pyro pull request with libpcap-native?

Why is this snort change needed in pyro?

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWbcJCAAKCRA3VSO3ZXaA
HO6WAJ0bSJx4C/nK2j0B/1a8GdvDcqjS5gCfbGVwiu/xngxGE+fnc5qm8aWeQoU=
=R/EM
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--

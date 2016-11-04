Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id 9D65871C45
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 19:40:26 +0000 (UTC)
Received: from arch-club.local (unknown [84.198.89.1])
	by mail.glycos.org (Postfix) with ESMTPSA id 028DE44CDB;
	Fri,  4 Nov 2016 19:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1478288427;
	bh=1p5xl0G6kwnJtTzMYN7L50wdRjFCs2iA7kznxBv7J9o=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=DF4VTGDa7lAY33N5tIv2R0caBcNRCsJ2vChE9/GSASBn8BGQvsYK5bsxPmTc63NIo
	dETdMH/B954Z5GzwS55ZVfQWE9dtl3ZQxHYdnxiaLKzZjYR0nA5xu2/ibA0q/48bUb
	zuN4H9ZOCvH2c0qUAo1+SPXgwsXWRKQaN55erJTc=
To: Derek Straka <straka.derek@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20161104101423.20557-1-ruben.de.smet@rubdos.be>
	<CADNbA1qAHFx9PTPAhue2xC0Z2nQ-tQC4Vz11QqHmH5ufnp3Vug@mail.gmail.com>
From: Ruben De Smet <ruben.de.smet@rubdos.be>
Message-ID: <a064e5a9-338e-57a7-6da9-87735bcab61a@rubdos.be>
Date: Fri, 4 Nov 2016 20:40:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADNbA1qAHFx9PTPAhue2xC0Z2nQ-tQC4Vz11QqHmH5ufnp3Vug@mail.gmail.com>
Subject: Re: [meta-python][PATCH v2] python-scales: add recipe for version 1.0.9
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
X-List-Received-Date: Fri, 04 Nov 2016 19:40:26 -0000
X-Groupsio-MsgNum: 63752
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="A70daSqhIadqxiCULmP887jvkmUGHbQf8"

--A70daSqhIadqxiCULmP887jvkmUGHbQf8
Content-Type: multipart/mixed; boundary="1AA8u3Niq2B7hU27IA658cwCACnLvv4tQ";
 protected-headers="v1"
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: Derek Straka <straka.derek@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <a064e5a9-338e-57a7-6da9-87735bcab61a@rubdos.be>
Subject: Re: [oe] [meta-python][PATCH v2] python-scales: add recipe for
 version 1.0.9
References: <20161104101423.20557-1-ruben.de.smet@rubdos.be>
 <CADNbA1qAHFx9PTPAhue2xC0Z2nQ-tQC4Vz11QqHmH5ufnp3Vug@mail.gmail.com>
In-Reply-To: <CADNbA1qAHFx9PTPAhue2xC0Z2nQ-tQC4Vz11QqHmH5ufnp3Vug@mail.gmail.com>

--1AA8u3Niq2B7hU27IA658cwCACnLvv4tQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/04/2016 02:24 PM, Derek Straka wrote:
> Is there a reason this is commented out?  You'll need something or it w=
ill
> give a QA Issue about license-checksum
>=20
> Missing a closing quote here


I noticed there's a lot more wrong with this.

Apparently the project didn't even depend on this anymore, so I'll fix
this later.

License problem was that the PyPi package didn't include a license file.
As we don't need this package anytime soon now, I'll file an issue with
scales, and perhaps fix this in the future.


--1AA8u3Niq2B7hU27IA658cwCACnLvv4tQ--

--A70daSqhIadqxiCULmP887jvkmUGHbQf8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQE2BAEBCAAgBQJYHOQlGRxydWJlbi5kZS5zbWV0QGdseWNvcy5vcmcACgkQ+CZa
iBIT3BCAJgf/bgA9LGyh4D1Lt0PO3AEGJZEzvjUr4Bl+WypQyslCvIM3bdU6is1a
BwElgpCeZMNab/knTUR4qiFWiBq9/4FD0WHBUvBrc9Zlu/ZQ2Bhjd+sfg0ZHe/KO
m6fwYc/hagg9E6r5GhyHz0Y9JulG7y4Qe0Tw3wt8FVYUhLpXOfZ98B1VqIld8SNG
/6mTlsbvdsyXumnL6+rAv5Hx50Rbd3Fl7+LFtsEWdGd+6K9apmLVzUfbxKXVxDUM
bodQcWlGzotNaQ9JYNSupcJFa21tJZJftaj5gi8GmjqkpPjV1Vkk2e+yGZDm9avd
xD0QH80GBJGetL5U+pa9Ff7crGLAatF/qw==
=MuRj
-----END PGP SIGNATURE-----

--A70daSqhIadqxiCULmP887jvkmUGHbQf8--

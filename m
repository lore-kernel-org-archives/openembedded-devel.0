Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id D191565C5B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 07:17:34 +0000 (UTC)
Received: from arch-club.local (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id E426446720
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 07:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1475133455;
	bh=0ujQGAg1Qr16H+FbAK7OTEqqZHDJweUm+8NSLWbKSVg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=XAGPG7ZaQpm+dW80+7nYamvCnL59nCJYH0tNBweyy7UhYHQSHx+sHtqiBeXf3882H
	creN8ddp+ywMyEBgenQB49jubVNy7IjFWvXB43BwcVwtEFZJ8Qk0+EiL74x1+iMOCh
	rYVRvGsWDYAAg3nfqCPwFKzAc+4gZTibOqQlq0j0=
To: openembedded-devel@lists.openembedded.org
References: <20160822143457.6378-1-ruben.de.smet@rubdos.be>
	<75048f87-6738-f678-b085-7bdc337b89e6@rubdos.be>
	<9d9e512d-a454-e917-a6f0-d3bd0ba381e7@gmail.com>
	<8ca5d779-dd4a-e01c-a34c-3110ccf9fcf0@rubdos.be>
	<CANx9H-C02yHDEK8kNXb-k+x9aO3Zot8UbUAqRJW+M9OqXuyV0Q@mail.gmail.com>
From: Ruben De Smet <ruben.de.smet@rubdos.be>
Message-ID: <865459e5-3977-d38d-3c17-c840d12076e8@rubdos.be>
Date: Thu, 29 Sep 2016 09:17:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-C02yHDEK8kNXb-k+x9aO3Zot8UbUAqRJW+M9OqXuyV0Q@mail.gmail.com>
Subject: Re: [meta-oe][krogoth][PATCH] python-cassandra-driver: add recipe for version 3.6.0
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
X-List-Received-Date: Thu, 29 Sep 2016 07:17:35 -0000
X-Groupsio-MsgNum: 63348
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="PIcbOnXQCTge5dVSWkFt891MPqCkGkC16"

--PIcbOnXQCTge5dVSWkFt891MPqCkGkC16
Content-Type: multipart/mixed; boundary="P6O7tTwUB8m52pnpFNSe83FwIM5oBaXWb";
 protected-headers="v1"
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Message-ID: <865459e5-3977-d38d-3c17-c840d12076e8@rubdos.be>
Subject: Re: [oe] [meta-oe][krogoth][PATCH] python-cassandra-driver: add
 recipe for version 3.6.0
References: <20160822143457.6378-1-ruben.de.smet@rubdos.be>
 <75048f87-6738-f678-b085-7bdc337b89e6@rubdos.be>
 <9d9e512d-a454-e917-a6f0-d3bd0ba381e7@gmail.com>
 <8ca5d779-dd4a-e01c-a34c-3110ccf9fcf0@rubdos.be>
 <CANx9H-C02yHDEK8kNXb-k+x9aO3Zot8UbUAqRJW+M9OqXuyV0Q@mail.gmail.com>
In-Reply-To: <CANx9H-C02yHDEK8kNXb-k+x9aO3Zot8UbUAqRJW+M9OqXuyV0Q@mail.gmail.com>

--P6O7tTwUB8m52pnpFNSe83FwIM5oBaXWb
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 09/29/2016 09:09 AM, Tim Orling wrote:
> Please resend without [krogoth] but with [meta-python] as indicated in =
the
> layer readme.
>=20
> In this case, "upstream" is not what you mean. You mean "master".
>=20
> Cheers.

Ok, will comply. Thank you for your help; you can expect a patch later
today.

Ruben


--P6O7tTwUB8m52pnpFNSe83FwIM5oBaXWb--

--PIcbOnXQCTge5dVSWkFt891MPqCkGkC16
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQE2BAEBCAAgBQJX7MAKGRxydWJlbi5kZS5zbWV0QGdseWNvcy5vcmcACgkQ+CZa
iBIT3BDt4gf+PcuPBd4T4mtqDbdDAYanzL7TT1vwmxwSu3w7vfwxqpTdJQOZj0Bf
IYQdQajpA86b1rEtzdD04wITJxdvCgf56i5pM2oiz48ehvpyw6lOVzbuJjR92X0E
9f9K9ThZiGFPbofBQ8KT+/+7xHB8GLhuIsfllM3EmvHLvnCma9Td1zYN1pYgXDD/
k0HJ9HqrGf8XDPbnQHK5x6XvQfF5wupyLwdkT+PSPcHqYrUE2ZHJLPTo5mY/OyMG
vgb6o0c/pDy/+wGnM3A4NU74XQAd49Ylh8x6tF1Rk+GPTIYm0/sO8GMfZ/oVOtMP
cG9Y9juEFcz4Mb/0j76gmDgVrCKuIoUjZA==
=T/P7
-----END PGP SIGNATURE-----

--PIcbOnXQCTge5dVSWkFt891MPqCkGkC16--

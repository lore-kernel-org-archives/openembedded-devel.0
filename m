Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 29F6565D6E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 19:48:03 +0000 (UTC)
Received: by qcej9 with SMTP id j9so9002192qce.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 12:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=xgJWi2mBpXaGEhBnHpIZMYIMlFZoA1G5Lrvo5kZr/2U=;
	b=SdWF/B7z3QDMMm5FKMm7WOcl9RWjHuXMttlIeTz7I+SS9A32R+8AOfIKlVSPsPrmOw
	pgq/Hc2LMM4nUeXPpuhE2fHia0U9KIuyI4o+LSJXVZjFjGIet0OWu3FI5od0phJ4X07y
	Vd6AweG8Df0VmpSBLyCkWrhci9+36gccdj015o4U+Avwao/y8nDU7JjvXykLuZu9Y9ex
	uU5JgytSjLRs72h5Lk2MqRwCIRu2AsKD2cGH1T3FyUiKnstZZLkdyxd124Bwinqzj3HH
	DydfWbtAvhwb0xJyTla5ERQXFIuKaO2k3FA+62MpZv5590ydbsegkowpSYu8umeAOLJR
	nfJQ==
X-Received: by 10.55.20.12 with SMTP id e12mr9756564qkh.56.1433360884575;
	Wed, 03 Jun 2015 12:48:04 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:d1e4:9e90:3fdd:134b?
	([2601:9:500:ece:d1e4:9e90:3fdd:134b])
	by mx.google.com with ESMTPSA id j44sm971829qgd.28.2015.06.03.12.48.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 12:48:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAAzKXngfXaq4B87iQQXY0b-dxkncf8ROsYg4z0TnQFM5wNgxBw@mail.gmail.com>
Date: Wed, 3 Jun 2015 12:47:56 -0700
Message-Id: <7B9BD28F-040A-4BF7-88D7-FB3B17F7C090@gmail.com>
References: <CAAzKXngGv=tmUgOnBvAaz37mdc5R8k6YPjaQNc2pYWJF+qAD=Q@mail.gmail.com>
	<34D595E1-BD07-4EA7-A4F7-7E75AB8249A1@gmail.com>
	<CAAzKXngfXaq4B87iQQXY0b-dxkncf8ROsYg4z0TnQFM5wNgxBw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-browser] [PATCH 2/2] chromium, cef: fetch chromium source from git
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
X-List-Received-Date: Wed, 03 Jun 2015 19:48:11 -0000
X-Groupsio-MsgNum: 55750
Content-Type: multipart/signed;
	boundary="Apple-Mail=_42A3B58F-8229-4588-A27F-EFCFA11821A1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_42A3B58F-8229-4588-A27F-EFCFA11821A1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 28, 2015, at 12:09 AM, Zoltan Kuscsik =
<zoltan.kuscsik@linaro.org> wrote:
>=20
>> Z: CEF is always built on clean chromium checkouts. CEF patches on
> Chromium are applied using cef's internal patch script. Here is an =
exampla:
>=20
> =
https://github.com/kuscsik/chromiumembedded/commit/da9609deab1345fc480667c=
e04ef670f4c94ef62
>=20
>=20
>=20

OK

--Apple-Mail=_42A3B58F-8229-4588-A27F-EFCFA11821A1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVvWfAACgkQuwUzVZGdMxSWxgCeJMJQ4kPiUaTEnSG5HZKNOEHZ
yzUAn08VgmjyGUZaKpms81VT9Z/QuQVP
=ZCmQ
-----END PGP SIGNATURE-----

--Apple-Mail=_42A3B58F-8229-4588-A27F-EFCFA11821A1--

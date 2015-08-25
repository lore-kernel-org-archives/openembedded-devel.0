Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id D120872B1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 01:20:59 +0000 (UTC)
Received: by pacti10 with SMTP id ti10so36505088pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 18:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=aN/LWnfrga3zNrAxFvFesQBt+hoa0sp6/m0MLcMMtos=;
	b=ai9MJTAw6TkxgwnPCF7h4CmeIB2D4vLpHPpnK5JmiQFXELmApWBWOwXisOurD+d4AI
	Ovy9gIPWlNw30uCLYH4O7zgcCy5dyge0eWQB/mOc4wt2cIHb+ES25eOI3MYGPmcPTkXt
	njn1R4bzuJZvdngIAu0/kvQrdnX5PuwiC7Yk+D3G7K3wmDHbOG7AZxHg43OgMOXX6D0C
	KCVo87YcQkiUtJ4fppIk7QX0LdZYXf3ty2aPFSRLIRjTZct5fT+p6X38tPE58I3O612s
	pmYUdHPBU0QEMvpsSIUIOiGNpp98/gwLqsV9SHd1hXCUDZds/ayMby/zYLm4yiiwTMOt
	IBvQ==
X-Received: by 10.66.97.102 with SMTP id dz6mr52083999pab.29.1440465659511;
	Mon, 24 Aug 2015 18:20:59 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ded:b62b:f72d:209d?
	([2601:646:8601:4580:4ded:b62b:f72d:209d])
	by smtp.gmail.com with ESMTPSA id
	gw3sm18777388pbc.46.2015.08.24.18.20.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Aug 2015 18:20:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC011C1FA3B4@G08CNEXMBPEKD03.g08.fujitsu.local>
Date: Mon, 24 Aug 2015 18:20:56 -0700
Message-Id: <45BEE936-90D2-413F-811F-ADE72F6D3AC4@gmail.com>
References: <1440175216-21907-1-git-send-email-biannm@cn.fujitsu.com>
	<CAMKF1spvKJaV0_+JngPLnZWesZ2ELipZ3c=UdOY1v-Nu2yLkBg@mail.gmail.com>
	<30DC4EDFD798C94083F3E083754532CC011C1FA335@G08CNEXMBPEKD03.g08.fujitsu.local>
	<F8BECE17-36E1-41F1-8B14-2E0EB99D7BDB@gmail.com>
	<30DC4EDFD798C94083F3E083754532CC011C1FA3B4@G08CNEXMBPEKD03.g08.fujitsu.local>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-oe][PATCH] sysdig: 0.1.101 -> 0.1.102
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
X-List-Received-Date: Tue, 25 Aug 2015 01:21:02 -0000
X-Groupsio-MsgNum: 56978
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C98A4D9D-0D2E-452F-8501-2531071E6796";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C98A4D9D-0D2E-452F-8501-2531071E6796
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 24, 2015, at 6:12 PM, Bian, Naimeng <biannm@cn.fujitsu.com> =
wrote:
>=20
> I got it, will be noted at next time.

You can git commit =E2=80=94amend this message and send a V2 as well if =
this has not yet been applied.

--Apple-Mail=_C98A4D9D-0D2E-452F-8501-2531071E6796
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXbwvwACgkQuwUzVZGdMxTN6gCcDqKk6tz/5flrMynlbrfmIJYo
/QQAnRklQTeoYuuNDblT/2QgWZVuVDMR
=QGI9
-----END PGP SIGNATURE-----

--Apple-Mail=_C98A4D9D-0D2E-452F-8501-2531071E6796--

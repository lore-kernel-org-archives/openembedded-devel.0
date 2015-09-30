Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 81DB677056
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 15:06:07 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so43253747pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PA46foj1xYAJOzIS9fEKKbWv2ykFD+I4Tr+JaHE0wgY=;
	b=COtiHqBd9wFqXMTwZjwwSTet4KcWsdVG95qPhR6tp53BIRqAkKf6RHHQ4VlsozIDAX
	PqcJ9LbVL0gdrlj7D+qwIsZfAfY10m0/cr7BVAYs0yyKRL7GrQQV8NauRQ4gPrgUjkov
	D1gNCIYJFy+37D606Ox2Md3uuxxR3CZoPkSSkY5/DVLfz3FGcnN6iEFoUTQLFn1YBK6a
	lweNcjQkyOLVzv//3PFeQH/TvSbceBzE+0tJJEYxW8aEChQoHne/sDWoiNwRE7gBLFIL
	K3Nv2z/v2hFChWAw+4x2mnyZV8h0F6uzxsCygiai3mwmXyE40xlPWt/8JOO4shaJkH0O
	v6JA==
X-Received: by 10.66.159.99 with SMTP id xb3mr5416101pab.131.1443625567299;
	Wed, 30 Sep 2015 08:06:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:1dd2:3410:e15e:5df3?
	([2601:646:8601:4580:1dd2:3410:e15e:5df3])
	by smtp.gmail.com with ESMTPSA id yp9sm1293205pab.1.2015.09.30.08.06.06
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Sep 2015 08:06:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <3684850.Dr1EhiOegx@peggleto-mobl.ger.corp.intel.com>
Date: Wed, 30 Sep 2015 08:05:56 -0700
Message-Id: <B0D588D6-E28A-458E-89C8-10B591F4998F@gmail.com>
References: <1443601616-25650-1-git-send-email-ulf@emagii.com>
	<1443601616-25650-2-git-send-email-ulf@emagii.com>
	<CAMKF1spL0-FpdJVNrPjDQNfrGzHztqUqCjeHR2YBtRbvBSH=Ag@mail.gmail.com>
	<3684850.Dr1EhiOegx@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3094)
Cc: Martin Jansa <openembedded-devel@lists.openembedded.org>,
	Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [PATCH] Use GFDL-1.1 instead of GFDLv1.1
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
X-List-Received-Date: Wed, 30 Sep 2015 15:06:10 -0000
X-Groupsio-MsgNum: 57598
Content-Type: multipart/signed;
	boundary="Apple-Mail=_601624F5-FBCE-418A-81EB-98FB6FE508BE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_601624F5-FBCE-418A-81EB-98FB6FE508BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 30, 2015, at 4:05 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Wednesday 30 September 2015 03:10:56 Khem Raj wrote:
>> On Wed, Sep 30, 2015 at 1:26 AM, Ulf Samuelsson <ulf@emagii.com> =
wrote:
>>> -LICENSE =3D "GPLv2 & LGPLv2 & GFDLv1.1"
>>> +LICENSE =3D "GPLv2 & LGPLv2 & GFDL-1.1"
>>=20
>> IIRC both are correct
>=20
> I don't think we have an SPDXLICENSEMAP entry for this though, so it =
won't be
> being mapped (unlike GPLv2 -> GPL-2.0).

Ideal would be to have this entry for consistency

--Apple-Mail=_601624F5-FBCE-418A-81EB-98FB6FE508BE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYL+l0ACgkQuwUzVZGdMxSsqACeIvvW6HbeP5ysmktYX741+sjq
g9sAn1+lSXwSw+Tzd3PIp7mDghP9eamr
=0xl0
-----END PGP SIGNATURE-----

--Apple-Mail=_601624F5-FBCE-418A-81EB-98FB6FE508BE--

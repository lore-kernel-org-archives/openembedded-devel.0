Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A814377D2F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:37:46 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id o123so11291355pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=ArskOs23kxB/8tD3I66p5LEx39qYwF8aPII5NMD1OFE=;
	b=ilL6Yrh/iBNIiTjio1hjVmyn4hW/as1PiDdl69c5sQt9cXPUd0TwvRCsh8v52GAPo1
	QR8tooOMor8h1495CiqmEKlzZ2R0e1SGSAyzxU1smNAEHjLqmN757aR/gf/y5yNVg/2G
	TQ+1vCsHPpR745M/Bkdf3j4+okFAv78PHir78LxCqWyN0BXoYy0POuTagsEWcVkmMOTw
	IzhprDmnbGMl8FJczQZldU+JJST4qiYA5YDWRexp356Bjxe1uYuLtlEbfWlbNd0u0t72
	rlQQCXO+bfibBSrFv9MsVuPFdHDSbyUzUDemntirMjwgIQj8VYXd6XgHOVMm4GZAZRce
	91Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=ArskOs23kxB/8tD3I66p5LEx39qYwF8aPII5NMD1OFE=;
	b=M+3fhijYnN7x7piQz3r/X0DBK2RDio88UDPDmVbJXb05VKw88cW7tDb/FQH0vfLVVn
	9wecsXR3YEylQlAD70LMsLI6AKi5twOCVpvgPz+1mb9wopDcTd6Ov8/ZYnwcu2rXU2UN
	S3qW4WNG9+rukiDShyGyiKvvATa6AB0kNGtpJvFZ3MNdOobL2mznoq9OaV/Q9zVnKyV7
	q7kIKD9DXRN3EUqGYMMBw58muAEwn7BNA/sMxaRsJYTIwznEhlZX87H0X/zwpR1332XP
	jvUJQWoA8S4sQ85Vhn1ep/CygvpK19kO9d/RhbYyW6uamlPD5gp5stwflWYpqCfKU5HS
	wSjw==
X-Gm-Message-State: AFeK/H3dSayTX2UYcbv2Uwq0TgBzt3xMew8JhhS1KkyB+j7RsgK7jilYm2t4yA7JSiSfGA==
X-Received: by 10.98.147.195 with SMTP id r64mr560029pfk.207.1490891867573;
	Thu, 30 Mar 2017 09:37:47 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:bccd:dd0d:39cd:978e])
	by smtp.gmail.com with ESMTPSA id
	t15sm5587233pfl.25.2017.03.30.09.37.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Mar 2017 09:37:46 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
	<20170320053152.29352-12-raj.khem@gmail.com>
	<20170330094519.GC3060@jama>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <4a1ebfaf-2b4c-4388-569c-9bb354ed247a@gmail.com>
Date: Thu, 30 Mar 2017 09:37:41 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170330094519.GC3060@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 12/16] picocom: Upgrade to 2.2
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
X-List-Received-Date: Thu, 30 Mar 2017 16:37:46 -0000
X-Groupsio-MsgNum: 65990
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="TbBvxGN0obcKcaqPrLJObiCxntBaHMPWK"

--TbBvxGN0obcKcaqPrLJObiCxntBaHMPWK
Content-Type: multipart/mixed; boundary="stxOL3AkSxquvk5PrxPUQtAaFBJi7MUem";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-ID: <4a1ebfaf-2b4c-4388-569c-9bb354ed247a@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 12/16] picocom: Upgrade to 2.2
References: <20170320053152.29352-1-raj.khem@gmail.com>
 <20170320053152.29352-12-raj.khem@gmail.com> <20170330094519.GC3060@jama>
In-Reply-To: <20170330094519.GC3060@jama>

--stxOL3AkSxquvk5PrxPUQtAaFBJi7MUem
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/30/17 2:45 AM, Martin Jansa wrote:
> On Sun, Mar 19, 2017 at 10:31:48PM -0700, Khem Raj wrote:
>> Package has moved to github
>> License file got some cosmetic changes see
>> https://github.com/npat-efault/picocom/commit/13fd331d410c2e8c39fa041b=
d54c3b0a93df64e1
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb | 22 ++++++++++++++=
++++++++
>=20
> lcdproc doesn't belong here

Squash gone wrong. Drop it for now, coming in new pull.



--stxOL3AkSxquvk5PrxPUQtAaFBJi7MUem--

--TbBvxGN0obcKcaqPrLJObiCxntBaHMPWK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljdNFkACgkQuwUzVZGdMxROeACdFfhx92XQPxsOYd2Z4n3n2DA+
MmsAn0A7sTfbYzaR5IVbh3u2g/VjyX2o
=rV5h
-----END PGP SIGNATURE-----

--TbBvxGN0obcKcaqPrLJObiCxntBaHMPWK--

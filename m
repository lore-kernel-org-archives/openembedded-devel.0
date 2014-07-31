Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id CAC8E70983
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 10:07:21 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so2477391wgh.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 03:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WtcdPM9MKAMBrJd5wxeUNZhq4lC+ukbkr+QvxFWDYYk=;
	b=EDyvAOLwdoADuczDjTofXpDEYfSWx1ySoJoDFlYRY+1wylTdEHq70jhsBh7BrgWslM
	nLh3H1Bhk4EIbxnek7xZDnoHVIGnSvwKvq6CsGPK1V2z97uCqvrVwG2yjiJnVRyvpqCB
	Qo9gvujbM/sH1JWsaUB5D7oC7H94+s/ZF+JnWVztctKVzcmBf/XYMqZW4EOZYeMZ2J8k
	HHBgyIHQpbUvgJeYGjCWgcnwXeRl0EBJWGqldwmdr+P8HwMcCeHpMmCBcdgARZp40Hz3
	2gBHLSn2GE5ArJaxTbP5acVXzyO8etdN62mxeyhmjquY2AuLmulLd+pI9wXE3znMEKj9
	gKRw==
X-Received: by 10.180.38.51 with SMTP id d19mr14478618wik.10.1406801242661;
	Thu, 31 Jul 2014 03:07:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ge8sm15413292wib.4.2014.07.31.03.07.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jul 2014 03:07:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 31 Jul 2014 12:07:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140731100745.GW16445@jama>
References: <1406637609-27046-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<20140730122758.GN16445@jama>
	<8672BB614B4CCA40A6B3BDD6FD82050BAA134DD7@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050BAA134DD7@COSNADEXC13.usr.ingenico.loc>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] jq: upgrade to 1.4
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
X-List-Received-Date: Thu, 31 Jul 2014 10:07:29 -0000
X-Groupsio-MsgNum: 51342
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vRjLMflJ/YJvC+Q3"
Content-Disposition: inline

--vRjLMflJ/YJvC+Q3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 08:56:04AM +0000, Matthieu CRAPET wrote:
> Martin,
>=20
> Sorry I forgot a git diff. Please replace with patch v2 in master-next.
> Thanks for your work.

Was it sent with -M? It doesn't look so.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vRjLMflJ/YJvC+Q3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPaFXEACgkQN1Ujt2V2gBzc8ACglT1iK2dhezx0ZOzwGzIZznnh
7XUAoKxJH1EGi2Ix6pIVpvesAKCeWEhx
=LgTs
-----END PGP SIGNATURE-----

--vRjLMflJ/YJvC+Q3--

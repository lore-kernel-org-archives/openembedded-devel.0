Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 607A9772CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 12:18:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r18so5500500wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 04:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sLYxhDRYBjNSDRmHEW8SIAxeE2e1SxJGy7FiAz0KPAo=;
	b=ku6G6YkTTC0QViuMO7qifQyGL4NhwWB5q1qdR2psQWBMfQ8QHeY575gAYclU0KbaNn
	bzS4CWhlxNZ/V6B7aOTtmm6A/GFcpnd9ryd9Gp+C4Olv/OTiUbB3jvCQrj9Cr9xEL3hy
	uj0q5sKh1jIYjQjrvXMg2nyIu5k88MZP2IABluS811pqZ1DxkrGDyRjTABF7jvdi/eLy
	O/ISOGhcHVOZkxecYuHZb6f3rutu//UUkbbEyRrz/p/Zp5WhkIESVJAnw9eiHtVRCdvn
	UkIx8fWeSS52LcqQPZxbf773Pwe0JiNuR+Uu/zzr4Vjn8VcnOfNXtL+mReI1QtWTyxrS
	eUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sLYxhDRYBjNSDRmHEW8SIAxeE2e1SxJGy7FiAz0KPAo=;
	b=IZht1jLRpY7QREbf36C/Q6n5rSzr2OQjeEericdyt7cT4NzpxfAwWbRDLmB61GgnDJ
	rxhh9U3WP/fL98mor7rzMr7foKY8cZNDGlrJgy+PIEGdYGnweTgQKv3bnTaVXVtWntLm
	FB3k/2XhEsaUumU9Jh4YrCZ/Ck+z1UpzudOjpHRzj2Uwlf2CTsPLIYQQhxj5JcnalR8w
	t+htDGgAezSebi3kSc9qtipTcv0mlIzyK81Ju+s35CHxyheiYUbzU32EeQ7OCJGr93fG
	x5hMmsusVEACR4e7lQQBcxs9/L5qflOu/pMVqBXQLt/ImVElpNNQo8C/HJeQYujN1pDa
	5FpQ==
X-Gm-Message-State: AIkVDXLDO5UUOW9KurytcO/DzK/Xu/4sCHf2SMnC1wcj36oIaKN1XkBT4CmSMWP1GZT+Ug==
X-Received: by 10.28.158.82 with SMTP id h79mr14944187wme.30.1485778684904;
	Mon, 30 Jan 2017 04:18:04 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u47sm22615063wrb.15.2017.01.30.04.18.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 04:18:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Jan 2017 13:18:05 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170130121805.GA13746@jama>
References: <20170127101200.25785-1-patrick.ohly@intel.com>
MIME-Version: 1.0
In-Reply-To: <20170127101200.25785-1-patrick.ohly@intel.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [PATCH] multipath-tools: update to 0.6.4
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
X-List-Received-Date: Mon, 30 Jan 2017 12:18:05 -0000
X-Groupsio-MsgNum: 64933
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2017 at 11:11:23AM +0100, Patrick Ohly wrote:
> No particular reason for updating besides following upstream.
>=20
> Only kpartx has been tested after updating! Seems to work as before;
> unfortunately that means that as in 0.5.0, "kpartx -d" doesn't do
> anything.
>=20
> Upstream refreshed the COPYING file, hence the checksum change:
> $ git log --oneline 0.5.0..HEAD COPYING
> bf05f63 multipath-tools: replace COPYING with a fresh copy from gnu.org
> 1d6c88a Update FSF address
>=20
> The QA error that do-not-link-libmpathpersist-to-TMPDIR.patch fixes
> no longer occurs because upstream changed that particular part of
> the Makefile.
>=20
> A new patch is needed to avoid building libcheckerrdb, which depends
> on the (currently) unavailable librados.

FWIW: it would be even better if you mark
https://patchwork.openembedded.org/patch/136518/
as Superseded as patchwork is where I take patches for master-next and I
need to remember that there was e-mail reply for this one that it should
be ignored.

Thanks


--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWI8u/AAKCRA3VSO3ZXaA
HCnuAKCCzDO/kBraXoJQJR3vsIGg3t0uXQCfelqLnSm98VnQE59byT1iB3BkeQ4=
=Lf9r
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

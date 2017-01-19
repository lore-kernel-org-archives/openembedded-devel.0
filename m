Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C2B9B71AEF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:44:27 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d140so11401316wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 03:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FH1RIezzaeEkxwzhFkL3C/QOKN+E20PY24JY+3QhjkM=;
	b=n9rKBr+qnwAygyopMgaYu4UtwiEK3Pm1XPryL/l1XobmmhHAWQ+8QSev5Vrgr0Q4E3
	Arlfpo8JksrVRt7YRoaCs+HYJ2SXItnqUz0JOlhsIcD4AX+k0sgAJuS1dlPiMc0tvJyA
	QQKu5nAiBAj0iHVaw4uNOvJuQU77ICFLQQ5qfaSBjPEbpA0jh47Hwj53qMBkfGHTSEJ8
	YnNtNSs9f11jKVfqJAAg2BcFZHpw+FMnDjJnn8/ekjNjmnMKAG4d8JcbEEjkJaYbu7Yl
	VA/Fh33pW2Vfps0yvAOouK82U0CLYiG1SuwxJmpSQ8+ShqLOn7h5c95cgFIoz1dbtC98
	q81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FH1RIezzaeEkxwzhFkL3C/QOKN+E20PY24JY+3QhjkM=;
	b=WwdIoJhfNUbwZavQZFif4HjStecfyyF6ltfIMBrqtcImVfYd741dRQc9/ganPJG69v
	yVtfTgDsbaJcL1jtrqcyV/b8A3+ytQ7jN8ES4R2TnA5dVu821UhpuUgQa7VuJLcY70un
	lMzBW8Dc2qqBevaqmb3M4hqSFv0lcqAnHc1qOlighsAH20TXAb7cY+khgbg7/yOPBN50
	Hm0o8P4OFOGJbPpLYGjz5Q6zAvvy91OdxmfdkQHUXaiarmB3QwD1fo6nGtO1yd0WTXLj
	1d1fLQT+hblXprmqeYFs3KPI7HnN8spRQf+Fb51MgacwuaCSKfpmweJEerBvOzDnVvsN
	NVhA==
X-Gm-Message-State: AIkVDXJ/x4GgPIsKAGixDdCmW73eYUl98wXyI14fBQEPV3JblfYIrnUN6B1JLQF0o+xScA==
X-Received: by 10.28.188.9 with SMTP id m9mr6513104wmf.79.1484826267536;
	Thu, 19 Jan 2017 03:44:27 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id r6sm12250666wmd.4.2017.01.19.03.44.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jan 2017 03:44:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jan 2017 12:44:29 +0100
To: Moritz Fischer <moritz.fischer@ettus.com>
Message-ID: <20170119114429.GF3265@jama>
References: <1484175013-360-1-git-send-email-moritz.fischer@ettus.com>
MIME-Version: 1.0
In-Reply-To: <1484175013-360-1-git-send-email-moritz.fischer@ettus.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: koen@dominion.thruhere.net, mdf@kernel.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v5] Chromium-utils: add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Thu, 19 Jan 2017 11:44:28 -0000
X-Groupsio-MsgNum: 64791
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Content-Disposition: inline

--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2017 at 02:50:13PM -0800, Moritz Fischer wrote:
> Add a recipe to build 'ectool' a utility to interact with the embedded
> controller on Google's chromebooks (and other platforms using it).
>=20
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
> Changes from v1:
>=20
> - Replaced DESCRIPTION with SUMMARY (Martin)
> - Use EXTRA_OEMAKE (Martin)
> - Removed FILESEXTRAPATHS (Martin)
> - Changed PV (Martin / Khem)
> - Removed FILES_PN (Khem)
>=20
> Changes from v2:
>=20
> - Changed PV (Martin)
>=20
> Changes from v3:
>=20
> - Patch now against meta-oe (Khem, Ross)
> - No longer need patch for HOST_LDFLAGS since merged upstream
>=20
> Changes from v4:
> - Change commitmsg (Koen)
> - Install to ${sbindir} vs ${bindir} (Koen)

Fails to build because of missing dependencies, see:
http://errors.yoctoproject.org/Errors/Details/117457/

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWICmnQAKCRA3VSO3ZXaA
HN8qAJ93FEYCxuZcU2sjtRPIqLFElMmAhwCgt8IKQbbuu6qqf63oy9WUPRYI7C8=
=MuRP
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--

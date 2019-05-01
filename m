Return-Path: <trini@konsulko.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 86DE86BCA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 15:27:53 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c5so24940700wrs.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6UxjDs4kiWTXHvrjEXdNjfSjkeri/oJLUp+j6P0Bxzg=;
	b=Zs9BFHwdJJ6xDdd57NfYBJEqyrfQhzBQHWHwXTD8+BHN4j/NLAX8fzzhVSdygR7H6Y
	4qcOxoELemyLij6DmkWAJBgfPziaBaGg8h0xcX/SE5Ma2+9ixTVKeXKugdaJUda2OhJ6
	3Iy20owAVy7svUqGQl50IPv9RkTIuxRjD5tyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6UxjDs4kiWTXHvrjEXdNjfSjkeri/oJLUp+j6P0Bxzg=;
	b=sv9Mqkno6YphSqF22/+SgbcBAXcUEM5VEs4tRjgU2tEDT2dEEGc/ikJaezyKsWOYlS
	uFnnKhHs5bQOVH9LriT8tXuan4xZLix4KEso5iH5+0q0LKBrNNRpkfKFF+f2+ivGISJX
	HODRl9urPBBPQQr6pWJleOXcPtKdJT8Umez+/NqaGfoKj1wP9kzkZcpZact3my/0uukj
	jQ2BaKvrr348GVR3231iZVo1yH1M62z+TkaX1ll1lPNA5A4dWDgyuFNR/g7uCO/RHepP
	qqBIjqpK0TmnL7hyMJrkqnLML93vUZv2PX8NVy2p+bPgVT3msQVAP8xJUe4DNUD98PYS
	HBRw==
X-Gm-Message-State: APjAAAU391g9VAe1pvQe7Eu+xA94kxpxUW6Aa+8zvw/ooNHIq6vSkX+m
	eA4vdCTCBqJIFjf5ryOBWBhpoA==
X-Google-Smtp-Source: APXvYqxWv5fxrAQ2aSffgwCE+KbFa7bPgOlmqS04caRdIE0Nr+dzuKkO7nzdQYzEXmgbvpMSPRgTRw==
X-Received: by 2002:adf:dfc3:: with SMTP id q3mr6741031wrn.192.1556724474161; 
	Wed, 01 May 2019 08:27:54 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147])
	by smtp.gmail.com with ESMTPSA id y70sm9734429wmc.8.2019.05.01.08.27.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 08:27:52 -0700 (PDT)
Date: Wed, 1 May 2019 11:27:48 -0400
From: Tom Rini <trini@konsulko.com>
To: Armin Kuster <akuster808@gmail.com>, Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20190501152748.GY31207@bill-the-cat>
References: <1556722320-17827-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1556722320-17827-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Wed, 01 May 2019 15:27:53 -0000
X-Groupsio-MsgNum: 77369
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fO7+M44thruaA0HF"
Content-Disposition: inline

--fO7+M44thruaA0HF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2019 at 07:52:00AM -0700, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  README                      |  2 +-
>  meta-filesystems/README     | 12 ++++++------
>  meta-gnome/README           | 10 +++++-----
>  meta-initramfs/README       |  8 ++++----
>  meta-multimedia/README      | 10 +++++-----
>  meta-networking/MAINTAINERS | 32 +++-----------------------------
>  meta-networking/README      |  6 +++---
>  meta-oe/README              |  8 ++++----
>  meta-perl/README            | 10 ++++------
>  meta-python/README          | 12 +++++-------
>  meta-webserver/README       |  8 ++++----
>  meta-xfce/README            | 10 +++++-----
>  12 files changed, 49 insertions(+), 79 deletions(-)
>=20
> diff --git a/README b/README
> index 7318f09..881115e 100644
> --- a/README
> +++ b/README
> @@ -1,6 +1,6 @@
>  Collection of layers for the OE-core universe
> =20
> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Warrior maintainer: Armin Kuster  <akuster808@gmail.com>
> =20
>  This repository is a collection of layers to suppliment OE-Core
>  with additional packages, Each layer have designated maintainer
> diff --git a/meta-filesystems/README b/meta-filesystems/README
> index 87cb685..d9f07df 100644
> --- a/meta-filesystems/README
> +++ b/meta-filesystems/README
> @@ -10,30 +10,30 @@ Dependencies
>  This layer depends on:
> =20
>    URI: git://git.openembedded.org/bitbake
> -  branch: master
> +  branch: 1.40

I may be starting off on the wrong patch here, but, did 1.40 or
bitbake.conf ever get patched up such that rm_work doesn't cause
world-rebuilds every time?  I recall when digging into this before there
was a "maybe if we tweak $something it'll be happy again with this older
bitbake".  Thanks!

--=20
Tom

--fO7+M44thruaA0HF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcybr0AAoJEIf59jXTHXZSfx0P/1lJlMLDonW1hOCjWLiRroJW
3HhR4z6u3V3GOL6eun2pec53VPQ8b4YCKqfnRUwkc4CMAH5UEMoMw21xs2/Gl7Ma
5NG/cSVyk/7WaDRqAcOlL0lPa6N4VwuoFkAvu++FFgdywDM7UA87bzN7dCqwNjgY
tGNQVdxkb8HBIYU62/QMHCg7qxBsPGntOFVWUkNmInxVZ221O7FuSitxtFEfNgTH
29mXDOwWnjwDvagpBXsLxRPgLUBAeCcSzVoePLRlUcHhrwUHCFVApPPqjBdPDV3l
pzEzv6IJP8h9SYeXuhdfHo4tM5Wj8tZSo6ZqVwfD20Ft4izfzT8HpoUQZl4gEgJC
KqL76+EmxNOvbiJ1wo+phKUU6y2Egn79GG28Bly4+umNkWRmx8laH+XvxReclo15
bs0TlkwWxgKQNy4Pc+X9viv+uH33vL9E0wI61w+1pTGuPoK51zjnhfdja6oAyog0
9mdUX/HktbO6Bnx8X6xXJw1NNGV4Tpic23VtYotyDOO4ipD28IPLpD/pCVc3LQHG
FLhlzXa4FpXNYqLAChhiK21aStOQ/XRDQXENOmET4XjD50NM/CvJItjNcjYQa7Er
FhFFde9by0RNNERvq5DmXcVeE9cJZht7B2K3uTTu3UlKiMpLrTyqAWbh3x3tG+bJ
jMTqs3cYweDRUrSOGaxo
=oYEO
-----END PGP SIGNATURE-----

--fO7+M44thruaA0HF--

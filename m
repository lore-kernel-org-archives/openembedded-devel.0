Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 523DE6FFEA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 10:52:08 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p65so23046592wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 02:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+VTl3eTEWyS6UAebOCF8G5azL+ndTDCTj8aKJXw1eeE=;
	b=yD+U1aTAMjTMKOTKecMqNw1owALI4BMQU1rKnLxlu9IKLP1/ZS1qrPItJ+LFPqLA2x
	xAD+ALs9YW9dDmjP9sF0JMM6ONdUYO9s1eqGog7H5FQfG0hY8Utpb0JZTIIwTAe1tXku
	8gXeZxHY/tvbLWf9qHNDfhrzRkqQ89Wi0wW143bNHrm0iXkew9D60CvUhF8FPpSGiDyg
	NKHOASCslYYeH73axUrUs0f89gDlbgYpvhRFecSSEUvnkbdpTbJJK2EwvR4ICUDgBtVx
	rj1jEKwYpyP7qgVT+RddtfD/Mur7WzvfXjmaYpts8wrulBQP4BiUvXJXC1vj/baBr9Ef
	rL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+VTl3eTEWyS6UAebOCF8G5azL+ndTDCTj8aKJXw1eeE=;
	b=YsM8yaF5SAX6Y+N+4ZZQdaKqArQEmOZcpH0wGBOlEyPgtc+PvFXvtDjxjkk1HCtXhP
	JzY1PN9Rs/huEbW/jY0Je2t9Hip6MLcIIr/N26qV2pwzomAQqcrT6+aVF03WFeZtty4j
	tQeL0Yxqy223aODe36HMrfmoAsTaZEyUzja3BF4UvKbesocEsy/7zkeDttdjPxHaqeYo
	Mben1LKW4FVbilLIRqkzpmLe1bZdb8MU6J0CISOXAXSSOkC+is8F0SyoH+qMGxOOX0V/
	rxQdl1uLf8Yf3yckWBizsFOeTRAcEzgGB/TyVMWwzy6iGfCPJ0rYg2AeS58oQB71cJk9
	ek5w==
X-Gm-Message-State: AD7BkJKi/50sw+dxqeA02qvPdz88VSxupvpMdBl4x9Be+X0nqq8qj0QCqYgaiypcX4N7Pg==
X-Received: by 10.28.136.211 with SMTP id k202mr3219005wmd.93.1457607128472;
	Thu, 10 Mar 2016 02:52:08 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hm9sm2889683wjb.34.2016.03.10.02.52.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 02:52:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 11:55:06 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160310105506.GB2573@jama>
References: <56E14145.4040706@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <56E14145.4040706@mlbassoc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-webserver] modphp
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
X-List-Received-Date: Thu, 10 Mar 2016 10:52:09 -0000
X-Groupsio-MsgNum: 60451
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline

--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 10:41:25AM +0100, Gary Thomas wrote:
> Anyone know what happened to the recipe for modphp which was
> in meta-oe (maybe before meta-webserver) circa 2013?  I can't
> find a recipe for this anywhere.

Why not try git log?

commit f81961ff20d669e0f472f45b9922d6f62ee0d330
Author: Paul Eggleton <paul.eggleton@linux.intel.com>
Date:   Mon Jan 5 10:24:53 2015 +0000

    README: update for modphp merging into php
   =20
    Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

commit 06af52095b5be1cb21a7dc9a6a6e05d01f6e7a00
Author: Paul Eggleton <paul.eggleton@linux.intel.com>
Date:   Thu Jan 1 23:34:29 2015 +0000

    modphp: remove
   =20
    This is now built out of the standard php recipe.
   =20
    Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbhUokACgkQN1Ujt2V2gBwzOgCeJfaruJZxLGXmzISDxzJuSiMz
xA0AoId0GCT5IvyCWYE5d6vK/cC7mws4
=HYnS
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--

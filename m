Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A63160043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 09:22:57 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c82so12772927wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ESJVRp9L5XBlo6RVh5GC56S6dm2clLqBWhZ627TdAOI=;
	b=Z+epfL89gcxexza9oMlPGMc8yi3Ol9GbWP3eHlyzNVxeW0s4aLG9SlBw4KHZ0fg4/n
	g3TqHOff5ukc3ev53U7SYCr1DqZYWsCQ2OzIPZQQ0hhcal7FDLQ2AgEZDS2wIk2GzKk9
	jzl0OGuMYh+X5q3P6LAQJw+4y1qkODk/2bgMXdfDxuWZiw142oDNRslivyDpcqeZ3Xs7
	5rsfKGFtlqHqyTDdScQAgCWEG+oFQ/o0O8ENlnoJnmfhXg6tBpLzI/QmGQOlSUleFaWY
	PoUHRXQF961JQVgRgiQefGDvlCTAuOKm/8gQEDCoPUH+nI5lWrr9o4HcD1myR9JsNn4o
	62iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ESJVRp9L5XBlo6RVh5GC56S6dm2clLqBWhZ627TdAOI=;
	b=TKksOCe8s+O+P72IYsk0Zm7/k+J+WqbJrVI2tJgUjnZdbxgfK2BBBF2HITxCn39bRj
	R469S+sin7o7AZqRt2jxSky/R6TIrUbfC+ma8Rn3jAS9NoFO/auvojgR04LRM3GwZ/Ej
	+upxCzXIDoxVQzgfIkLYKfBfkgMFvVQxlbHZ9HKiRDTwOwahQbjREchH4tt+zlQObuhq
	yn/ib5QiKLGHhMlD2RJXOqgKrxR5PKu67p6bfXPTnZD+MMTe9ot8lbSiw50wBwZKtOnf
	KXFa5IOwPQtWvEt2DeZOms3JuIXgO2BJCuWXNgbMBapUlOiGdnnfJh9P85/zXYz8G8q4
	sr6A==
X-Gm-Message-State: ALyK8tLFi35BY7gD9HbShGlCu/XkcKHEyzupCT2ARuNwyucKoJNT/ULT79KdHckTzGy3uQ==
X-Received: by 10.28.125.81 with SMTP id y78mr8265880wmc.5.1467192178146;
	Wed, 29 Jun 2016 02:22:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	w76sm3196651wmd.11.2016.06.29.02.22.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Jun 2016 02:22:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Jun 2016 11:24:02 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160629092402.GA2558@jama>
References: <64fedf2a-0ac7-1c88-fb2e-132ad5cd5690@siemens.com>
MIME-Version: 1.0
In-Reply-To: <64fedf2a-0ac7-1c88-fb2e-132ad5cd5690@siemens.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: otavio.salvador@ossystems.com.br
Subject: Re: [meta-qt5] Update master to Qt 5.7 release
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
X-List-Received-Date: Wed, 29 Jun 2016 09:22:58 -0000
X-Groupsio-MsgNum: 61989
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 07:59:04AM +0200, Pascal Bach wrote:
> Hello
>=20
>=20
> The meta-qt5 master is currently on a pre release of 5.7.
> I would like to update it to the final Qt 5.7 release.
>=20
> I saw that the commit of the latest update involved a lot of changes acro=
ss many files including updates of patches.
>=20
> Now before I go and try to change everything manually, I want to ask how =
this is usually done?
> Is there a script or something?

There isn't a script as such, just bunch of bash snippets in my bash
history.

There are forks of couple qt* repositories in github.com/meta-qt5 for
most modules which have many or more complicated patch files applied in
meta-qt5 recipes.

Then I rebase e.g. b5.7 branch in each of them, use git format-patch to
refresh the patches and update SRCREV in the recipe based on upstream
5.7 branch I've rebased on. Then at least build test all recipes in meta-qt5
(I use only small part of meta-qt5 on any devices I own).

Otavio said he will be working on next upgrade, I haven't seen any patch
yet, but maybe there is some wip on his side.

Similarly with 5.6.1 in krogoth branch, there was some incomplete
pull-request on github, but I haven't seen any patch on this ML yet.

I'm busy with some other stuff, so I don't plan to do it myself soon.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldzk7EACgkQN1Ujt2V2gBy4EgCfXBoynbnH8gjH2VQ74Go3nefG
2EsAnikGzGh7aAYbWP2Aq7bmxW+PUXOy
=ba1j
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

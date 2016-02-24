Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 69DCF77212
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:51:15 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g62so5589892wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vnhSwotdhLS9/1X2GnXqoY36n7OGRGvpdmv6mq5fkUQ=;
	b=B4jWuvwQDSyvb7JIy6KeVsPhT1pdrUrl1Ags6XGnIdTPlq+4UVS+sE3Z4fmT4e6s2o
	6/TACHfwto8wpPKJjkTBXPoyM6b5c4pN7wTAA22NQ+IYopf2UKq9XPeVwNtWrc/0qbAb
	uZDT1fQr4LU0vJcp/5i6NqgoJtulMI7HDmhmRQ3kN80Fp04hgmqy5vOPUz1fF6/JppBM
	RKbFCjMOG2CqaXSo5fWvFYIrXGoZeAipFVGwjtkVPcz+T03RVoE8NhCedhmKZWcXMM+u
	CtUwmuEPvQJ2C+lUod1pSKT2A6jFgiBLAwKLzlWLQrkQhDCNlAhZEkYwZxIHv5kdDfCm
	Wmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=vnhSwotdhLS9/1X2GnXqoY36n7OGRGvpdmv6mq5fkUQ=;
	b=HSwmM1TRu87rj09fewY7+haHqYib3QMbZOAIM0n4a475i3eiK8aT1ZNga0jlI/HfCa
	FjGesnRF0FMpu+FYO8hCz2zr6LbUKqR1RS+ilR6Zsf2nf8UKdEo+8pD4fcOo8skBABIR
	YdE4A77ohrTISOxut2YtJ6Ei+UWWMu9MkF7cJPQcA4wqcdVA60+p2UkdpYR5xf9Dbfyw
	cJPBShEfLadCZQwzeELHHfaMIJaoNoyBorgCxfUa/H1Ho+3l5YjkkUPWMlUdnqY9/HAV
	JVLoMyXbvIQ3YDvHNmAmut8CG1z0tRGRk7UL8N4YNYFBnDZhrCQikPK+QnNmeAWfc1RW
	mF9g==
X-Gm-Message-State: AG10YOSq3nwsYrZhjp2m2ZiDp2TtL2417wNuMPXHhQpzlMZyf4J6xwHMh91KAO+usIzhMQ==
X-Received: by 10.28.100.7 with SMTP id y7mr25549200wmb.87.1456321876552;
	Wed, 24 Feb 2016 05:51:16 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	y3sm31422160wmy.17.2016.02.24.05.51.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 05:51:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 14:52:22 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160224135222.GC2560@jama>
References: <1456319258-20502-1-git-send-email-Martin.Jansa@gmail.com>
	<56CDAF3F.1020307@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <56CDAF3F.1020307@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-gnome] tracker: Blacklist because of packaging issues
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
X-List-Received-Date: Wed, 24 Feb 2016 13:51:16 -0000
X-Groupsio-MsgNum: 60185
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Content-Disposition: inline

--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2016 at 03:25:19PM +0200, Alexander Kanavin wrote:
> On 02/24/2016 03:07 PM, Martin Jansa wrote:
>=20
> > +
> > +# writeback-modules and extract-modules are packaged in ${PN}-dev
> > +PNBLACKLIST[tracker] ?=3D "BROKEN: QA Issue: -dev package contains non=
-symlink .so: tracker-dev"
>=20
> This one is fixed in the introspection patchset (although I bundled it=20
> with the introspection fix, so you'd have to amend the commit).

OK, thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbNtZUACgkQN1Ujt2V2gBz/2ACgjRNaNXD6Nq5WuThrpTcMTrHC
8AoAoJHIuSmCkcdmEHypZI9j61JcwnSk
=B2+S
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 704426D4D1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Nov 2013 18:20:28 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so700217eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Nov 2013 10:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i7m/BqFlM0wn27HiUdWPAxpFzuCTCcm7HJ+y2La8N7M=;
	b=H9uVJH1ToU6dQFKJcklIXCJx44+vmjQ9CTMtf+6zGQq4UU6WiKIEwzhpbIwHBHon2b
	4uBfCMySNSNtAOSLvUpNgFiRsfNjXzPnXu78iDRu02Zk2oa3sxzcfkyagdvKElTBESJN
	JEO/7Z3ZmycCeBgRNL90Ql/4QG4nPB+I6CIJ9FvSCLmmGsDjDBkS3qNMY+kUGKoucB11
	nGdP4QOBjqwsDnt736wID2SMEwPvN/5mQ/QRpnkcDOAi5Yg7FYRXAyBXkAy4eqBtrJ8g
	Qk5K2YrKPdu/dWFcoK4W+6tc6yBUAuYcr6QD4nENF5ldoUxjA/hR24+90EHwpto2K2fo
	1Hkw==
X-Received: by 10.15.50.68 with SMTP id k44mr3407147eew.54.1383502829867;
	Sun, 03 Nov 2013 10:20:29 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id w6sm36209115eeo.12.2013.11.03.10.20.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Nov 2013 10:20:28 -0800 (PST)
Date: Sun, 3 Nov 2013 19:20:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131103182036.GA3684@jama>
References: <1383491674-13152-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1383491674-13152-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH] cmake: match bbappend to OE-Core version bump
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
X-List-Received-Date: Sun, 03 Nov 2013 18:20:30 -0000
X-Groupsio-MsgNum: 46991
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 03, 2013 at 07:14:34AM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-devtools/cmake/{cmake_2.8.11.2.bbappend =3D> cmake_2.8.12.bbappe=
nd} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-devtools/cmake/{cmake_2.8.11.2.bbappend =3D> cmake_2.8.12=
=2Ebbappend} (100%)
>=20
> diff --git a/recipes-devtools/cmake/cmake_2.8.11.2.bbappend b/recipes-dev=
tools/cmake/cmake_2.8.12.bbappend
> similarity index 100%
> rename from recipes-devtools/cmake/cmake_2.8.11.2.bbappend
> rename to recipes-devtools/cmake/cmake_2.8.12.bbappend

This isn't enough, see
https://github.com/meta-qt5/meta-qt5/commit/b6df9940324fe8007fbbe7de0760754=
85d50a925
which I'll push later today.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJ2k/QACgkQN1Ujt2V2gByJFACfZ3yCJJ+s2QvaNsLXBY1lSL1h
7xUAn1gfhD/2zLlt9zSWHOhIo9JVJoVC
=uFv8
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 09A9660EED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 11:52:37 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so3968846eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 04:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=H8yGaSN5rtQG7/qtxgBrS7MtKxvPFJQUO5d5PXW2HtE=;
	b=Hp4MEHhou7O0UE8oYcNFElYWUqJRr1ArgEJV83FxsEw1EbkBduqAan8sFRG/04QGh4
	b0gEnW3auEXYHhPjBo8RSlyX90iLoCxX4hipHzzQcv1fXXx+98j77fV4uGgh6FCo6SzF
	hjuLPbHJdTbtWrpdVbdMRoaexFOWJmhB0FpEUH8mgCz8/opWFW+QP+oKWpjdwEf74N48
	sMbQzvmjiouYB3HdztESKSCcUVjWrZezROn5XiXorTy4+/9y+d3dvzkQrJvnt5G2e33E
	00zRG3/PMUCFEJjGUsZb5HblyNes1k6AZw1OMEn2vetS4L5lwtRJWkaAg+w5SG1MWdYj
	oYwg==
X-Received: by 10.14.241.74 with SMTP id f50mr204635eer.29.1381837959643;
	Tue, 15 Oct 2013 04:52:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm165706584eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 04:52:39 -0700 (PDT)
Date: Tue, 15 Oct 2013 13:52:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131015115241.GD3703@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Dora maintainer wanted
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
X-List-Received-Date: Tue, 15 Oct 2013 11:52:38 -0000
X-Groupsio-MsgNum: 46726
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline

--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

we have first few patches which should be applied only for master
branch. I've created dora branch from current master, but I assume we'll
backport few more changes to dora soon.

Any volunteer?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJdLIkACgkQN1Ujt2V2gBxOAgCgtTOz+d3+lq2BXA5eVPv/fGTJ
r24An3lTqvbQgTo8GuV0+uO5HeXh5mOw
=G/+W
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--

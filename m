Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4506D12C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 20:37:42 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id u56so3099621wes.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 12:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4xUoaI6pQIm8GXe4sUL97z8VwZ3/8UqYVFkRYVz4zD0=;
	b=d9vhBhhAefMcwlOusIyxV4nIWkUTI9sjUgoZ3GWLlVl4VBLUA4OGzU32G/N5wmXDnY
	qYkJ+65GUf8lLISz4gjn4md+x1A2D2c2yx5eUxuCwtokBP6n64fYK4UQ0fP3RTZs08eM
	ojMgk7h/LzC1uztiE2qc5Id5ExlRDFQQdClk3g3J9580okNhP+gZx6omg4hXwXFBOkKV
	7lDiVkF0hSZYrYrUTPd9BeRvc/fcIdJjXv3w/egrVtQfGyPNrt3ULtTRi4dhE1qSLX9a
	Cu3tTuGuhVXowVjMkEZ57CL4wo0eSLwr4KLErmwY1rbMrFaq//fIAO66uWje3+tsLJ9w
	cTKw==
X-Received: by 10.194.201.225 with SMTP id kd1mr2659151wjc.35.1385325460858;
	Sun, 24 Nov 2013 12:37:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x19sm40116009wia.5.2013.11.24.12.37.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Nov 2013 12:37:40 -0800 (PST)
Date: Sun, 24 Nov 2013 21:37:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131124203740.GF2870@jama>
References: <20131124210739.Horde.aOiwheD3X90dXR-wQmCqJw4@webmail.blazingangles.com>
MIME-Version: 1.0
In-Reply-To: <20131124210739.Horde.aOiwheD3X90dXR-wQmCqJw4@webmail.blazingangles.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: Unpacking nested git repos in recipe?
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
X-List-Received-Date: Sun, 24 Nov 2013 20:37:42 -0000
X-Groupsio-MsgNum: 47250
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cpvLTH7QU4gwfq3S"
Content-Disposition: inline

--cpvLTH7QU4gwfq3S
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 24, 2013 at 09:07:39PM +0100, Ole Wolf wrote:

> pub  1024D/F969F350 1997-11-28 Ole Wolf <ole@naturloven.dk>
> uid                            Ole Wolf (email address: ulven@r=F8dh=E6tt=
evej.dk) <ulven@xn--rdhttevej-i3a9q.dk>
> uid                            Ole Wolf <wolf@blazingangles.com>
> uid                            Ole Wolf <dnai@dnai.com>
> uid                            Ole Wolf <wolf@slip.net>
> uid                            Ole Wolf <ulven@r=F8dh=E6ttevej.dk>
> sub  3072g/BB305905 1997-11-28
> sub  2048R/85758E3A 2012-09-10

Use destsuffix param

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cpvLTH7QU4gwfq3S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKSY5QACgkQN1Ujt2V2gByYygCfeZGOqn+Ww0Px7FDzVpiysn4h
qk8An2Hy9t73MvkuE7ptCaSmik34Kb/o
=WH72
-----END PGP SIGNATURE-----

--cpvLTH7QU4gwfq3S--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id AF6167317F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 13:07:07 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id g62so26217869wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 05:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Plo1U21VKs4PEhVjU6yA5d02fYKII2kf70FbBPqrreI=;
	b=pdehsvl21AnlQ1akHFOo5cB/lMPLwQuJuR+5qql7zuymos5uYafrs7ebjOKEA7KOk3
	Yg3B1Nc4thn34OgXdXwPEp6w+pUMxemV0Uf66B3ixQmzg/wLl9TiRN13d0b4XFyR26YL
	nvWKP1NQ8+dZEBhS3B9NVLjInnYo5/rOw3PaykQOhTI08cKZn7I7QRnXN7rqcpNh2iLB
	xnJjQuIfUgeRWqTOC+b2GlKN1tIz+gfs9zdtrJpAA1eAxfyM84QNt//zaIWEU1HwJxUq
	K23nY9mWM9Q8TcElFA8aTmMQM4bV4YD6ALy9H7ic6VzxgoamC7J1r4HuyrGxfKG3hKSi
	DH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Plo1U21VKs4PEhVjU6yA5d02fYKII2kf70FbBPqrreI=;
	b=IWdLHHgmdzm/p2/BuNlXy8lGjd5D8UPopjTJXBznjNHrPe+5cfpnpbPMJGCIFGVfzE
	F67koMo8XaIJgROZBqTSYcr40Nt9cIejDe8Xf7mxmRRPQX3+Bc+m9uRZzxK/bw/3tVtc
	n2t64OpWsEJzEXJP3fmoEw2wKh641P0di64B9ljNbNuupltZrGBhNt6WJt+Vn1GY+8JU
	oYSNUQNqsXKu82+Jh4R84irhp700JFO1LZnQJXxwmLGkhk2bmAUdo/HB6NrFRLYmWtFA
	ZDZbVDqDxN5uKHGa5oiOcrK8PNcdgkSP7Mp9nLm2wQQ6jjaStpJ9/Ta/RbU2WcheKYac
	uXXA==
X-Gm-Message-State: AG10YOTvJt6WjpBNg0s9+I2tcXnEAZB4Rhfq5Un/3YtuxQn7sAWxCNwABtQzk4vNKrilsw==
X-Received: by 10.194.234.41 with SMTP id ub9mr39678967wjc.9.1455109627660;
	Wed, 10 Feb 2016 05:07:07 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t8sm1588115wjy.41.2016.02.10.05.07.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Feb 2016 05:07:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Feb 2016 14:10:57 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160210131057.GA2609@jama>
References: <2021B186DC632746BD5A3CE32F12BD28011FB867B8@EU-MBX-02.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28011FB867B8@EU-MBX-02.mgc.mentorg.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: mplayer2 : focus deficiency?
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
X-List-Received-Date: Wed, 10 Feb 2016 13:07:08 -0000
X-Groupsio-MsgNum: 59927
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2016 at 11:02:30AM +0000, Belal, Awais wrote:
> Hi,
>=20
> The version of mplayer2 available in meta-oe is almost 2.5 years old whil=
e there seems to be active development around it. Is there a reason OE neve=
r moved to a newer version?
>=20
> The mplayer team officially releases tarballs from its website https://ww=
w.mplayerhq.hu/design7/dload.html while they also provide svn access throug=
h svn://svn.mplayerhq.hu/mplayer/trunk. I believe it would be a good idea t=
o move to one of these sources (I would prefer tar downloads myself) and us=
e a newer more robust (probably) version of mplayer2.

That's what was used in mplayer.bb (without 2 in oe-classic days),
mplayer2 was more active and better alternative at that time so only
mplayer2 was migrated from oe-classic.

> I will be working on a new recipe to cater this if there are no objection=
s but I would really like to have some feedback before I do so.

If mplayer(1) is alive again, then I would accept patch replacing
mplayer2 or you can restore it as mplayer.bb and keep both alternatives.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla7NHcACgkQN1Ujt2V2gBwKWACgix/CV36O07HnGkVpzrTWQk9h
i2YAn1cMUwTBlvQTM2HmpwvFeOWEJDku
=x3Tb
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--

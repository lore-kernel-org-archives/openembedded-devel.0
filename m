Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tssuy-0004Av-6s
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 11:29:57 +0100
Received: by mail-da0-f49.google.com with SMTP id v40so675320dad.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 02:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ThBKjc37iBvWLCpHyxzCgiux2rNp/JItDHcwRSW23Zc=;
	b=N/vjkoE8XppYaAd6pEOAHdc+JQpIOeOR0Siu7o6Dx6BI1hOmKjg8qnTB4iXjgqgoKJ
	xW0NLSCmgZZzT1zwiIN+eGGM9UFF41kSL+tRS7L+NrrastwoBrkwmlB7n/Imt34bOiBe
	p5zd2x+xS37ym5lvkneehLSQe3FsSrTtTGcEcA0MCxy7VXrHNLs6+Q02yAyLqLHwz3qE
	l55neWXXYS+9Rkrd1WHHOAR7utkozmuO8Nms60wvICBkytYhTo933vFRmmzvtjnv9hrh
	xfK/pS2jwr2xqmRRnQT6RknaaUkC6Wf3lZ/XvYFvYuIwEsv15DN6XbwEYsBAhSiKHkFy
	1qYQ==
X-Received: by 10.66.78.100 with SMTP id a4mr188686432pax.4.1357726483558;
	Wed, 09 Jan 2013 02:14:43 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id is3sm41390377pbc.6.2013.01.09.02.14.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 02:14:42 -0800 (PST)
Date: Wed, 9 Jan 2013 11:14:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130109101446.GD3722@jama.palm1.palmone.com>
References: <1357631895-9535-1-git-send-email-fransmeulenbroeks@gmail.com>
	<CAJTo0LaMwJtHVdXyugtVPivvT8qNj1smq2fL5yzTw0wrSAv6TQ@mail.gmail.com>
	<CACW_hTaH330bdp0Z1C8veF+a2oqJr=cauZGBKmvdttq8TQ=a5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACW_hTaH330bdp0Z1C8veF+a2oqJr=cauZGBKmvdttq8TQ=a5Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [OE-core] [PATCH] inotify-tools: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 10:29:58 -0000
X-Groupsio-MsgNum: 42588
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline

--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 08, 2013 at 10:39:24AM +0100, Frans Meulenbroeks wrote:
> @Ross:
> for me it is not really clear what should go in oe-core and what not (let
> alone what should go in what dir)
>=20
> @openembedded-devel:
> feel free to take this and put it in meta-oe or any other layer where it =
is
> felt to be appropriate.

Please submit updated patch.
=20
Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtQxYACgkQN1Ujt2V2gBySqQCghHWcGxlLGGvWh2aEi+WwXB/P
kpwAn35SYztvFH/XtE4PwlFxDSGxzLiZ
=0Igx
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--

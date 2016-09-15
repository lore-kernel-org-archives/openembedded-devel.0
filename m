Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9BE73D27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 13:01:15 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1bkWHz-00005r-R2 from Joe_MacDonald@mentor.com ;
	Thu, 15 Sep 2016 06:01:15 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 15 Sep 2016 06:01:15 -0700
Received: by burninator (Postfix, from userid 1000)	id F2B4A580415; Thu, 15
	Sep 2016 09:01:14 -0400 (EDT)
Date: Thu, 15 Sep 2016 09:01:14 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160915130114.GA5455@mentor.com>
References: <20160915083906.GB2641@jama>
MIME-Version: 1.0
In-Reply-To: <20160915083906.GB2641@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: 3 meta-networking patches
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
X-List-Received-Date: Thu, 15 Sep 2016 13:01:16 -0000
X-Groupsio-MsgNum: 63129
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Martin,

[3 meta-networking patches] On 16.09.15 (Thu 10:39) Martin Jansa wrote:

> Hi Joe,
>=20
> can you please confirm state of thes change:
> https://patchwork.openembedded.org/patch/128859/
> it's Accepted on patchwork, but still applicable and included i
> master-next.

Curious.  I'll scoop that up this morning.  It looks pretty obvious.

> I'll drop these 2 from master-next as they are marked as
> Rejected/Changes-Requested now:
> https://patchwork.openembedded.org/patch/122365/
> https://patchwork.openembedded.org/patch/125839/

Yep, the former had a lot of discussion around it and ultimately the
rationale wasn't solid.  The latter was resolved with patches to
waf-samba as a generic solution rather than piecemeal, as this was
doing.

--=20
-Joe MacDonald.
:wq

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJX2puQAAoJEEn8ffcsOfaW6GQIAL7yCZDDoETG7IlruNPijDVY
cwT7MQYkSJKhQbg8VDKJEXNR/9g3U3fqHtC4Xwu3cdnnO4jBMi9q5pYrpqXzFrhr
Fagw6kSMJMbp5jkp/WCJQRmzJ3u12HYvU1tPVzlQzZduxYi/8dcvD6oNmWqJaEHg
Jt22wRoEPx9plQPSO0RUTclaRrqffmvSrUq64tkOWeE7UrmLkvWluPZYQ4qpTrTJ
gW4t2qTG44+fsWtFxHIGJVzEh/Hol3WuoBeYHrWaSxfaa0aepyRH3oxwZ/1TC6KM
nX1AVmQ1by4ZmyXWE7xS07OxmoZPBh+/IeTlP1tJ1aQNzW6E93ye6CFMQ6lTgUU=
=+JIW
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

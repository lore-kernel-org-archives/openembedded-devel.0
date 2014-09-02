Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 027B76FCE0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 12:20:50 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1XOn4r-0000D1-5z from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Sep 2014 05:20:49 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.2.247.3; Tue, 2 Sep 2014
	05:19:45 -0700
Received: by burninator (Postfix, from userid 1000)	id 45807581728; Tue,  2
	Sep 2014 08:19:45 -0400 (EDT)
Date: Tue, 2 Sep 2014 08:19:45 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140902121944.GE7949@mentor.com>
References: <1406686961-21142-1-git-send-email-rongqing.li@windriver.com>
	<20140730072555.GF16445@jama> <54052F3C.6090006@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54052F3C.6090006@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2][meta-networking] tcpslice: add recipe under tcpdump
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
X-List-Received-Date: Tue, 02 Sep 2014 12:21:00 -0000
X-Groupsio-MsgNum: 51964
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cPi+lWm09sJ+d57q"
Content-Disposition: inline

--cPi+lWm09sJ+d57q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH v2][meta-networking] tcpslice: add recipe under tcpdump] O=
n 14.09.02 (Tue 10:45) Rongqing Li wrote:

>=20
>=20
> On 07/30/2014 03:25 PM, Martin Jansa wrote:
> >On Wed, Jul 30, 2014 at 10:22:41AM +0800,rongqing.li@windriver.com  wrot=
e:
> >>>From: Roy Li<rongqing.li@windriver.com>
> >>>
> >>>tcpslice is a tool for extracting parts of a tcpdump packet trace,
> >>>so put it under tcpdump dir
> >>>
> >>>Signed-off-by: Roy Li<rongqing.li@windriver.com>
> >>>---
>=20
>=20
> Hi Martin:
>=20
> I see this recipes has been merged into master-next for a long time,
> Could you cherry-pick it to master?

I had asked for some kind of clarification on the license for tcpslice.
I didn't notice a follow-up on it yet, did you get a chance to check
into it?

I don't think anyone has any concern about the stability of the package
itself, though, if we'd had some kind of response on the license
question I had I would've merged it long ago.

-J.

>=20
>=20
> -Roy
>=20
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li
--=20
-Joe MacDonald.
:wq

--cPi+lWm09sJ+d57q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUBbXdAAoJEEn8ffcsOfaWuGIH/im74U54QCg90gqK/BA+O5Vu
PR46gbOJc//Prph1XRp0Vx/WQ+54Ez3iIosRzxBzXUqDf3lqh7+v9hqbeSNS1/lv
V7luFuQca6Soqj50sRC+InFcUJheBtVcEyGj7Ha6zymrSMEYatVDOjBppNv7RWER
8FQ/fWSLv4TSmaT56VVuVlRa3iPk6r0jxF72ATRd+e65wVHsQ4Ibn05p1sAgYyeh
S1wNR5sqbwbQJUMmZc5zUHj+MYD5fw7KgeVHkBZggzWY8O53Gb8wSvaAhMMc2d0G
gc8/JESgvmksX5lJ5DYJoSz8BzX2gnctccf8dU6fDc4Cjq3Xa7Croi/zVXNTxpA=
=F6st
-----END PGP SIGNATURE-----

--cPi+lWm09sJ+d57q--

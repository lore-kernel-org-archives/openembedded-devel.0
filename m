Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <oe@hentges.net>) id 1Hnix4-0000bD-Qe
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2007 00:23:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 1B6D4308206
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2007 00:23:25 +0200 (CEST)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 12411-03 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2007 00:23:22 +0200 (CEST)
Received: from mhcln04.hentges.priv (xdsl-87-78-55-241.netcologne.de
	[87.78.55.241]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id D0E4C3081FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2007 00:23:01 +0200 (CEST)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1178928474.4954.18.camel@localhost.localdomain>
References: <4644ABCB.6080202@openhardware.net>
	<4644B0D2.8020409@dominion.kabel.utwente.nl>
	<1178928474.4954.18.camel@localhost.localdomain>
Date: Tue, 15 May 2007 00:23:00 +0200
Message-Id: <1179181380.4954.45.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at hentges.net
Subject: Re: do_rootfs fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2007 22:23:46 -0000
X-Groupsio-MsgNum: 2085
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-S9eOgf6KeazhJotE1cWR"

--=-S9eOgf6KeazhJotE1cWR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello all,

Am Samstag, den 12.05.2007, 02:07 +0200 schrieb Matthias Hentges:

> 1.8.x has a show-stopper freeze-bug for some users ( including myself )
> which has not been fixed or even looked into yet.

RP was kind enough to look into the issue. The following command
unbreaks bitbake 1.8 on my build environment:=20

stty -tostop

The IRC discussion leading to the fix is archived here:

http://hentges.net/tmp/logs/irc/%
23oe/2007/May/20070515_oe.log#[20070515%2000:08:46]
--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice



--=-S9eOgf6KeazhJotE1cWR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGSOFEPXyoPq8wMNkRArcIAJ981ym1ZGVCw7QIU9rvsCM6Di219ACfYdRM
ajEyHsOAfWteok11yR8U2kc=
=jzUn
-----END PGP SIGNATURE-----

--=-S9eOgf6KeazhJotE1cWR--

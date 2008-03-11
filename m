Received: from [212.75.37.82] (helo=dottedmag.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dottedmag@dottedmag.net>) id 1JZ4yU-0002C4-Pp
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 14:57:04 +0100
Received: from frontier.dottedmag.net (unknown [92.125.214.233])
	by dottedmag.net (Postfix) with ESMTP id 662D88C005
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 19:54:22 +0000 (UTC)
Received: from frontier.dottedmag.net (localhost [127.0.0.1])
	by frontier.dottedmag.net (Postfix) with ESMTP id B597B1C4CF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 19:55:02 +0600 (NOVT)
From: Mikhail Gusarov <dottedmag@dottedmag.net>
To: openembedded-devel@lists.openembedded.org
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
Date: Tue, 11 Mar 2008 19:55:02 +0600
In-Reply-To: <200803111126.04715.openembedded@haerwu.biz> (Marcin
	Juszkiewicz's message of "Tue, 11 Mar 2008 11:25:59 +0100")
Message-ID: <87hcfd9xhl.fsf@frontier.dottedmag.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.60 (gnu/linux)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.75.37.82
X-SA-Exim-Mail-From: dottedmag@dottedmag.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DNS_FROM_RFC_BOGUSMX, RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 13:57:04 -0000
X-Groupsio-MsgNum: 4521
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

Twas brillig at 11:25:59 11.03.2008 UTC+01 when Marcin Juszkiewicz did gyre=
 and gimble:

 >> - I lack a GUI to easily browse the repository

 MJ> Does Mercurial has such one? GIT has gitk, qgit and probably
 MJ> something more.

'hg view' is direct port of gitk.

=2D-=20

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH1o82vse/O6JvVMgRAm8/AJ4oGhTLPF+jWmNlXifz088Yn0i0gACeKGok
desOFsjGjjbB02R0DgoGoVw=
=vAex
-----END PGP SIGNATURE-----

--=-=-=--

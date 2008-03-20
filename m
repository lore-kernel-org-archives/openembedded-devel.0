Received: from [212.75.37.82] (helo=dottedmag.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dottedmag@dottedmag.net>) id 1JcFnQ-0004Qw-Q8
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Mar 2008 09:06:50 +0100
Received: from frontier.dottedmag.net (unknown [92.125.214.233])
	by dottedmag.net (Postfix) with ESMTP id CCE118C005
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2008 14:04:48 +0000 (UTC)
Received: from frontier.dottedmag.net (localhost [127.0.0.1])
	by frontier.dottedmag.net (Postfix) with ESMTP id 802191C4C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2008 14:06:41 +0600 (NOVT)
From: Mikhail Gusarov <dottedmag@dottedmag.net>
To: openembedded-devel@lists.openembedded.org
References: <878x0emgub.fsf@frontier.dottedmag.net>
	<47E1A6CB.4010708@balister.org> <200803200120.47119.zecke@selfish.org>
Date: Thu, 20 Mar 2008 14:06:40 +0600
In-Reply-To: <200803200120.47119.zecke@selfish.org> (Holger Freyther's message
	of "Thu, 20 Mar 2008 01:20:47 +0100")
Message-ID: <87tzj1lsz3.fsf@frontier.dottedmag.net>
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
Subject: Re: Default SRCREV value
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
X-List-Received-Date: Thu, 20 Mar 2008 08:06:55 -0000
X-Groupsio-MsgNum: 4713
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

Twas brillig at 01:20:47 20.03.2008 UTC+01 when Holger Freyther did gyre an=
d gimble:

 HF> The only down-side I can think of, now parsing will fail for a
 HF> recipe you do not even care for in your distribution, with having a
 HF> default value 1 you just parse fine.

Is it possible to handle recipies a bit lazier, to avoid recipies which
are not interesting?

Hmm... In other hand, until recipie is not parsed, it is not possible to
say whether it is needed for build or not, so it can be tricky.

=2D-=20

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH4hsQvse/O6JvVMgRAhS8AJ40Ukf0ETgE+I5nuxAcSSgPSB6m4ACgpCEM
oXy2weYO02kbPm0WERoK/CA=
=wQs4
-----END PGP SIGNATURE-----

--=-=-=--

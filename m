Received: from [212.75.37.82] (helo=dottedmag.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dottedmag@dottedmag.net>) id 1JZYfl-0008AF-2g
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 22:39:42 +0100
Received: from frontier.dottedmag.net (unknown [92.125.214.233])
	by dottedmag.net (Postfix) with ESMTP id 7F5008C005
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 03:36:42 +0000 (UTC)
Received: from frontier.dottedmag.net (localhost [127.0.0.1])
	by frontier.dottedmag.net (Postfix) with ESMTP id 540C71C4D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 03:37:34 +0600 (NOVT)
From: Mikhail Gusarov <dottedmag@dottedmag.net>
To: openembedded-devel@lists.openembedded.org
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org> <20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org> <1205356290.4530.7.camel@dax.rpnet.com>
Date: Thu, 13 Mar 2008 03:37:34 +0600
In-Reply-To: <1205356290.4530.7.camel@dax.rpnet.com> (Richard Purdie's message
	of "Wed, 12 Mar 2008 21:11:30 +0000")
Message-ID: <87ejaf1v4x.fsf@frontier.dottedmag.net>
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
X-List-Received-Date: Wed, 12 Mar 2008 21:39:42 -0000
X-Groupsio-MsgNum: 4595
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

Twas brillig at 21:11:30 12.03.2008 UTC+00 when Richard Purdie did gyre and=
 gimble:

 >> while with hg it's just 'hg serve'.
 RP> How do two hg servers interact?

They don't. It's a pull-, not push-model.

=2D-=20

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH2E0evse/O6JvVMgRAuFGAJ0RxN8oNfT5JvbNou8U84ISZ3AjSgCfXPju
ifox1MWY40phP4gOSW9s4HA=
=8uNC
-----END PGP SIGNATURE-----

--=-=-=--

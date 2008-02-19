Received: from [213.91.4.211] (helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JRRGR-0001WL-44
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2008 13:08:01 +0100
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 1260D5FF8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 13:07:10 +0100 (CET)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 9EE945FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 13:07:06 +0100 (CET)
Received: from blini.bolloretelecom.eu (smtp.bolloretelecom.eu
	[62.210.194.121])
	by bart.wifirst.net (Postfix) with ESMTP id 84BA75FF8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 13:07:06 +0100 (CET)
Received: from [192.168.95.68] (unknown [192.168.95.68])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 5416823E46
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 13:07:06 +0100 (CET)
Message-ID: <47BAC66A.8090700@bolloretelecom.eu>
Date: Tue, 19 Feb 2008 13:07:06 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.0.13pre) Gecko/20080208 Thunderbird/1.5.0.14pre
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1203419692.21824.35.camel@dax.rpnet.com>
	<20080219113024.32ba3368@cimmeria>
In-Reply-To: <20080219113024.32ba3368@cimmeria>
X-Enigmail-Version: 0.94.2.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 213.91.4.211
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE.dev roadworks notification
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
X-List-Received-Date: Tue, 19 Feb 2008 12:08:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


> My feeling is opt-out. That way you have to read the docs to get
> out and that means you have to understand why you are swimming
> upstream.
>
> One of the most common problems in OE for beginners seems to be
> building packages that conflict in staging. Having the no breaking
> system be the default would be the best.
I would also prefer to see packaged staging as the default.
It will go a long way towards making builds deterministic as
opposed to the current situation where you may or may not
have cruft leftover in your staging directory, depending on
what you built in the past.

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHusZpCL1n3lVB9EYRApO1AJ4lgLwI5o9dVhYEgDMTAtiYv8UJJwCcCuF2
Bo2NZKJ5CNw/9TdCaIanuUQ=3D
=3D8yhs
-----END PGP SIGNATURE-----



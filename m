Received: from [88.191.97.79] (helo=legolas.polyconseil.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LjZFw-0002uE-NO
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 14:23:01 +0100
Received: from [192.168.95.60] (anj75-1-81-57-0-22.fbx.proxad.net [81.57.0.22])
	by legolas.polyconseil.fr (Postfix) with ESMTPSA id DAA7E70B6B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 14:22:10 +0100 (CET)
Message-ID: <49BFA406.6030802@bolloretelecom.eu>
Date: Tue, 17 Mar 2009 14:22:14 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.19) Gecko/20090103 Thunderbird/2.0.0.19 Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 88.191.97.79
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50, RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Dropping qtopia-core-4.3.3.bb and qtopia4core.bbclass
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
X-List-Received-Date: Tue, 17 Mar 2009 13:23:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

I would like to suggest we drop the "qtopia-core-4.3.3" package, which
is superseeded by qt-embedded (currently at version 4.4.3). I would
also like to drop the "qtopia4core.bbclass" file, which is superseeded
by "qt4e.bbclass".

I have grepped around and cannot find any packages which depend on
these packages/classes.

What are your thoughts on the subject?

Cheers,

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkm/pAUACgkQCL1n3lVB9EZvNwCgy7xEJKfmsPQ0CXDSyl4o+7+8
cVEAn0AB7QkK6xOeTOI3F1wsraU4oG1B
=3DlyJl
-----END PGP SIGNATURE-----




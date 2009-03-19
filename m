Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LkPsb-0007qb-69
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 22:34:21 +0100
Received: (qmail invoked by alias); 19 Mar 2009 21:33:19 -0000
Received: from f053000052.adsl.alicedsl.de (EHLO [192.168.4.110]) [78.53.0.52]
	by mail.gmx.net (mp021) with SMTP; 19 Mar 2009 22:33:19 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+DP4l5yoODL8PUBICGYsRYT9H//EAZ9Rllqg+PFb
	VD7tLN2cx6XDhT
Message-ID: <49C2BAEA.8050205@gmx.net>
Date: Thu, 19 Mar 2009 22:36:42 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.63
Subject: RFC: extension of policy on removing recipes
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
X-List-Received-Date: Thu, 19 Mar 2009 21:34:21 -0000
X-Groupsio-MsgNum: 8571
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig9C88FF41A2FDA6A8D4655C9E"

--------------enig9C88FF41A2FDA6A8D4655C9E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
the latest removal of the automake-native version just hit me today (I
am not building chinook-compat regularly and I am basically the only
person building it at all).

What I found surprising is, that automake 1.10 was deleted although it
was explicitly stated as PREFERRED_VERSION in the chinook-compat.conf. I
was under the impression that we already discussed that if you remove
something that is obviously being used, that patch is posted for RFC firs=
t.

?!?!?

Anyway I took the freedom to extend the respective wiki page[0] with
that policy. The text and the policy itself can be discussed.

(If no one answers, say within a week I remove 'DRAFT' from the page and
assume that it is accepted.)

Regards
Robert

[0] - http://wiki.openembedded.net/index.php/Upgrading_Packages



--------------enig9C88FF41A2FDA6A8D4655C9E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknCuu0ACgkQG9cfwmwwEto+RQCfaLtKCedvrCxdGYFE8V1sjG6a
bpkAoIW73Z13urVQZgbyAIBL3ORW03hR
=XfMh
-----END PGP SIGNATURE-----

--------------enig9C88FF41A2FDA6A8D4655C9E--

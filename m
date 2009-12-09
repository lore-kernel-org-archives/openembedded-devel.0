Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NIO6h-00054i-F2
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 16:05:38 +0100
Received: from homiemail-a22.g.dreamhost.com (caiajhbdccac.dreamhost.com
	[208.97.132.202])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 2473717DB2D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 07:03:49 -0800 (PST)
Received: from [192.168.1.154] (unknown [84.55.206.192])
	by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPA id E4B771A8069
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 07:03:27 -0800 (PST)
Message-ID: <4B1FBC3D.9010400@SSpaeth.de>
Date: Wed, 09 Dec 2009 16:03:25 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1260365221-11155-1-git-send-email-Sebastian@SSpaeth.de>
In-Reply-To: <1260365221-11155-1-git-send-email-Sebastian@SSpaeth.de>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] connman: don't give user 'system' permissions by default. We might not have one. (connman 0.46)
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
X-List-Received-Date: Wed, 09 Dec 2009 15:05:38 -0000
X-Groupsio-MsgNum: 14980
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigDF78853D314D3165CE48EC7D"

--------------enigDF78853D314D3165CE48EC7D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Can I get an ACK for this? default connman configuration assumes that we
have a user called "system". This simply gets rid of that assumption.

I would push this in addition to a PR bump.

spaetz


--------------enigDF78853D314D3165CE48EC7D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAksfvD4ACgkQVYX1jMgnoGIjDwCfQ5fxBrInJ78sXCCwNjJpGL+i
gEMAnRHwAjMvvamhVoYFuVhlI4a9MKfJ
=r2If
-----END PGP SIGNATURE-----

--------------enigDF78853D314D3165CE48EC7D--

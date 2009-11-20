Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NBT82-0000OZ-Ei
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 14:02:25 +0100
Received: from homiemail-a18.g.dreamhost.com (caiajhbdcagg.dreamhost.com
	[208.97.132.66])
	by hapkido.dreamhost.com (Postfix) with ESMTP id A299017D5E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 05:00:56 -0800 (PST)
Received: from [192.168.1.154] (unknown [195.190.181.110])
	by homiemail-a18.g.dreamhost.com (Postfix) with ESMTPA id D2E1C250069
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 05:00:51 -0800 (PST)
Message-ID: <4B069301.4010007@SSpaeth.de>
Date: Fri, 20 Nov 2009 14:00:49 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B067785.50600@SSpaeth.de> <he5vbj$enr$1@ger.gmane.org>
In-Reply-To: <he5vbj$enr$1@ger.gmane.org>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [Fwd: [Shr-Devel] [PATCH] ILLUME_CONFIG is now also set by a variable]
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
X-List-Received-Date: Fri, 20 Nov 2009 13:02:25 -0000
X-Groupsio-MsgNum: 14528
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig9EF4218C64BC7BBF56904C43"

--------------enig9EF4218C64BC7BBF56904C43
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:
> The change looks file, but the Author field is wrong (people have last
> names, unless you're called Wookie) and the commit message isn't to OE
> standards either.
> In the future fix up both before committing. It can get tedious, I know=
,
> I do it for my coworkers as well :)

Apologies for those glitches. I applied the patches without checking the
author field and making sure that the commit comment is ok (I partially
blame "git am" here, it makes things too easy :)). Will do in the future.=


spaetz


--------------enig9EF4218C64BC7BBF56904C43
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAksGkwIACgkQVYX1jMgnoGK4ggCeN0vQLXA0lrc/cM2iBhbgkBZ+
y/sAn1lnVtxkXmNa6ELi1hXD+rMQzNcW
=jCS0
-----END PGP SIGNATURE-----

--------------enig9EF4218C64BC7BBF56904C43--

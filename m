Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUbbf-0002d3-Qc for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 11:05:09 +0100
Received: from f053040091.adsl.alicedsl.de ([78.53.40.91]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUbVX-0006gv-RD for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 09:58:48 +0000
Message-ID: <1322387906.7998.20.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Nov 2011 10:58:26 +0100
In-Reply-To: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [RFC] Documentation problems and future plans
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
X-List-Received-Date: Sun, 27 Nov 2011 10:05:09 -0000
X-Groupsio-MsgNum: 35642
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-wQ6iFYTsXLcl69Yspwd5"

--=-wQ6iFYTsXLcl69Yspwd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear everyone,


Am Samstag, den 26.11.2011, 19:40 -0700 schrieb Tom Rini:

> As things stand today, the wiki is out of date and a number of folks
> refuse to work on it.  Using things like "It's all text!" for firefox
> only go so far and don't solve problems like people just avoiding
> documentation anyhow.

the Special Pages page [1] has interesting information. For example you
can get an overview of the recent changes in the Wiki [2].

> Paul Menzel has mentioned that ikiwiki has been mentioned before and
> that lets us have the website in a repository.  Do folks have other
> ideas?

Before the implementation is discussed, could we decide what
documentation we need and what is possible to maintain in the long run?
Avoiding maintenance and duplicate efforts should be the objective.

1. User manual
2. FAQ
3. README
4. Guidelines (Commit, patch, style)
5. Getting started document (could be included in 1.)
6. Git usage (a lot of existing documentation for that one elsewhere) or
can be put in a file `HACKING`.
7. =E2=80=A6

Formatted in a markup language like Markdown those could be converted to
HTML easily.

The second question is, is OE-core documented in the OE wiki or for
example at the Yocto project?

To get users started we could also recommend to use the =C8=A6ngstr=C3=B6m =
scripts
or to take a look at the Yocto project, i. e. just point to
distributions being well documented.

They have a Wiki already [3] and we could decide to use that instead. Or
we could say to use use the Wiki at eLinux.org [4].


Thanks,

Paul


[1] http://www.openembedded.org/wiki/Special:SpecialPages
[2] http://www.openembedded.org/wiki/Special:RecentChanges
[3] https://wiki.yoctoproject.org/wiki/Main_Page
[4] http://elinux.org/Main_Page

--=-wQ6iFYTsXLcl69Yspwd5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7SCcIACgkQPX1aK2wOHVjcRwCbBN6fNKBP6Adb2pMl6SqCWtSM
/u8An3TGxmIgrJhqSoPX6kKfH0rGZxq6
=Pqvb
-----END PGP SIGNATURE-----

--=-wQ6iFYTsXLcl69Yspwd5--

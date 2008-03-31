Received: from [66.249.82.229] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1JgP70-0006jn-Kk
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 20:52:06 +0200
Received: by wx-out-0506.google.com with SMTP id h27so2006227wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 11:52:05 -0700 (PDT)
Received: by 10.100.3.4 with SMTP id 4mr1134944anc.81.1206989525394;
	Mon, 31 Mar 2008 11:52:05 -0700 (PDT)
Received: from debian ( [74.254.162.162])
	by mx.google.com with ESMTPS id 6sm4083499agb.13.2008.03.31.11.52.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Mar 2008 11:52:03 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2008 13:51:47 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200803311351.54378.e.robertson.svg@gmail.com>
Subject: OE.mtn snapshot md5sum incorrect
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
X-List-Received-Date: Mon, 31 Mar 2008 18:52:07 -0000
X-Groupsio-MsgNum: 4862
Content-Type: multipart/signed; boundary="nextPart1877645.fPojQgsnWJ";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1877645.fPojQgsnWJ
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I think the md5sum for the _current_ snapshot needs updating.

$md5sum -c OE.mtn.bz2.md5
md5sum: OE-this-is-for-mtn-0.35.mtn.bz2: No such file or directory
OE-this-is-for-mtn-0.35.mtn.bz2: FAILED open or read
md5sum: WARNING: 1 of 1 listed file could not be read

--nextPart1877645.fPojQgsnWJ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH8TLK2sS31XKVICURAnJrAJsFZKrynpygbdVRg2FH5LVQri+aOQCgjzWm
v4SXQ97OIjImLvoDjPpnXys=
=WuQG
-----END PGP SIGNATURE-----

--nextPart1877645.fPojQgsnWJ--

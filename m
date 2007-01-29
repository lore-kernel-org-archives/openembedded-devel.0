Received: from [131.246.120.220] (helo=mailgw1.uni-kl.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <p_pichot@informatik.uni-kl.de>) id 1HBcQ5-00034T-IY
	for openembedded-devel@openembedded.org; Mon, 29 Jan 2007 20:44:01 +0100
Received: from [131.246.80.76] (vpn-80-076.rhrk.uni-kl.de [131.246.80.76])
	by mailgw1.uni-kl.de (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l0TJhr2a017999 for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2007 20:43:54 +0100
Message-ID: <45BE4E7C.6050703@informatik.uni-kl.de>
Date: Mon, 29 Jan 2007 20:43:56 +0100
From: Paul Pichota <p_pichot@informatik.uni-kl.de>
User-Agent: Mail/News 1.5.0.9 (X11/20070124)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.94.1.0
OpenPGP: id=F7BF2802
Subject: Packages: provide openssl 0.9.8?
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
X-List-Received-Date: Mon, 29 Jan 2007 19:44:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I wonder if openssl 0.9.8 could be added to the packages, since it
supports Diffie-Hellman with Elliptic Curves.
I have been able to build it with Nylon, a build environment for the 4G
Access Cube which is based on OpenEmbedded. After applying patches
distributed by the OpenWRT project and editing the .bb file the libaries
were created and the package built.

Kind Regards,
Paul Pichota
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFvk5umH6TS/e/KAIRAu/+AJ9ImCQADDD8VDEfKB83gBG3HxgvVwCfZLBs
vzs5/B1Mql57ER7JtFG/MRc=
=lCU7
-----END PGP SIGNATURE-----



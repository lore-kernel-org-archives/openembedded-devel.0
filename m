Received: from [203.10.110.92] (helo=mail.netspace.net.au)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <oe@tucuxi.org>) id 1HBjbD-0001xF-Tr
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jan 2007 04:24:00 +0100
Received: from frontalis.tucuxi.org (220-253-146-206.VIC.netspace.net.au
	[220.253.146.206])
	by mail.netspace.net.au (Postfix) with ESMTP id 9D06D17056B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2007 14:23:56 +1100 (EST)
Received: from localhost ([127.0.0.1])
	by frontalis.tucuxi.org with esmtpa (Exim 4.63)
	(envelope-from <oe@tucuxi.org>) id 1HBjbA-0002lr-BY
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jan 2007 14:23:56 +1100
Message-ID: <45BEBA4B.8060901@tucuxi.org>
Date: Tue, 30 Jan 2007 14:23:55 +1100
From: Ben Stewart <oe@tucuxi.org>
User-Agent: Icedove 1.5.0.9 (X11/20061220)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45BE4E7C.6050703@informatik.uni-kl.de>
In-Reply-To: <45BE4E7C.6050703@informatik.uni-kl.de>
X-Enigmail-Version: 0.94.2.0
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: oe@tucuxi.org
X-SA-Exim-Scanned: No (on frontalis.tucuxi.org);
	SAEximRunCond expanded to false
Subject: Re: Packages: provide openssl 0.9.8?
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
X-List-Received-Date: Tue, 30 Jan 2007 03:24:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul,

Paul Pichota wrote:
> I wonder if openssl 0.9.8 could be added to the packages, since it
> supports Diffie-Hellman with Elliptic Curves.
> I have been able to build it with Nylon, a build environment for the 4G
> Access Cube which is based on OpenEmbedded. After applying patches
> distributed by the OpenWRT project and editing the .bb file the libaries
> were created and the package built.

By the sounds of things, you've got 0.9.8 to build? If so, chuck your
.bb file on the OE bugtracker as a patch:

<http://bugs.openembedded.org/enter_bug.cgi>

- - Ben
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFvrpLUXHDLmlSHegRAl5mAJ4iExAcc/LjG9KpE5DklUmyhMU8GgCgmvjS
qHZqy4M96Yzc5kR/qgIjTFk=
=2DyY
-----END PGP SIGNATURE-----



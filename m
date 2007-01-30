Received: from [131.246.120.220] (helo=mailgw1.uni-kl.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <p_pichot@informatik.uni-kl.de>) id 1HBq6x-0003Cm-95
	for openembedded-devel@openembedded.org; Tue, 30 Jan 2007 11:21:11 +0100
Received: from [131.246.80.82] (vpn-80-082.rhrk.uni-kl.de [131.246.80.82])
	by mailgw1.uni-kl.de (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l0UAL9vN022399 for <openembedded-devel@openembedded.org>;
	Tue, 30 Jan 2007 11:21:10 +0100
Message-ID: <45BF1C1A.3000203@informatik.uni-kl.de>
Date: Tue, 30 Jan 2007 11:21:14 +0100
From: Paul Pichota <p_pichot@informatik.uni-kl.de>
User-Agent: Mail/News 1.5.0.9 (X11/20070124)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45BE4E7C.6050703@informatik.uni-kl.de>
	<45BEBA4B.8060901@tucuxi.org>
In-Reply-To: <45BEBA4B.8060901@tucuxi.org>
X-Enigmail-Version: 0.94.1.0
OpenPGP: id=F7BF2802
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
X-List-Received-Date: Tue, 30 Jan 2007 10:21:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Ben Stewart wrote:
> Paul,
> 
> Paul Pichota wrote:
>> I wonder if openssl 0.9.8 could be added to the packages, since it
>> supports Diffie-Hellman with Elliptic Curves.
>> I have been able to build it with Nylon, a build environment for the 4G
>> Access Cube which is based on OpenEmbedded. After applying patches
>> distributed by the OpenWRT project and editing the .bb file the libaries
>> were created and the package built.
> 
> By the sounds of things, you've got 0.9.8 to build? If so, chuck your
> .bb file on the OE bugtracker as a patch:

That's right.
I have already added the .bb file as attachment. Do you want me to
additionally create a patch? It would be based on 0.9.7d, the latest
version in nylon.

Regards,
Paul Pichota
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFvxwZmH6TS/e/KAIRAhOEAJ9W/l2JhRn/EAwEJFyjGraYcs5iQgCfXBK+
eFWJ9ANk6qvv2Wsu53XY7gw=
=R7+G
-----END PGP SIGNATURE-----



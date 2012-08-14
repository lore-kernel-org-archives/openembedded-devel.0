Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T1E2F-0006BJ-NL for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 12:07:39 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T1Dqj-0006Oz-Bj for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 11:55:45 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2012 11:55:45 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2012 11:55:45 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 14 Aug 2012 11:55:33 +0200
Message-ID: <k0d7ai$odu$1@dough.gmane.org>
References: <B39AAE57-63B2-4EFA-A037-4F225E1CB21B@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <B39AAE57-63B2-4EFA-A037-4F225E1CB21B@gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-openembedded/toolchain-layer] Adding retired toolchain support for gcc-4.5.1 and eglibc-2.13
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
X-List-Received-Date: Tue, 14 Aug 2012 10:07:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-08-12 22:28, Elvis Dowson schreef:
> Hi, I've created a set of patches to add retired toolchain support for 
> gcc-4.5.1, to the meta-openembedded/toolchain-layer.

Given that  4.5.x was deleted from meta-toolchain 3 months ago[1], what's
the rationale for adding it back? It's still available in the denzil branch,
so unless someone steps up to maintain it I'm inclined to say "no" to
patches bringing it back in the master branch.

regards,

Koen

[1]
https://github.com/openembedded/meta-oe/commit/6291c6fd1243d722e144466921064d47fb50428b
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQKiCVMkyGM64RGpERAnipAJ9Qh6Fjy39VXgPShQCDlab4kMvVDACgvFTu
es5P6TemPajpqazhoMN5zTs=
=l3Oy
-----END PGP SIGNATURE-----




Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1J5MeG-0000Zv-4s
	for openembedded-devel@openembedded.org; Thu, 20 Dec 2007 15:45:20 +0100
Received: (qmail 29580 invoked by uid 813007); 20 Dec 2007 14:40:12 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 20 Dec 2007 14:40:12 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Dec 2007 15:40:09 +0100
User-Agent: KMail/1.9.7
References: <E1J5L4z-0004um-WD@linuxtogo.org>
In-Reply-To: <E1J5L4z-0004um-WD@linuxtogo.org>
MIME-Version: 1.0
Message-Id: <200712201540.11149.openembedded@haerwu.biz>
Subject: Re: [oe-commits] org.oe.dev distro/openwrt-sdk.conf: Distro config to build packages for OpenWRT.
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
X-List-Received-Date: Thu, 20 Dec 2007 14:45:20 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 20 grudnia 2007, pfalcon commit napisa=B3:

> distro/openwrt-sdk.conf: Distro config to build packages for OpenWRT.
> * Only package building is supported (not images).
> * Uses SDK tarballs from OpenWRT projects.
> * The distro itself is fully target-agnostic, you should just install
> correct SDK tarball and pass correct TARGET_ARCH (using environment vs
> local.conf is highly recommended).

MACHINE=3Dwrt54 + DISTRO=3Dwrt54oe builds toolchain which builds packages=20
usable under OpenWRT. At least it worked like that when I tested it over=20
year ago.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

    The fact that no one understands you doesn't mean you're an artist.





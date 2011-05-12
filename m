Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QKXbz-0006IK-2d
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 17:15:35 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QKXZG-0003Am-Ve from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 08:12:47 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 12 May 2011 08:12:46 -0700
Received: from [172.30.80.16] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Thu, 12 May 2011 08:12:45 -0700
Message-ID: <4DCBF8D9.3090002@mentor.com>
Date: Thu, 12 May 2011 08:12:25 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <iqde25$jrd$1@dough.gmane.org>
In-Reply-To: <iqde25$jrd$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 12 May 2011 15:12:46.0736 (UTC)
	FILETIME=[0CD6B900:01CC10B7]
Subject: Re: [2011.03-maintenance] Pull request #18
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
X-List-Received-Date: Thu, 12 May 2011 15:15:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/11/2011 12:32 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 11 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Koen Kooi (6):
>       libgles-omap3: prune source a bit better
>       libgles-omap3: make initscript work with both busybox and bash
>       libgles-omap3: update 4.03 release to 02
>       libgles-omap3 4.03.00.02: make it the default
>       nmap 3.81: fix license
>       linux-omap-psp 2.6.32: support accept4 call
> 
> Otavio Salvador (1):
>       wrapper/install: add -t support
> 
> Petr Štetiar (1):
>       zeromq: add new recipe for version 2.1.6
> 
> Philip Balister (1):
>       uhd : Enable usrp e100 utilities and package them seperately.
> 
> Steve Sakoman (2):
>       wpa-supplicant: Enable CONFIG_CTRL_IFACE_DBUS and
>       omap3-sgx-modules 4.03.00.02: fix build for latest kernels
> 
> 
> All commits are cherry-picks from .dev

This has been applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNy/jSAAoJEI4NMjfc3nJxFsUIAIcQoULGw1GHc8R5EdeUakrk
52nyHf/Pfyt2UexXrKouhg0roVTlCzhw/jmBOW0Dn2lZ/JW4aGJODIek1IvqoN2F
gln7aEPPZikdHUphOjCB3cM19dONJPtNzasWm1Iwky4rjKR+JgT1sP4XX6zgtUvH
by1HrYWGMDOuRYG5L+Rpbg5PCue82VCzCf0bfr9KeDsY1a11a4IbyIvk3hjiHJRT
vWCzmB6bxIcAF9Rjd5Uqm9TklQLUMSWpEE3n7H+71oLzTGd+o7A8+v9EGmtMmNMo
5eAJ1xbtxt/A3nGvzWRcAtZUe0OF2yVlUiqUp6vAo5aI0fi9DZQgOipaGJmPs6c=
=V5Mp
-----END PGP SIGNATURE-----



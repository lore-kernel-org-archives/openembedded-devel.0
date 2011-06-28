Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QbSPf-0003Q1-7Z for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 09:08:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QbSM6-0000Zo-Ja for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 09:05:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 09:05:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 09:05:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Jun 2011 08:56:31 +0200
Message-ID: <iubtuv$jkv$3@dough.gmane.org>
References: <1309214125-3523-1-git-send-email-j-lance1@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1309214125-3523-1-git-send-email-j-lance1@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/1] am-benchmarks: Remove platform dependencies
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
X-List-Received-Date: Tue, 28 Jun 2011 07:08:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-06-11 00:35, Jeff Lance wrote:
> * Remove platform dependencies and use architecture dependencies instead
> * Use OE BASE_PACKAGE_ARCH to determine architecture
> * Update the SRCREV to revision 65
> * Update the recipe revision to 1.3
> NOTE - architecure dependency and INSANE_SKIP can be removed once CFLAGS can be passed into CCSv5 project makefile

NAK, patch the makefiles in OE to work with CFLAGS and LDFLAGS.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOCXsfMkyGM64RGpERAukZAJ9h255ZZXglaxGDa9NacD+P/VoDwACeMC8u
VDbzOnP2HcuoztWijKjWjqI=
=nFoX
-----END PGP SIGNATURE-----




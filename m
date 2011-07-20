Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QjQTm-0005QZ-Et for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 08:41:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QjQPq-0003pL-Hv for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 08:37:54 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 08:37:54 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 08:37:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 20 Jul 2011 08:37:41 +0200
Message-ID: <j05t3l$kj8$1@dough.gmane.org>
References: <1311121620-27630-1-git-send-email-agnel.joel@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1311121620-27630-1-git-send-email-agnel.joel@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [PATCH v2] linux-omap-psp, linux-omap: Added patch to fix MMC timeout errors
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
X-List-Received-Date: Wed, 20 Jul 2011 06:41:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-07-11 02:27, Joel A Fernandes schreef:
> This fixes MMC errors due to timeouts on certain SD Cards, following suggestions to set dto to 14 by Jason Kridner and Steven Kipisz
> 
> Details of the issue: http://talk.maemo.org/showthread.php?p=1000707#post1000707

This patch doesn't apply to .dev

> --- Changes since earlier patch: * Set dto to 14 instead of doubling timeout
> 
> Other notes: * We have confirmation that this patch fixes the issue, so it is safe to apply to the maintentance tree
> 
> * Also please revert the earlier patch from the dev tree titled "linux-omap-psp: Added patch to fix MMC timeout errors" (commit 93e91091c7e2864274207cc7c59e3f64e453f843)

We don't work like that.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOJne1MkyGM64RGpERAhkiAKCDgNisgBs53GsmoVUfhIjK/2zRgQCfatRU
wiq8t6sOSGduyJfHkhrCgLc=
=XpXN
-----END PGP SIGNATURE-----




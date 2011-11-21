Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RSToW-0002Vn-4S for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 14:21:36 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RSTiD-0001Ll-Rg for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 14:15:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 14:15:05 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 14:15:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 21 Nov 2011 14:14:05 +0100
Message-ID: <jadiqt$i8c$2@dough.gmane.org>
References: <1321876672-15262-1-git-send-email-msprathap@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1321876672-15262-1-git-send-email-msprathap@ti.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH v2 1/2] libgles-omap3_4.04.00.02: added support for graphics sdk 04.04.00.02
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
X-List-Received-Date: Mon, 21 Nov 2011 13:21:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-11-11 12:57, Prathap M S schreef:
> * Added support for sgx ddk 1.6.16.4117
> * Added powervr.inc to include variables common to graphics SDK recipes
> * Bumped up the PR in libgles-omap3.inc
> 
> Signed-off-by: Prathap M S <msprathap@ti.com>

This patch seems to be against the meta-ti TI, please follow the instruction
from its README:
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/tree/README
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7KTp0ACgkQMkyGM64RGpHRyACeNPg8HrE7X2wKdWMcJSMHM29J
sUMAoKfo2/vfcR5wI+rj+P75sjpSOQkz
=zGM4
-----END PGP SIGNATURE-----




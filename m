Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q7pV6-00083E-ON for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 15:43:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q7pT4-0002Ml-LS for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 15:41:50 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 15:41:50 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 15:41:50 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 07 Apr 2011 15:41:37 +0200
Message-ID: <inkeui$jpv$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
X-Enigmail-Version: 1.0.1
Subject: [2011.03-maintenance] Pull request #13
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
X-List-Received-Date: Thu, 07 Apr 2011 13:43:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom,

Please pull the 13 commits from here:

URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
Branch: 2011.03-maintenance


Koen Kooi (1):
      pixman: add 0.21.6 + fixes

Michael Jones (1):
      base-files: write Angstrom as Ångström in the issue file.

Siddharth Heroor (6):
      ti-sysbios: Add missing License field.
      ti-sysbios: Copy installer unpack to recipe versions.
      ti-sysbios: Update Installer unpack commands.
      ti-sysbios: Add version 6.31.04.27.
      linux-omap3: Add PSP recipe for ti816x devices.
      u-boot: Add PSP version for ti816x devices.

chase maupin (5):
      linux-omap4: Add support for am45x-evm machine
      u-boot: Add support for am45x-evm machine
      sort: Add support for am45x-evm machine type
      alsa-state: Add support for am45x-evm machine type
      am45x-evm: Add am45x-evm machine configuration

You can view the branch online at
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance

These are all cherry-picks[1] from .dev. The AM4x and sysbios stuff was
only build tested, no proper hw on my desk yet.

regards,

Koen

[1] 'git format-patch origin/master -X ; git am -s *' to add my SOB
where it was missing
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNnb8RMkyGM64RGpERAtYgAJ9Q/lMwcwQURgE3TX85Y8YEwQcA1wCfftNS
kIE605Yi8v+eEG+Y1tVdD+Y=
=Ycmm
-----END PGP SIGNATURE-----




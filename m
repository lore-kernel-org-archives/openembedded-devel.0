Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3U0m-0004hG-QO for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 14:58:41 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3Tyh-0005I9-St for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 14:56:31 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2011 14:56:31 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2011 14:56:31 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 26 Mar 2011 14:56:16 +0100
Message-ID: <imkra1$jiv$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
X-Enigmail-Version: 1.0.1
Subject: [2011.03-maintenance] Pull request #6 (replaces #5)
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
X-List-Received-Date: Sat, 26 Mar 2011 13:58:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom,

Please pull the 16 commits from here:

URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
Branch: 2011.03-maintenance-pr6

Kartik Mohta (1):
      libarchive: Requires libxml2

Khem Raj (2):
      cairo_1.10.0.bb: Fennec will now need tee support in cairo so
enable it
      fennec: Make it build on ARM eglibc/uclibc

Koen Kooi (2):
      x-load git: update to 1.5.0
      u-boot git: remove duplicate filesdir line

Martin Jansa (1):
      mc: add RRECOMMENDed mc-skins package and more files to FILES_PN

Roger Monk (6):
      u-boot-git: Add omap4430-panda to u-boot git recipe
      omap4430-panda: Prefer u-boot-git and remove extra custom x-load
      gst-plugins-good: update to 0.10.28
      ti-gst-ducati: Update to latest SRCREV, package libs
      ti-libdce: Update to latest SRCREV
      omapfbplay: Add patch for dce codec error handling

Siddharth Heroor (4):
      TI IPC: Fix License field.
      TI IPC: Add missing dependencies
      TI IPC: Add version 1.22.04.25
      TI XDCTools: Add version 3.20.08.88

You can view the branch online at
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance-pr6

This is pull request #5 minus the libnl changes, but with some omap4
updates added.

The libnl changes will follow a bit later.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNjfCAMkyGM64RGpERAmpdAJ4kEEzkSFgoWnHav9MQsUm3eSUJWACeP0re
vfPBoVTe04eBvMC0rEIftkI=
=Lck9
-----END PGP SIGNATURE-----




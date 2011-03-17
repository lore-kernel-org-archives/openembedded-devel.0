Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q0Civ-0003sz-G9 for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 13:54:41 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q0ChE-000187-6p for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 13:52:56 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 13:52:56 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 13:52:56 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 Mar 2011 13:52:42 +0100
Message-ID: <ilt06r$gji$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
X-Enigmail-Version: 1.0.1
Subject: [2011.03-maintenance] Pull request #3
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
X-List-Received-Date: Thu, 17 Mar 2011 12:54:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom,

Please pull the 11 commits from here:

URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
Branch: 2011.03-maintenance

Koen Kooi (7):
      angstrom 2011.03 blacklist bash-noemu
      task-omap-drivers: task for commonly needed drivers on omap chips
      *beagleboard-validation: collection of tasks iand images to serve
      task-beagleboard*: add changes from latest round of feedback
      linux-omap-psp 2.6.32: add support for xM revision C
      linux-omap-psp 2.6.32: bump PR
      u-boot git: update beagleboard u-boot to 2011.03-RC

chase maupin (4):
      u-boot.inc: allow variable make targets
      dm368-evm: Add configuration for DM368 machine
      matrix-gui: add support for dm386-evm machine
      ti-pru-sw-example: fix building with new toolchain sysroot


You can view the branch online at
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance

The bash-noemu and u-boot commits both have a one line change compared
to .dev to account for the differences between angstrom versions. The
other 9 commits are straight cherry-picks.

I can pick up the external-toolchain patches from Ben for next weeks
pull request if you wish.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNggQaMkyGM64RGpERAq/bAKCR9X/OgN7MnBxphF/811seHRpc6QCfVgM3
vkWqnLe/LpqKpxHqhxIE5MY=
=wq1o
-----END PGP SIGNATURE-----




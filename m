Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QgB9v-0001s1-2b for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 09:44:03 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QgB69-0006lG-CA for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 09:40:09 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2011 09:40:09 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2011 09:40:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 11 Jul 2011 09:38:59 +0200
Message-ID: <ive9aj$16a$2@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
X-Enigmail-Version: 1.2
Subject: [2011.03-maintenance] Pull request #21
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
X-List-Received-Date: Mon, 11 Jul 2011 07:44:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom,

Please pull the 6 commits from here:

URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
Branch: 2011.03-maintenance

Joel A Fernandes (4):
      linux-omap: Disable UART sleep timeout to avoid serial port probs
      angstrom: Use pulseaudio version 0.9.22 for armv7a architecture
      beagleboard-test-scripts: Add a script flash-fs.sh for flashing
      linux-omap-psp: Fix the user button GPIO to the correct value for

Koen Kooi (2):
      x-load git: 1.5.0 sorts lower than 1.44ss, so bump PE
      linux-omap-psp 2.6.32: bump PR

These are all cherry-picks from .dev, except for the pulseaudio one
since it's an angstrom 2008 only change.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOGqiTMkyGM64RGpERAgOKAJ9RtgOP8nKEGIGvryIK09Q9sq3kqACfZ/d0
6FdlL80UlcUCOcDxYI3ECy4=
=Oq6u
-----END PGP SIGNATURE-----




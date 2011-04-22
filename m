Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QDG1E-0003dp-9n for openembedded-devel@lists.openembedded.org;
	Fri, 22 Apr 2011 15:03:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QDFyu-0001FF-1S for openembedded-devel@lists.openembedded.org;
	Fri, 22 Apr 2011 15:01:08 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2011 15:01:08 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2011 15:01:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 22 Apr 2011 15:00:54 +0200
Message-ID: <ioru67$bfr$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
X-Enigmail-Version: 1.0.1
Subject: [2011.03-maintenance] Pull request #15
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
X-List-Received-Date: Fri, 22 Apr 2011 13:03:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom,

Please pull the 18 commits from here:

URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
Branch: 2011.03-maintenance

Eyal Reizer (3):
      ti-wifi-utils: update to a newer git commit
      hostap-daemon: build from git sources
      wpa-supplicant: Build from git sources

Koen Kooi (1):
      libgles-omap3: abstract ES handling and share it across all

Tom Rini (14):
      db: Rework arm-thumb-mutex_db5.patch
      db: Switch to patchdir rather than applying in do_configure
      ftpd-topfield: Rework usb-header-name-2-6-23.patch
      opie-sh 1.2.4: Rework opie-sh-fsmounter-name.patch
      qscintilla 1.65-gpl-1.6: Rework no-external-lexers.patch
      poboxserver: Rework unicode.patch
      xqt2: Rework the patches for xqt2 (vs the core part).
      In a large number of patches, remove unneeded '..' in paths.
      opie-sh: Switch to patchdir rather than applying in do_configure
      poboxserver: Switch to patchdir rather than applying in
      qscintilla: Switch to patchdir rather than applying in
      xqt2: Switch to patchdir rather than applying in do_configure
      samba: Switch to patchdir rather than applying in do_configure
      vim: Switch to patchdir rather than applying in do_configure

These are all cherry-picks from .dev.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNsXwGMkyGM64RGpERAkMVAKCqbAUdSZsk/RrAe6/DX6PO3bapQwCfasbV
cLthIJgJpGUaAQzho4v1F0o=
=kE7l
-----END PGP SIGNATURE-----




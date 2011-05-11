Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QK3x6-0003pN-Tk for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 09:35:25 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QK3uN-0001ur-8u for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 09:32:35 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 09:32:35 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 09:32:35 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 11 May 2011 09:32:21 +0200
Message-ID: <iqde25$jrd$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
X-Enigmail-Version: 1.0.1
Subject: [2011.03-maintenance] Pull request #18
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
X-List-Received-Date: Wed, 11 May 2011 07:35:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom,

Please pull the 11 commits from here:

URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
Branch: 2011.03-maintenance

Koen Kooi (6):
      libgles-omap3: prune source a bit better
      libgles-omap3: make initscript work with both busybox and bash
      libgles-omap3: update 4.03 release to 02
      libgles-omap3 4.03.00.02: make it the default
      nmap 3.81: fix license
      linux-omap-psp 2.6.32: support accept4 call

Otavio Salvador (1):
      wrapper/install: add -t support

Petr Štetiar (1):
      zeromq: add new recipe for version 2.1.6

Philip Balister (1):
      uhd : Enable usrp e100 utilities and package them seperately.

Steve Sakoman (2):
      wpa-supplicant: Enable CONFIG_CTRL_IFACE_DBUS and
      omap3-sgx-modules 4.03.00.02: fix build for latest kernels


All commits are cherry-picks from .dev

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNyjuFMkyGM64RGpERAm+BAJ4tgwgOUuYPuNQlRuAj+fP/3uFeigCfaVvy
ki0ACXu85l/VXuT5/NK9GAw=
=VYa7
-----END PGP SIGNATURE-----




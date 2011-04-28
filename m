Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QFPh0-00038s-Rl for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 13:47:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QFPeb-0004vk-5z for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 13:45:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 13:45:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 13:45:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 28 Apr 2011 13:40:16 +0200
Message-ID: <ipbjn0$3i5$2@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
X-Enigmail-Version: 1.0.1
Subject: OE weekly changelog for meta-openembedded, 2011-04-18 to 2011-04-25
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
X-List-Received-Date: Thu, 28 Apr 2011 11:47:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj (1):
  uclibc-initial_git.bb: Create symlinks to kernel headers

Koen Kooi (21):
  wget: add missing escape and remove distro overrides
  libol: import 0.3.18 from OE .dev
  meta-oe: catch up with POKYBASE -> COREBASE renaming
  qt-apps,-tasks: drop from meta-oe, changes were merged back into
  xserver-common 1.34: make it work with xserver-nodm-init
  xinput-calibrator: make pointercal-xinput a soft dependency
  pointercal-xinput: don't allow empty packages
  meta-oe,efl: add subject prefix hint for git send-email
  places: add license checksum
  meta-gnome: add empty layer
  wv: import from oe-core rev 0a6f77f549c095692045825f4b5c4c5a2edff73c
  libgsf: import from oe-core rev
  libgnomecanvas: import from oe-core rev
  libgnomekdb: import from oe-core rev
  gnome-settings-daemon: import from oe-core rev
  gnome-terminal: import from oe-core rev
  gcalctool: : import from oe-core rev
  libgtkstylus: import from oe-core rev
  abiword*: import from oe-core rev
  cpufrequtils: import from OE .dev revision
  kernel.bbclass: mini sync with oe-core

Martin Jansa (1):
  qt4-x11-free: fix recipe name

Michael Lippautz (8):
  wget: Add version 1.11.4
  vim: Add vim/tiny-vim/gvim 7.2 (patchset 446)
  fakeroot: Add LIC_FILES_CHKSUM
  libnet: Clean and upgrade (see below)
  eventlog: Clean and update to 0.2.12
  syslog-ng: Update to 3.2.2
  syslog-ng: Runtime corrections
  libol: Typo in license checksum
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNuVIfMkyGM64RGpERAuOcAJwLzGki+kaBQZT4V9RPAnOmG03J9ACfQZ67
ZMQbs39lJW8naVZflm+amSs=
=m868
-----END PGP SIGNATURE-----




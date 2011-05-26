Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QPhjB-00080v-JA for openembedded-devel@lists.openembedded.org;
	Thu, 26 May 2011 23:04:21 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QPhgE-0008LN-Ka for openembedded-devel@lists.openembedded.org;
	Thu, 26 May 2011 23:01:18 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 May 2011 23:01:18 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 May 2011 23:01:18 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 26 May 2011 23:00:58 +0200
Message-ID: <irmf2a$fje$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
X-Enigmail-Version: 1.0.1
Subject: [2011.03-maintenance] Pull request #19
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
X-List-Received-Date: Thu, 26 May 2011 21:04:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom,

Please pull the 6 commits from here:

URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
Branch: 2011.03-maintenance

Anand Balagopalakrishnan (2):
      libgles-omap3: Add wsegl.h to the destination include directory
      qt4: Fix the include path for SGX PowerVR drivers

Koen Kooi (4):
      qt4 4.6.3: bump PR for wsegl header change
      linux-omap 2.6.39: initial add with beagleboard support
      linux-omap 2.6.39: sync with meta-texasinstruments
      linux-omap 2.6.39: sync with meta-texasinstruments


The kernel and gles ones are cherry-picks, the qt4 ones only picked up
the 4.6.x changes and not the 4.7.x changes.
And yes, I was stupid enough to use the same commit message for 2
different commits in .dev.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN3r+KMkyGM64RGpERAkd+AJ4iXkGN7hxsJo8mvMVO6d5Gox2WlQCeJq8l
2COrP1N7NcKtbFYEBrJAHiw=
=dXS7
-----END PGP SIGNATURE-----




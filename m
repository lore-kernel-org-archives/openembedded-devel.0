Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pz8ex-0001OL-Na for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 15:22:11 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pz8JZ-00016B-Fr for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 15:00:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 15:00:05 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 15:00:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Mar 2011 14:55:14 +0100
Message-ID: <ill6o2$d6n$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
X-Enigmail-Version: 1.0.1
Subject: [2011.03-maintenance] Pull request #2
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
X-List-Received-Date: Mon, 14 Mar 2011 14:22:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom,

Please pull the 3 commits from here:

URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
Branch: 2011.03-maintenance

Koen Kooi (3):
      angstrom: name release after branch
      angstrom contrib: use proper release version on webserver
      angstrom-version: catch up with release changes in parent commits

You can view the branch online at
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance

These aren't backports, but distro version housekeeping. The necessary
symlinks have already been made on the feed servers, so there is no
impact for existing users, except for getting less confused by the
versions reported.


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNfh5CMkyGM64RGpERAjAzAJ470e7MPf4EoP/0akwJcaZM80AcDgCfZwti
CNU7Yf+aa19GF/nALyBTt+8=
=Qo/M
-----END PGP SIGNATURE-----




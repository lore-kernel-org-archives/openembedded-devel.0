Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T4q3q-0005uJ-1Z for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 11:20:14 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T4ps5-0003Fl-PU for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 11:08:05 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 11:08:05 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 11:08:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 24 Aug 2012 11:07:55 +0200
Message-ID: <k17g98$6vq$1@ger.gmane.org>
References: <1345787215-11917-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1345787215-11917-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-systemd][PATCH] systemd: Refresh the uclibc specific patches
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
X-List-Received-Date: Fri, 24 Aug 2012 09:20:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 24-08-12 07:46, Khem Raj schreef:
> Make sure that patches apply on top of latest systemd some source files
> have moved around.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

2012-08-24 11:06:17 URL:http://patches.openembedded.org/patch/35259/mbox/
[2218] -> "pw-am-35259.patch" [1]
Applying: systemd: Refresh the uclibc specific patches
error: patch failed: meta-systemd/recipes-core/systemd/systemd_git.bb:32
error: meta-systemd/recipes-core/systemd/systemd_git.bb: patch does not apply
Patch failed at 0001 systemd: Refresh the uclibc specific patches
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQN0RrMkyGM64RGpERAkBhAJ4lPzPStp+i0zXlb94MLULzn1PK2wCeKlFP
BnXF/w6qYbHzCN9rNy2ON8o=
=dlGq
-----END PGP SIGNATURE-----




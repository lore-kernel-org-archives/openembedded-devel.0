Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UQb9x-0002rW-Bm for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 12:25:24 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UQat7-0004qc-OL for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 12:07:21 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 12:07:21 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 12:07:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 12 Apr 2013 12:07:19 +0200
Message-ID: <kk8mcf$sdd$1@ger.gmane.org>
References: <1365710654-22327-1-git-send-email-lists@philipp-wagner.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130216 Thunderbird/17.0.3
In-Reply-To: <1365710654-22327-1-git-send-email-lists@philipp-wagner.com>
X-Enigmail-Version: 1.5.1
Subject: Re: [meta-oe][PATCH] Add dependencies on Perl and Bash to NTP recipe
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
X-List-Received-Date: Fri, 12 Apr 2013 10:25:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-04-13 22:04, lists@philipp-wagner.com schreef:
> From: Philipp Wagner <mail@philipp-wagner.com>
> 
> do_rootfs gave errors about bash and perl not being found. This patch
> adds the two packages to the runtime dependencies to fix this problem

The bash dependencies need to get checked and changed to /bin/sh and perl
scripts need to get split out into a seperate packages, dragging in perl and
bash for ntp is unacceptable.




-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRZ9zXMkyGM64RGpERArXAAJ9o7cBaKCvIxdSzniekV5Hblmzc0wCgsDu3
1d6IKRWK+zMTl55UhyxC1Lg=
=SxZ0
-----END PGP SIGNATURE-----




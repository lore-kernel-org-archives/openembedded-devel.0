Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QyIOH-0001Cx-FN for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 09:05:45 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QyIJY-0002mE-IQ for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 09:00:52 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 09:00:52 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 09:00:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 30 Aug 2011 09:00:40 +0200
Message-ID: <j3i1qo$epr$1@dough.gmane.org>
References: <1314635263-10209-1-git-send-email-kergoth@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <1314635263-10209-1-git-send-email-kergoth@gmail.com>
X-Enigmail-Version: 1.3
Subject: Re: [PATCH] [meta-oe] binutils: use TARGET_PREFIX for the convenience links
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
X-List-Received-Date: Tue, 30 Aug 2011 07:05:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-08-11 18:27, Christopher Larson schreef:
> From: Chris Larson <chris_larson@mentor.com>
> 
> This ensures it works even if TARGET_PREFIX != ${TARGET_SYS}-
> 
> Signed-off-by: Chris Larson <chris_larson@mentor.com> --- meta-oe/recipes-devtools/binutils/binutils.inc |    4 ++-- 1 files changed, 2 insertions(+), 2 deletions(-)

merged, thanks
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFOXIqYMkyGM64RGpERArq+AJdv22NzIKRCxZ53vZ9gFhbXEQDQAJkBqVJM
5UEU4IR7d8qIUZtxcA0y0Q==
=9/50
-----END PGP SIGNATURE-----




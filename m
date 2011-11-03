Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RLwNo-0008Sj-FV for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 13:27:00 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RLwHq-0004h0-Io for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 13:20:50 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 13:20:50 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 13:20:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 03 Nov 2011 13:20:37 +0100
Message-ID: <j8u0ul$vq5$1@dough.gmane.org>
References: <1320322383-19870-1-git-send-email-jdk@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <1320322383-19870-1-git-send-email-jdk@ti.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [PATCH] rt-test: moved to github repo
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
X-List-Received-Date: Thu, 03 Nov 2011 12:27:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

OE-core patches need to go to the oe-core list :)

And have a look at
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012017.html

Op 03-11-11 13:13, Jason Kridner schreef:
> PR not bumped since previous builds would be identical. --- 
> meta/recipes-rt/rt-tests/rt-tests_0.73.bb |    2 +- 1 files changed, 1 
> insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb 
> b/meta/recipes-rt/rt-tests/rt-tests_0.73.bb index a2cf6be..e816fa2 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb +++ 
> b/meta/recipes-rt/rt-tests/rt-tests_0.73.bb @@ -11,7 +11,7 @@ SRCREV = 
> "81da016fb0f6ab0511fbec81fc8ba1a50398a20d" PV = "git${SRCPV}" PR = "r0"
> 
> -SRC_URI = 
> "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git;protocol=git"
>
>
> 
+SRC_URI = "git://github.com/clrkwllms/rt-tests.git;protocol=git"
> 
> S = "${WORKDIR}/git"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOsocVMkyGM64RGpERAhSuAJ9CA5H0MqtYElRi9HySt/JH/lD02gCeLyvP
f1GuSNpNL8jDR9BarGHi8d8=
=p1q/
-----END PGP SIGNATURE-----




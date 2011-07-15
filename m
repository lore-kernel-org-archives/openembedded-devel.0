Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QhnbC-0002EE-4R for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 20:58:54 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QhnXK-0000cF-NP for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 20:54:54 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2011 20:54:54 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2011 20:54:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 15 Jul 2011 20:54:42 +0200
Message-ID: <ivq2di$fbs$1@dough.gmane.org>
References: <cover.1310748001.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <cover.1310748001.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe] [PATCH 0/5] More meta-oe tidying
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
X-List-Received-Date: Fri, 15 Jul 2011 18:58:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-07-11 18:42, Paul Eggleton schreef:
> The following changes since commit 040f75eca217c79fed7b881589d9bb36358cffe1:
> 
> Drop PRIORITY variable (2011-07-14 16:49:27 +0100)
> 
> are available in the git repository at: git://git.openembedded.org/meta-openembedded-contrib paule/cleanup2 http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/cleanup2
> 
> Paul Eggleton (5): classes/kernel.bbclass: sync up with oe-core Remove meta-oe/patches/ libgcrypt: turn into a bbappend atk: switch over to a bbappend libgpg-error: switch over to a bbappend

Thanks! I applied all of them except 1/5 which is already in as seperate patches
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOIIzyMkyGM64RGpERAjyJAJ9uFp1XkQCI8Q8jk/O2UOzyE0zMnQCffWk+
+9ufV+graM6hOVHQ3s7OK2A=
=mzvV
-----END PGP SIGNATURE-----




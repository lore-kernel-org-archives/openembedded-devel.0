Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QPgEA-0004ex-26
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 May 2011 21:28:14 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QPgBC-0002n9-Vh from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 May 2011 12:25:11 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 26 May 2011 12:22:07 -0700
Received: from [172.30.80.104] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 26 May 2011 12:25:10 -0700
Message-ID: <4DDEA915.1070705@mentor.com>
Date: Thu, 26 May 2011 12:25:09 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <irit4n$8p3$1@dough.gmane.org>
In-Reply-To: <irit4n$8p3$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 26 May 2011 19:22:07.0000 (UTC)
	FILETIME=[33A25980:01CC1BDA]
Subject: Re: [2011.03-maintenance] Pull request #18
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
X-List-Received-Date: Thu, 26 May 2011 19:28:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/25/2011 05:36 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 8 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Christian Charreyre (1):
>       python-numpy: add missing runtime dependencies
> 
> Eyal Reizer (1):
>       ti-wifi-utils: update to use the latest release
> 
> Jeff Lance (1):
>       matrix_gui: Pull in lmbench,multimedia,EZSDK mods
> 
> Koen Kooi (3):
>       dttsp: fix DEPENDS
>       sdrshell-qt4: fix DEPENDS and update SRCREV
>       bigbuckbunny: fix SRC_URI
> 
> Tom Rini (2):
>       openssh.inc: Don't use ${libdir}exec
>       lmbench: Rework for binaries in /usr/bin
> 
> All plain cherry-picks from .dev.

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJN3qkMAAoJEI4NMjfc3nJxMN4H/192w+vxX3T8Ss9QC9SXR9gH
aKw2pIUnmpgqYXz0x8s6Ta6ZiPM1tQqVqiD3rhrU5KXm9rvTUkPbt863vMUwbzy5
AeqVblwzIyDmhHlSRJR2uPv0KOlHpFS401fd2frpZFSNKGBgn/Dr9crETtHlsXzk
dtfTW1UUGWXWy18OS0gcro84ets/W2R/NT0Ub2ITvLB/x2DZGk4tQQ3HUaY7p+w2
ENisrn5pQjZT9otbe9r+cymCZaTLTk8s2Iph7LUNj9bCSK4UmemwenE7/LcYirrP
EtoYwsIH8KvLAHa1JBk0GSGXUGweV15Kvvv6HsOYfZBA2zgd7hiswkoHLNO69bk=
=vYl0
-----END PGP SIGNATURE-----



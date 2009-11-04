Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N5cSR-0003Vz-Gc
	for openembedded-devel@openembedded.org; Wed, 04 Nov 2009 10:47:18 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA49h8iK018516
	for <openembedded-devel@openembedded.org>; Wed, 4 Nov 2009 09:43:08 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id khSkj88kkP3L for <openembedded-devel@openembedded.org>;
	Wed,  4 Nov 2009 09:43:08 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA49h1iS018502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>; Wed, 4 Nov 2009 09:43:06 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <alpine.LFD.2.00.0911040322240.18165@localhost>
References: <alpine.LFD.2.00.0911040236430.13299@localhost>
	<200911040919.51657.marcin@juszkiewicz.com.pl>
	<alpine.LFD.2.00.0911040322240.18165@localhost>
Date: Wed, 04 Nov 2009 09:42:24 +0000
Message-Id: <1257327744.30217.83.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: trying to get newest bitbake package into fedora
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
X-List-Received-Date: Wed, 04 Nov 2009 09:47:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-04 at 03:24 -0500, Robert P. J. Day wrote:
>   i could probably repackage it, i just wasn't sure if someone at OE
> monitored packaging requests like that or was notified by fedora when
> requests like that came in.  and i might as well update that BZ report
> since i notice that there's already a 1.8.16 release.  that was quick.
> show-stopper bug in 1.8.14?

During the release I screwed up and introduced a typo that was serious
enough to kill the .14 release :(.

Cheers,

Richard




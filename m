Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MTNTL-0005Re-Pz
	for openembedded-devel@openembedded.org; Wed, 22 Jul 2009 00:06:08 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6LLp0hn013255; Tue, 21 Jul 2009 22:51:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jr6tre6SWXmR; Tue, 21 Jul 2009 22:51:00 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6LLosQF013247
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 21 Jul 2009 22:50:55 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
In-Reply-To: <1248201134.26475.15.camel@dax.rpnet.com>
References: <1248201134.26475.15.camel@dax.rpnet.com>
Date: Tue, 21 Jul 2009 22:49:52 +0100
Message-Id: <1248212992.26475.35.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [Bitbake-dev] Bitbake runqueue performance improvement
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
X-List-Received-Date: Tue, 21 Jul 2009 22:06:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-07-21 at 19:32 +0100, Richard Purdie wrote:
> The attached patch rewrites the problematic function entirely with the
> following benefits:

Of course one of my last minute cosmetic cleanups broke it :(.

http://git.pokylinux.org/cgit.cgi/poky/commit/?id=502bd2ef92f6cddf74ac85279dab621372791dc0 is the key fix with a couple of other things I noticed too.

Cheers,

Richard

-- 
Richard Purdie
Intel Open Source Technology Centre




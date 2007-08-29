Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IQVgo-0006I7-3U
	for openembedded-devel@openembedded.org; Thu, 30 Aug 2007 00:07:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7TM5FFT005614
	for <openembedded-devel@openembedded.org>;
	Wed, 29 Aug 2007 23:05:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05235-07 for <openembedded-devel@openembedded.org>;
	Wed, 29 Aug 2007 23:05:07 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7TM55d4005597
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 29 Aug 2007 23:05:05 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0708291421p418dc698vdda76fa4deabcbbf@mail.gmail.com>
References: <1187692103.6234.7.camel@localhost.localdomain>
	<46CC3773.8010707@dominion.kabel.utwente.nl>
	<109919.20070822152350@vanille-media.de>
	<c384c5ea0708291421p418dc698vdda76fa4deabcbbf@mail.gmail.com>
Date: Wed, 29 Aug 2007 23:05:04 +0100
Message-Id: <1188425104.6238.51.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: Upgrade OE.dev to bitbake 1.8.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2007 22:07:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-08-29 at 23:21 +0200, Leon Woestenberg wrote:
> Are the OE->bitbake version-dependencies documented or tagged anywhere?
> 
> If not yet, I would propose to tag the OE repository with a tag like
> "PRE-BITBAKE-1_8_8" or whatever is supported/desired for mtn/oe.

$ cat conf/sanity.conf | grep VER
BB_MIN_VERSION = "1.8.5"

Cheers,

Richard




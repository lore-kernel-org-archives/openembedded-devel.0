Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GnfKU-0007mw-Ir
	for openembedded-devel@openembedded.org; Fri, 24 Nov 2006 18:59:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAOHuArG001891
	for <openembedded-devel@openembedded.org>; Fri, 24 Nov 2006 17:56:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01459-06 for <openembedded-devel@openembedded.org>;
	Fri, 24 Nov 2006 17:56:08 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAOHu5gM001866
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 24 Nov 2006 17:56:05 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200611241703.26332.openembedded@hrw.one.pl>
References: <200610291528.40663.openembedded@hrw.one.pl>
	<200611170101.06186.openembedded@hrw.one.pl>
	<1163755540.5551.4.camel@localhost.localdomain>
	<200611241703.26332.openembedded@hrw.one.pl>
Date: Fri, 24 Nov 2006 17:56:11 +0000
Message-Id: <1164390972.26934.33.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: handling of machine/distro features stuff
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
X-List-Received-Date: Fri, 24 Nov 2006 17:59:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-11-24 at 17:03 +0100, Marcin Juszkiewicz wrote:
> Koen suggested other solution - marking packages MACHINE specific when
> COMBINED_FEATURES are used. For example wpa-supplicant will get this:
>[...]
> Opinions?

Looks good to me.

Cheers,

Richard




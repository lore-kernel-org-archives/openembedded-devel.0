Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HO0Mi-0000D0-RN
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 00:43:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l24NhiR3011842
	for <openembedded-devel@openembedded.org>; Sun, 4 Mar 2007 23:43:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11645-02 for <openembedded-devel@openembedded.org>;
	Sun,  4 Mar 2007 23:43:42 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l24NheLI011834
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 4 Mar 2007 23:43:40 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1BCC2700-6848-45BC-8A5E-4CA7295A66B6@selfish.org>
References: <3812EAEB-7EFE-40F3-8311-1047D0540BD6@selfish.org>
	<20070304175316.GA4152@hovland.org>
	<1BCC2700-6848-45BC-8A5E-4CA7295A66B6@selfish.org>
Date: Sun, 04 Mar 2007 23:43:41 +0000
Message-Id: <1173051821.5832.28.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Recent wordpress attacks and md5sum
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
X-List-Received-Date: Sun, 04 Mar 2007 23:43:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-03-04 at 21:53 +0100, Holger Freyther wrote:
> Am 04.03.2007 um 18:53 schrieb Erik Hovland:
> 
> > On Sun, Mar 04, 2007 at 05:54:08PM +0100, Holger Freyther wrote:
> >> PPS: Yeah md5 is cracked, so is the sha family, any other options?
> >
> > Use sha256sum? NIST strongly encourages users to switch to sha-256 now
> > until they finish their hash competition.
> >
> > sha256sum does come with modern versions of coreutils. SHA-256 should
> > not be compromised yet...

> not being a crypto expert I heard complains of inbreed of the whole  
> sha family. But I think sha256 is totally fine for our purpose (only  
> the sums are so long...)

Would it be better to have a file with a list of urls and a list of
checksums?

Richard




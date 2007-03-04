Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zecke@selfish.org>) id 1HNxiN-0001VD-6R
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 21:53:55 +0100
Received: from [91.64.160.193] (helo=[192.168.1.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HNxiM-0001ki-Ly
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 21:53:54 +0100
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <20070304175316.GA4152@hovland.org>
References: <3812EAEB-7EFE-40F3-8311-1047D0540BD6@selfish.org>
	<20070304175316.GA4152@hovland.org>
Message-Id: <1BCC2700-6848-45BC-8A5E-4CA7295A66B6@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Sun, 4 Mar 2007 21:53:45 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 91.64.160.193
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
X-List-Received-Date: Sun, 04 Mar 2007 20:53:55 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 04.03.2007 um 18:53 schrieb Erik Hovland:

> On Sun, Mar 04, 2007 at 05:54:08PM +0100, Holger Freyther wrote:
>> PPS: Yeah md5 is cracked, so is the sha family, any other options?
>
> Use sha256sum? NIST strongly encourages users to switch to sha-256 now
> until they finish their hash competition.
>
> sha256sum does come with modern versions of coreutils. SHA-256 should
> not be compromised yet...

Hi Erik,

not being a crypto expert I heard complains of inbreed of the whole  
sha family. But I think sha256 is totally fine for our purpose (only  
the sums are so long...)

h.



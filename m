Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1Il8T7-0007xR-72
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2007 21:34:13 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.1.23]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Il87N-0006m1-Uw
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2007 21:11:45 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <200710251911.29188.openembedded@haerwu.biz>
References: <200710251911.29188.openembedded@haerwu.biz>
Message-Id: <7E77B77D-E298-45B1-A637-96EA2EDCD749@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Thu, 25 Oct 2007 21:11:23 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Subject: Re: [RFC] src_distribute class change
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
X-List-Received-Date: Thu, 25 Oct 2007 19:34:13 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 25.10.2007 um 19:11 schrieb Marcin Juszkiewicz:

> As I do not know how many people use this class I prefer to write  
> about
> changes and wait for comments. If there will be no comments until  
> Monday
> 29 October 2007 I will merge it like it is.

After a small question on IRC I'm fine with it. This avoids us  
maintaining the license.conf as the distributor needs to recheck the  
result anyway. And this way he will be able to see every license.


z.



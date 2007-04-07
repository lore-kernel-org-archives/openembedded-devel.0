Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zecke@selfish.org>) id 1Ha8GD-0000f8-HI
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Apr 2007 12:35:09 +0200
Received: from [91.64.161.147] (helo=[192.168.10.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Ha8GC-0000ga-SI
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Apr 2007 12:35:08 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <46176E51.2030608@dominion.kabel.utwente.nl>
References: <46176E51.2030608@dominion.kabel.utwente.nl>
X-Gpgmail-State: !signed
Message-Id: <CD2A5546-06FC-414A-9C74-FB640EBFC4A5@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Sat, 7 Apr 2007 12:34:53 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 91.64.161.147
Subject: Re: [RFC] rm_work
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
X-List-Received-Date: Sat, 07 Apr 2007 10:35:09 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 07.04.2007 um 12:11 schrieb Koen Kooi:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
> In the last few weeks that I've used rm_work, I haven't found any  
> big problems with it,
> but as Graeme points out, there is no easy way to disable yet.
>
> What do you think?

Hi,

how many recipes still break with rm_work, is there a documentation  
which tasks to add and link to unbreak rm_work (if it breaks). I'm  
still uncertain if the cleaning should be done by bitbake itself.


z.




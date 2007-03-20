Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <freyther@gmx.net>) id 1HTT5e-0006IE-SG
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2007 02:24:42 +0100
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.1.23]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <freyther@gmx.net>) id 1HTT5e-0007Gr-9s
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2007 02:24:42 +0100
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <45FF29BF.1040008@whitby.id.au>
References: <74d0deb30701310740p73af77a7j25a8b4597345903a@mail.gmail.com>
	<1174346093.5824.89.camel@localhost.localdomain>
	<45FF29BF.1040008@whitby.id.au>
Message-Id: <74BCF2CF-3650-4464-9E51-CA853E3DCDFA@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Tue, 20 Mar 2007 02:24:35 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Subject: Re: [PATCH] Epoch support for bitbake
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
X-List-Received-Date: Tue, 20 Mar 2007 01:24:42 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 20.03.2007 um 01:24 schrieb Rod Whitby:

> Richard Purdie wrote:
>> Thanks for this, I just checked it in unchanged to bitbake trunk
>> (1.9.x). If people test it and are happy, I'm happy for it to be
>> backported for 1.8.2 too, at which point OE.dev can maybe start to  
>> rely
>> upon it.
>
> Dunno whether this is important or not, but OpenMoko (which is now  
> using
> svn overlaying OE .dev, not a frozen OE version) uses bitbake 1.6.x  
> with
> custom svnnow patches.
>
> So OE.dev starting to rely on epoch support may (I dunno, just asking
> the experts) break OpenMoko until they port their svnnow patches to  
> 1.8
> and move everyone building openmoko from the official openmoko svn/OE
> distro (not the OE.dev-only "openmoko" distro) over to that.

Hi Rod,

I assume that henryk will port his work to bitbake trunk/1.8 and it  
is highly likely (actually pretty obvious) that we will accept the  
patch. And at this point it is a potential backporting candidate for  
1.8.2.

z.



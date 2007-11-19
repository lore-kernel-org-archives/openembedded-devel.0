Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1Iu7qE-0004Gc-GV
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2007 15:43:14 +0100
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.1.23]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Iu7oF-0006lj-Ah
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2007 15:41:11 +0100
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <20071119120819.GA17788@lenovo>
References: <20071119120819.GA17788@lenovo>
Message-Id: <C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Mon, 19 Nov 2007 15:41:07 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Mon, 19 Nov 2007 14:43:14 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 19.11.2007 um 13:08 schrieb David Farning:

> This eliminates many of problems the new users have setting up bb
> and oe.  There is no need to know any thing about svn of monotone.

Hey,

this is the issue you want to solve? IMO developers should know about  
how to build software and this includes getting the source. I think  
it is no use in hiding OpenEmbedded and BitBake behind a GNU Makefile.

I have the feeling that the issue you want to solve needs to be  
solved by the distro/origanisation to provide a SDK so people can  
build software.

z.

PS: This doesn't change the fact that we need better documentation...



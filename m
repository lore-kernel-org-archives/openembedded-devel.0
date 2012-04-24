Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SMmlc-0003Hi-9y
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 22:55:20 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SMmcN-0001cg-JH
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 22:45:47 +0200
Message-ID: <1335300289.3133.136.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Apr 2012 21:44:49 +0100
In-Reply-To: <4F970F9C.7030508@gmail.com>
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
	<4F8F8749.8000803@gmail.com>
	<CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
	<4F90B056.5020209@gmail.com> <4F9144BE.1070508@mlbassoc.com>
	<4F91A4E4.2090608@gmail.com> <4F932ADB.7040003@gmail.com>
	<4F970F9C.7030508@gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [oe-core] 3 build machines all failing in the same manner - was:ld segfault cant figure it out
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
X-List-Received-Date: Tue, 24 Apr 2012 20:55:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-24 at 13:39 -0700, j wrote:
> So the qa.log I attached previously is meaningless? The 
> warnings/messages mean nothing? To me the ld segfault is the reason most 
> of qa.log has messages. Also why would oe-classic build on my laptop and 
> one of the borrowed machines with no segfaults and no issues with the 
> completed images, but then doing the new setup and version used gives me 
> the build issues on multiple machines. I also do not understand why if 
> while building, the build machine segfaults while building some package 
> but the "offending" package does not fail.

What exactly do you mean by "the build machine segfaults"?  What
precisely is the problem that you're having, and which particular
messages in qa.log do you think are associated with "the ld segfault"?

p.





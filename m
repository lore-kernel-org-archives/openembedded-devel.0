Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QJ8Ke-00067i-HU
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 20:03:52 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 71628799012; Sun,  8 May 2011 20:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-070-129-150.pools.arcor-ip.net
	[88.70.129.150]) by gravedo.de (Postfix) with ESMTPSA id D170D798D6F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 May 2011 20:01:10 +0200 (CEST)
Message-ID: <4DC6DA66.8090609@gravedo.de>
Date: Sun, 08 May 2011 20:01:10 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DC6CA02.1000009@gravedo.de>	<1304873759-20379-1-git-send-email-morphis@gravedo.de>	<BANLkTinj7NmL9h8R3EVC78YgPUaiBGqyFg@mail.gmail.com>	<4DC6D765.8060706@gravedo.de>
	<BANLkTin_n8bs3cwNxjU7HrnjBEr+rh4j-Q@mail.gmail.com>
In-Reply-To: <BANLkTin_n8bs3cwNxjU7HrnjBEr+rh4j-Q@mail.gmail.com>
Subject: Re: [PATCH] qt4-native: introduce the native version of qt4
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
X-List-Received-Date: Sun, 08 May 2011 18:03:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08.05.2011 19:54, Otavio Salvador wrote:
> On Sun, May 8, 2011 at 14:48, Simon Busch <morphis@gravedo.de> wrote:
>> On 08.05.2011 19:18, Otavio Salvador wrote:
>>> Please remove the tools recipe too.
>>
>> Yes, I will provide a patch for this too. But first I want to know if
>> you are fine with this patch?
> 
> For me it seems fine however I'd prefer if you drop the tools one at
> same commit so it is easier to revert if required.

Ok, I will send a patch which does both, adding the new and removing the
old recipe. I will even provided all versions of qt4 supported by
qt4-tools-native.

> BTW, it would be nice if you could do the same for oe-core :-)

I can but I have to setup the environment first to test everything. So
this will need some time.

regards,
Simon




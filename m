Received: from smtp-out16.tpgi.com.au ([220.244.226.126]
	helo=mail16.tpgi.com.au) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc@cpdesign.com.au>) id 1PvTEK-0006gj-LN
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 12:31:33 +0100
X-TPG-Junk-Checked: Yes
X-TPG-Junk-Status: Message not scanned because user authenticated using SMTP
	AUTH
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=220-244-174-13.static.tpgi.com.au; ip=220.244.174.13;
	date=Fri, 4 Mar 2011 22:10:09 +1100;
	auth=jN+vu9lIznpdsLAI8D8JiNICYhl1zChPtcoQj/CnROE=
Received: from dev1.localnet (220-244-174-13.static.tpgi.com.au
	[220.244.174.13]) (authenticated bits=0)
	by mail16.tpgi.com.au (envelope-from marc@cpdesign.com.au)
	(8.14.3/8.14.3) with ESMTP id p24BA75f007734; 
	Fri, 4 Mar 2011 22:10:09 +1100
From: Marc Reilly <marc@cpdesign.com.au>
Organization: Creative Product Designs
To: Jan Kobler <eng1@koblersystems.de>
Date: Fri, 4 Mar 2011 22:09:44 +1100
User-Agent: KMail/1.13.5 (Linux/2.6.34.7-0.7-desktop; KDE/4.4.4; x86_64; ; )
References: <1298984498-27148-1-git-send-email-eng1@koblersystems.de>
	<201103030924.09980.marc@cpdesign.com.au>
	<4D70B652.7010706@koblersystems.de>
In-Reply-To: <4D70B652.7010706@koblersystems.de>
MIME-Version: 1.0
Message-Id: <201103042209.44904.marc@cpdesign.com.au>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [pcm043 1/2] New machine pcm043 Phytec phyCORE-i.MX35
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
X-List-Received-Date: Fri, 04 Mar 2011 11:31:33 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Jan,


> 1. I have not found a libgles-mx31 either.

Google doesn't say much about it. From memory (1 day ago :| ) the related 
posts were quite old, and it was mainly just wrapping up libs, headers and 
precompiled modules that freescale supplied..

> This seems to provide the binary openGL ES library for the i.MX31, like
> libgles-omap3 for the beagleboard. 

> 3. The i.MX35 has an embedded 2D and vector graphics accelerator
> targeting the OpenVG 1.1 graphics API and feature set. The libgles-mx31
> is for a different GPU. The i.MX35 doesn't need the libgles-mx31.
> 

I was hoping to look at the libgles recipe and do something similar with the 
OpenVG stuff..

> 
> 4. Are you trying to create an image, where libgles-mx31 is missing?

No, but video playback is quite slow, so I was looking for a cheap fix to 
speed it up :)


Cheers
Marc



Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ooep5-0002fr-9W
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 17:57:04 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OoeoY-0004em-Et from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 08:56:30 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 26 Aug 2010 08:56:30 -0700
Received: from [172.30.80.146] ([172.30.80.146]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 26 Aug 2010 09:56:28 -0600
Message-ID: <4C768EA4.70902@mentor.com>
Date: Thu, 26 Aug 2010 08:56:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimT-Bwj8mnJk8uHhXFXhauHv0PO0P2eZic9bMbD@mail.gmail.com>
In-Reply-To: <AANLkTimT-Bwj8mnJk8uHhXFXhauHv0PO0P2eZic9bMbD@mail.gmail.com>
X-OriginalArrivalTime: 26 Aug 2010 15:56:29.0104 (UTC)
	FILETIME=[3EE71300:01CB4537]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: remove cdrtools ?
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
X-List-Received-Date: Thu, 26 Aug 2010 15:57:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> While browsing through our recipes I found this:
> cdrtools/cdrtools-native_2.01.01_alpha77.bb
> 
> This was added in 2006 by Raymond Danks, I did some cleaning 1.5 year
> ago, Holger moved it to the latest version last march.
> 
> When I wanted to attack this device to remove legacy staging, I
> suddenly asked myself: why do we have this recipe in the first place?

It's needed for making ISO images of which I thought we used to support 
(boot CDs for x86 boards for example).

-- 
Tom Rini
Mentor Graphics Corporation



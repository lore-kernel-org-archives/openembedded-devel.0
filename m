Received: from smtp-out114.alice.it ([85.37.17.114])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NR7f3-0008IW-Il
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 18:21:12 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out114.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 2 Jan 2010 18:19:08 +0100
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 2 Jan 2010 18:19:08 +0100
Received: from [192.168.1.116] ([79.11.151.179]) by FBCMCL01B01.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 2 Jan 2010 18:19:08 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BAY127-W5DE44CC203D3230ABC3C7D8790@phx.gbl>
References: <BAY127-W5DE44CC203D3230ABC3C7D8790@phx.gbl>
Date: Sat, 02 Jan 2010 18:19:07 +0100
Message-Id: <1262452747.5161.36.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 02 Jan 2010 17:19:08.0194 (UTC)
	FILETIME=[B1432820:01CA8BCF]
X-SA-Exim-Connect-IP: 85.37.17.114
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in using output
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
X-List-Received-Date: Sat, 02 Jan 2010 17:21:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-12-30 at 20:31 +0500, saleh usman wrote:
> 
> Hi 
> I've successfully built console image
> by using bitbake.My target board has a ARM9 GPP and C64 DSP.Linux have
> been ported
> and  running on GPP.How can I run generated output on my
> board .Actually I am new to linux and unfamiliar with file
> system and executables of linux.I don't know exactly how and where  to
> use which files/images generated in temp/deploy. 
It depends a lot on the specificities of your target board.
I think you should look at the documentation of your board to see how to
boot an image...
Denis.






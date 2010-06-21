Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OQiL1-0004BW-2F
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 16:51:04 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OQiGZ-0003Q6-EU from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 07:46:27 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 21 Jun 2010 07:46:27 -0700
Received: from [172.30.80.158] ([172.30.80.158]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Jun 2010 08:46:26 -0600
Message-ID: <4C1F7B40.3060609@mentor.com>
Date: Mon, 21 Jun 2010 07:46:24 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinfB8ijBzNHOoUSbkYIE-9Fug4nc-HOP8EICHzA@mail.gmail.com>
In-Reply-To: <AANLkTinfB8ijBzNHOoUSbkYIE-9Fug4nc-HOP8EICHzA@mail.gmail.com>
X-OriginalArrivalTime: 21 Jun 2010 14:46:26.0374 (UTC)
	FILETIME=[869DDE60:01CB1150]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-libc-headers-native, gcc-cross issue
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
X-List-Received-Date: Mon, 21 Jun 2010 14:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> Dear all,
> 
> After the introduction of linux-libc-headers-native I've bumped into
> the following issue.
> linux-libc-headers-native installs unistd.h in sysroots
> This causes other recipes to pick up the x86 files instead of the target ones.
> I've seen this happen for both unistd.h and sigcontext.h

What DISTRO/MACHINE are you using?

-- 
Tom Rini
Mentor Graphics Corporation



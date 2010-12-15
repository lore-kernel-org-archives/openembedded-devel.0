Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PSsay-0003bN-2s
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 15:44:45 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PSsZN-0001YW-Ek from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 06:43:05 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 15 Dec 2010 06:43:04 -0800
Received: from [172.30.80.111] ([172.30.80.111]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 15 Dec 2010 07:43:03 -0700
Message-ID: <4D08D3F5.1060608@mentor.com>
Date: Wed, 15 Dec 2010 07:43:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimTaZyPywc_B8g4k4QO+gTJq67K=OgcoSe6BpJh@mail.gmail.com>
In-Reply-To: <AANLkTimTaZyPywc_B8g4k4QO+gTJq67K=OgcoSe6BpJh@mail.gmail.com>
X-OriginalArrivalTime: 15 Dec 2010 14:43:03.0966 (UTC)
	FILETIME=[61169BE0:01CB9C66]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-12-10 (wiki, results, bluez-libs)
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
X-List-Received-Date: Wed, 15 Dec 2010 14:44:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2010 12:51 AM, Frans Meulenbroeks wrote:
> Dear all,
>
> I just wanted to update the testing table with my entries and I
> noticed two (possibly related) things.
> - no other entries for 2010-12-10 are there yet (and it is already wednesday)

I haven't updated the stuff we're building since just about everything 
failed due to the gcc issue Khem fixed in 
2c8570552549da2e11428d08b2bc08849cac39b1.  This is why I sometimes 
wonder if it would be desirable to cherry-pick a few things in to the 
testing-next branch.

-- 
Tom Rini
Mentor Graphics Corporation



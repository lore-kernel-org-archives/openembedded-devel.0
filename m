Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OdRGc-0002rN-Jp
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 19:15:08 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OdRGL-0005JK-D3 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 10:14:49 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 26 Jul 2010 10:14:49 -0700
Received: from [172.30.80.16] ([172.30.80.16]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 26 Jul 2010 11:14:47 -0600
Message-ID: <4C4DC285.3070201@mentor.com>
Date: Mon, 26 Jul 2010 10:14:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C4D586A.5040202@kernelconcepts.de>	<i2jrnl$4j3$2@dough.gmane.org>	<AANLkTimRxtBib-WUkcm75eNLQvws8Rw-Nf-Z6uQvFetR@mail.gmail.com>	<i2julr$fbh$1@dough.gmane.org>	<FABAFD53-F00E-4D6E-811E-4249C9853C8C@vanille-media.de>
	<4C4D862E.2050202@kernelconcepts.de>
In-Reply-To: <4C4D862E.2050202@kernelconcepts.de>
X-OriginalArrivalTime: 26 Jul 2010 17:14:48.0018 (UTC)
	FILETIME=[0CDE3320:01CB2CE6]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: native preferences
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
X-List-Received-Date: Mon, 26 Jul 2010 17:15:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Florian Boor wrote:
> Hi,
> 
> Dr. Michael Lauer schrieb:
>> Of course the preferred way - rather than switching distros - is to fix this obvious bug
>> in the OE metadata.
> 
> yes I see it like this. Switching to a distribution that pins more versions is
> not really what I would call a fix. It is a workaround but should not become the
> default way to deal with such issues in OE.
> What we introduced here is clearly a bug in OE and not the distributions fault.

Except that it's a bitbake issue, not a metadata issue, iirc (which is 
why it's fixed in the 1.10 branch, but not 1.8).

-- 
Tom Rini
Mentor Graphics Corporation



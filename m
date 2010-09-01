Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Oqusd-0004ih-HF
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 23:30:04 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Oqus4-0003ZW-0l from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 14:29:28 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 1 Sep 2010 14:29:27 -0700
Received: from [172.30.80.207] ([172.30.80.207]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 1 Sep 2010 15:29:26 -0600
Message-ID: <4C7EC5B2.5090202@mentor.com>
Date: Wed, 01 Sep 2010 14:29:22 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimeV1FbwQCMYL7WH3tuo_zwcYX1o9cs1H66VPhu@mail.gmail.com>	<AANLkTinqVEs+Uh6jNJJVzqjE2SXMbM1ni60nUx+qtXka@mail.gmail.com>	<AANLkTimamK0_tQw32zWAuANT2fBTDgSHUdPZPWbe-E-3@mail.gmail.com>	<AANLkTimEE4VSR3C6XSQUCYXTgbA1m=Zdw1f8w9vm76_X@mail.gmail.com>
	<AANLkTimwWFkDscFgDvQQzNbXm+t4SXKnCbWQobK2nu9U@mail.gmail.com>
In-Reply-To: <AANLkTimwWFkDscFgDvQQzNbXm+t4SXKnCbWQobK2nu9U@mail.gmail.com>
X-OriginalArrivalTime: 01 Sep 2010 21:29:26.0574 (UTC)
	FILETIME=[C0E194E0:01CB4A1C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml-namespacesupport-perl stuck in do configure
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
X-List-Received-Date: Wed, 01 Sep 2010 21:30:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/9/1 J. L. <vwyodapink@gmail.com>:
>> Thanks Frans that fixed it by setting up CPAN on the build machine :)
> 
> J.L, thanks for reporting this back.
> 
> Actually we do need a real fix for this.
> any perl wizards that can take this up?

I'm confused since I thought I had done this already with 
71a16be679041bb042c02f0f59c56141d963562c

-- 
Tom Rini
Mentor Graphics Corporation



Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PE0LG-0001jM-AG
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 14:59:02 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PE0KQ-0001nH-4o from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 06:58:10 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 4 Nov 2010 06:58:09 -0700
Received: from [172.30.80.135] ([172.30.80.135]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 4 Nov 2010 07:58:09 -0600
Message-ID: <4CD2BBEE.9060706@mentor.com>
Date: Thu, 04 Nov 2010 06:58:06 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <09D9BE2AC4AA764DABAA8C91E48D819ED3A429F2@DEMCHP99E35MSX.ww902.siemens.net>	<09D9BE2AC4AA764DABAA8C91E48D819ED3A42A56@DEMCHP99E35MSX.ww902.siemens.net>	<4CD2B685.4040409@mentor.com>
	<09D9BE2AC4AA764DABAA8C91E48D819ED3A42AA6@DEMCHP99E35MSX.ww902.siemens.net>
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819ED3A42AA6@DEMCHP99E35MSX.ww902.siemens.net>
X-OriginalArrivalTime: 04 Nov 2010 13:58:09.0587 (UTC)
	FILETIME=[502D4030:01CB7C28]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: packaged-staging
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
X-List-Received-Date: Thu, 04 Nov 2010 13:59:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Aeschbacher, Fabrice wrote:
>> Aeschbacher, Fabrice wrote:
>>> I forgot to say we are using bitbake 1.8.12 and branch stable/2009 
>> packaged-staging isn't complete there, sorry.
>>
>> Tom Rini
> 
> Is it with bitbake-1.8.18 and stable/2009 ?

Sorry, bitbake 1.10.x and master (aka dev) are required for packaged 
staging to be functional.

-- 
Tom Rini
Mentor Graphics Corporation



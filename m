Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1PkL6C-0007NS-Ss
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 19:37:08 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 7733EEA378
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Feb 2011 19:36:05 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmMcAJrhR01T4zjzPGdsb2JhbAAMiFSOBo4uAQEBATWwMQGNB4VTBIwj
X-IronPort-AV: E=Sophos;i="4.60,411,1291590000"; d="scan'208";a="1710973337"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.243])
	by ipb4.telenor.se with ESMTP; 01 Feb 2011 19:36:05 +0100
Message-ID: <4D485293.2000103@atmel.com>
Date: Tue, 01 Feb 2011 19:36:03 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296506034-4615-1-git-send-email-ulf.samuelsson@atmel.com>
	<20110201073736.GA2981@chargestorm.se>
In-Reply-To: <20110201073736.GA2981@chargestorm.se>
Subject: Re: [PATCH] Add support for u-boot-2010.12 & multiple binaries
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
X-List-Received-Date: Tue, 01 Feb 2011 18:37:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-02-01 08:37, Anders Darander skrev:
> Hi,
>
> Just something that I found while taking a quick glance at your patches.
>
> * Ulf Samuelsson<ulf.samuelsson@atmel.com>  [110131 21:40]:
>>   recipes/libgpod/libimobiledevice_1.0.0.bb          |    2 +-
>>   recipes/python/python.inc                          |    1 +
> I assume these are modified by mistake?
>
> Regards,
> Anders
>

I needed them to complete the build, but they
do not belong here so I will remove them.

-- 
Best Regards
Ulf Samuelsson




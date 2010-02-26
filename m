Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1Nl4y4-000421-ON
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 19:31:17 +0100
Received: from [192.168.1.141] (95-90-75-53-dynip.superkabel.de [95.90.75.53])
	by dd20204.kasserver.com (Postfix) with ESMTP id E8CC2184A3AF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 19:28:31 +0100 (CET)
Message-ID: <4B8812CC.9030001@opensimpad.org>
Date: Fri, 26 Feb 2010 19:28:28 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1267186167-28814-1-git-send-email-Bernhard.Guillon@opensimpad.org>
	<201002261318.46211.marcin@juszkiewicz.com.pl>
In-Reply-To: <201002261318.46211.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 85.13.140.93
X-SA-Exim-Mail-From: Bernhard.Guillon@opensimpad.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-2.6.29: atngw100 - add bridge module to	defconfig, bump PR
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
X-List-Received-Date: Fri, 26 Feb 2010 18:31:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> Can you merge all things into recipes/linux/linux/atngw100/defconfig? It was 
> generated with 2.6.29 kernel and I would like to be able to use this 
> configuration with 2.6.30-33 kernels as well.
>
>   
Ok, done :) (sent patch the list)

> I cannot test this on device now.
>
>   

I tested it on my device. It will hopefully get an IDS soon.

Best regards
Bernhard Guillon




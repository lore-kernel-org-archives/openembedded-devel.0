Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SKnBt-00024w-S7
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 10:58:13 +0200
Received: from [192.168.0.56] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id E21E947542
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2012 09:39:19 +0100 (BST)
Message-ID: <4F8FD18C.7020400@communistcode.co.uk>
Date: Thu, 19 Apr 2012 09:49:16 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1334792522.59161.YahooMailNeo@web121604.mail.ne1.yahoo.com>
In-Reply-To: <1334792522.59161.YahooMailNeo@web121604.mail.ne1.yahoo.com>
Subject: Re: Help with first compile
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
X-List-Received-Date: Thu, 19 Apr 2012 08:58:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/12 00:42, maniacbug wrote:
> Hi.  I am trying to bring up OE for the first time, following this guide:  http://docs.openembedded.org/usermanual/usermanual.html.  Running on Ubuntu 11.10.
snip...

> NOTE:<type 'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, line 1) while evaluating:
> ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "${PREFERRED_PROVIDER_virtual/update-alternatives}", d)}    
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

I would suggest starting at www.yoctoproject.org if you are new to 
OpenEmbedded. They have guides which are up to date and new user 
friendly. If you don't want to use the suggested 'poky' distro that 
yocto uses the guides still relate to OpenEmbedded as that is what Poky 
uses as it's base.

Regards,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--




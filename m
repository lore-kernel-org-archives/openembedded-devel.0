Received: from [93.186.196.80] (helo=mis07.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mailings@hardware-datenbank.de>) id 1MgmFy-0000MR-KW
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 23:11:42 +0200
Received: by mis07.de (Postfix, from userid 65534)
	id 39CFC144E027; Thu, 27 Aug 2009 22:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on mis07.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=ALL_TRUSTED,AWL
	autolearn=disabled version=3.2.5
Received: from pcvirus (p5DC8F70E.dip.t-dialin.net [93.200.247.14])
	by mis07.de (Postfix) with ESMTPA id 537A2144E01C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 22:53:35 +0200 (CEST)
Message-ID: <9DACC7DD08D24732B789F4CCFC1145EC@pcvirus>
From: "rath" <mailings@hardware-datenbank.de>
To: <openembedded-devel@lists.openembedded.org>
References: <17EB92EC37534805AA9639B72BDB7947@pcvirus>
	<h71i51$7na$1@ger.gmane.org>
Date: Thu, 27 Aug 2009 22:53:24 +0200
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5843
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
Subject: Re: Recipe for libv4l
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
X-List-Received-Date: Thu, 27 Aug 2009 21:11:42 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit


The existing recipe only includes the V4L Api. But I also want the different 
drivers, which are included in this archiv:
http://linuxtv.org/hg/~hgoede/libv4l/archive/a1d79882b7eb.tar.bz2

> On 25-08-09 19:40, Rath wrote:
>> Hi,
>>
>> I've tried to write a recipe for libv4l, but I get a file not found
>> error and the kernel version is identified as 2.6.29 but I have
>> 2.6.29-omap1.
>> Here is the recipe: http://pastie.org/592125 and the compile log:
>> http://pastie.org/592124
>>
>> What's wrong with the recipe?
>
> Slightly different question: what's wrong the the existing recipe[1]?
>
> regards,
>
> Koen
>
> [1] 
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/v4l2apps/libv4l_0.5.8.bb
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 




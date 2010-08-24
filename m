Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OnnHK-0003OS-TM
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 08:46:40 +0200
Received: from compute3.internal (compute3.internal [10.202.2.43])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 2F5982AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 02:46:12 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute3.internal (MEProxy); Tue, 24 Aug 2010 02:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=sPogIE/S0Nxz/NqNF8LMW7rOXA8=;
	b=VFTRI7I0okS8cYUBuTHdqq9Ug5Z5H1jy9TVA8Be0OnL+oKdU7oq1K5vMcNg4qbxJSEaoCo2COutJ6qd/p0oKwyDb8mNuGifYeLqJh3M/QFozbcNCYcmFEC+e7AaCvIZt1ETVdM/xDevTBF3tWV6xLLrJIl04/iwyCAzVCDvPNc4=
X-Sasl-enc: F/GYY73fV1sSO4Usu+1kZR3xbxkCa0/Zt1toHL5vxuO4 1282632371
Received: from [192.168.1.39] (hnvr-4d079266.pool.mediaWays.net [77.7.146.102])
	by mail.messagingengine.com (Postfix) with ESMTPSA id A7A7140B2A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 02:46:11 -0400 (EDT)
Date: Tue, 24 Aug 2010 08:47:51 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTik-1P7AHQnMzWu0c4b=AZeESjV6Gd4mMrXLZjgN@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1008240846100.5745@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinr4-xEo+Urc_9P+uLmLk6qPJSRzCJNYVsKAxD6@mail.gmail.com>
	<alpine.LNX.2.00.1008191432360.5745@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinMr1=Bj8eK2D+mg_J-P6jzvSAQAhXNtgkK=u1n@mail.gmail.com>
	<alpine.LNX.2.00.1008201656030.5745@asterix.crazy-teaparty.dyndns.org>
	<AANLkTime=tuSZNkBnM6XacjEC2Nucix0UtWTJ1VehOsr@mail.gmail.com>
	<alpine.LNX.2.00.1008231134030.5745@asterix.crazy-teaparty.dyndns.org>
	<AANLkTik-1P7AHQnMzWu0c4b=AZeESjV6Gd4mMrXLZjgN@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: orphaned files
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
X-List-Received-Date: Tue, 24 Aug 2010 06:46:40 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Mon, 23 Aug 2010, Frans Meulenbroeks wrote:

> 2010/8/23 Vitus Jensen <vjensen@gmx.de>:
>> On Sat, 21 Aug 2010, Frans Meulenbroeks wrote:
>
>>> Vitus as the owner/maintainer of the recipe do you want me to reinstate
>>> 1.8.28 ?
>>
>> Yes, please do so.
>>
>> Afterwards I will move 1.8 and 1.9 to the current versions.
>>
> reverted the patch as requested.
>
> Vitus can you also try to merge the native and non-native recipe
> (BBCLASSEXTEBD = "native") and remove the legacy staging?

I feared that you may ask this :-D

It's on my agenda, I will try to do it next Saturday.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers



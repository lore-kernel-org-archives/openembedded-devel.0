Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lu1Ge-0008JQ-9L
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 11:18:56 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lu1Cw-00047p-7B
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 09:15:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 09:15:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 09:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Apr 2009 11:12:57 +0200
Message-ID: <gs48ep$uv$1@ger.gmane.org>
References: <1239295376.4784.179.camel@alap> <grq8ig$eb3$1@ger.gmane.org>
	<1239630650.4784.208.camel@alap>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090407 Shredder/3.0b3pre
In-Reply-To: <1239630650.4784.208.camel@alap>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] epdfview: add page scrolling patch
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
X-List-Received-Date: Wed, 15 Apr 2009 09:18:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-04-09 15:50, Angus Ainslie wrote:
> On Sat, 2009-04-11 at 16:13 +0200, Koen Kooi wrote:
>> On 09-04-09 18:42, Angus Ainslie wrote:
>>>>  From a3c28e2ab81cf7fd1ff49c6be0380075230722d2 Mon Sep 17 00:00:00 2001
>>> From: Previdi Roberto<previdi.roberto@gmail.com>
>>> Date: Thu, 9 Apr 2009 10:26:51 -0600
>>> Subject: [PATCH] epdfview: add page scrolling patch
>>
>> What does that patch do?
>>
>> regards,
>>
>> Koen
>>
>
> It adds fingered page scrolling .

And what does that mean? How does it affect non touchscreen uses? How 
does it affect touchscreen uses? How does it interact with capacitive 
touchscreens, etc?




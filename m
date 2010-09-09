Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Othvs-00005S-Gs
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 16:16:57 +0200
Received: (qmail 14552 invoked by uid 1003); 9 Sep 2010 14:16:12 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	9 Sep 2010 14:16:12 -0000
Message-ID: <4C88EC2B.2090208@balister.org>
Date: Thu, 09 Sep 2010 10:16:11 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Fedora/3.1.2-1.fc13 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>	<1284024609.28520.1446.camel@mill.internal.reciva.com>	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
	<AANLkTimOLsxX_hf6rsOyOCJgFdBrkrL=2LsT9ToCfazv@mail.gmail.com>
In-Reply-To: <AANLkTimOLsxX_hf6rsOyOCJgFdBrkrL=2LsT9ToCfazv@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: tsc@openembedded.org
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Thu, 09 Sep 2010 14:16:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2010 10:06 AM, Chris Larson wrote:
> On Thu, Sep 9, 2010 at 3:11 AM, Frans Meulenbroeks<
> fransmeulenbroeks@gmail.com>  wrote:
>
>> Signed-off-by: Chase Maupin<chase.maupin@ti.com>
>> Acked-by: Denys Dmytriyenko<denys@ti.com>
>> Acked-by: Koen Kooi<k-kooi@ti.com>
>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>>
>> I would suggest modifying the commit policy disallowing these kind of
>> things, saying the two Ack's must be from two developers not
>> affiliated with the same company.
>>
>
> I'd agree with this quite strongly.  I'm generally pretty careful to let
> others review the changes from my coworkers, to avoid any bias.

This would be a good topic for OEDEM.

For the record, I am really happy to see the .com people actively 
participating in the the OE project. I am also glad that they are 
pushing stuff into .dev and not keeping it in private repositories. This 
is a very good thing.

Philip



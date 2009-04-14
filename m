Received: from [93.17.128.21] (helo=smtp23.services.sfr.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ptitjes@free.fr>) id 1LtpjK-0007pj-Hq
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 22:59:44 +0200
Received: from filter.sfr.fr (localhost [127.0.0.1])
	by msfrf2313.sfr.fr (SMTP Server) with ESMTP id 0F25F7000095;
	Tue, 14 Apr 2009 22:55:58 +0200 (CEST)
Received: from didier.local (unknown [93.6.66.28])
	by msfrf2313.sfr.fr (SMTP Server) with ESMTP id E22897000087;
	Tue, 14 Apr 2009 22:55:57 +0200 (CEST)
X-SFR-UUID: 20090414205557926.E22897000087@msfrf2313.sfr.fr
Message-ID: <49E4F85D.4090900@free.fr>
Date: Tue, 14 Apr 2009 22:55:57 +0200
From: "Didier \"Ptitjes\"" <ptitjes@free.fr>
User-Agent: Thunderbird 2.0.0.21 (Macintosh/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49E4C165.5070701@free.fr> <gs2hqh$mer$1@ger.gmane.org>
In-Reply-To: <gs2hqh$mer$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 93.17.128.21
X-SA-Exim-Mail-From: ptitjes@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [Darwin] cp -d fix in packaged-staging.bbclass
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
X-List-Received-Date: Tue, 14 Apr 2009 20:59:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 14-04-09 19:01, Didier "Ptitjes" wrote:
>> Fix thanks to kergoth.
>>
>>  From cce22835b4205649a61eb32dd41cd4f991190c85 Mon Sep 17 00:00:00 2001
>> From: Didier Villevalois <didier@didier.local>
>> Date: Tue, 14 Apr 2009 17:51:57 +0200
>> Subject: [PATCH] packaged-staging.bbclass: BSD doesn't support cp -d, so
>> change to -P
>>
>> Signed-off-by: Didier Villevalois <didier@didier.local>
> 
> 
> Ehm.... That looks suspicously like 
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=koen/darwin-host-fixes&id=9099f0865a74dbefa7cc7b377f8aac60a0458515 

Err! Sorry I missed it.
Didier.




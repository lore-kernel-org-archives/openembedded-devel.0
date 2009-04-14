Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LtmgS-0005HR-5q
	for openembedded-devel@openembedded.org; Tue, 14 Apr 2009 19:44:35 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ltmco-0001K0-PR
	for openembedded-devel@openembedded.org; Tue, 14 Apr 2009 17:40:46 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 14 Apr 2009 17:40:46 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 14 Apr 2009 17:40:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 14 Apr 2009 19:40:33 +0200
Message-ID: <gs2hqh$mer$1@ger.gmane.org>
References: <49E4C165.5070701@free.fr>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090407 Shredder/3.0b3pre
In-Reply-To: <49E4C165.5070701@free.fr>
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
X-List-Received-Date: Tue, 14 Apr 2009 17:44:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-04-09 19:01, Didier "Ptitjes" wrote:
> Fix thanks to kergoth.
>
>  From cce22835b4205649a61eb32dd41cd4f991190c85 Mon Sep 17 00:00:00 2001
> From: Didier Villevalois <didier@didier.local>
> Date: Tue, 14 Apr 2009 17:51:57 +0200
> Subject: [PATCH] packaged-staging.bbclass: BSD doesn't support cp -d, so
> change to -P
>
> Signed-off-by: Didier Villevalois <didier@didier.local>


Ehm.... That looks suspicously like 
http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=koen/darwin-host-fixes&id=9099f0865a74dbefa7cc7b377f8aac60a0458515

If someone wants to have a look at 
http://cgit.openembedded.net/cgit.cgi?url=openembedded/log/&h=koen/darwin-host-fixes 
and cherrypick fixes to .dev/stable, great!

regards,

Koen




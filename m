Received: from [75.125.193.18] (helo=alpha.vfshosting.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gremlin@gremlin.it>) id 1LukS3-0008BD-C8
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 11:33:44 +0200
X-ClientAddr: 127.0.0.1
Received: from sesha.loc (localhost.localdomain [127.0.0.1])
	by alpha.vfshosting.net (8.13.8/8.13.8) with ESMTP id n3H9Ta3J009507
	for <openembedded-devel@openembedded.org>;
	Fri, 17 Apr 2009 11:29:37 +0200
Message-ID: <49E84BFE.3070607@gremlin.it>
Date: Fri, 17 Apr 2009 11:29:34 +0200
From: Alessandro GARDICH <gremlin@gremlin.it>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <49E7A12F.7080008@gremlin.it> <gs9a7h$23k$1@ger.gmane.org>
In-Reply-To: <gs9a7h$23k$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 75.125.193.18
X-SA-Exim-Mail-From: gremlin@gremlin.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] rpm-native_4.4.2.3.bb
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
X-List-Received-Date: Fri, 17 Apr 2009 09:33:46 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 16-04-09 23:20, Alessandro GARDICH wrote:
>> make rpm-native don't fail on Q&A checj with "non dbg contains .debug,
>> rpm-native,
>> /work/i686-linux/rpm-native-4.4.2.3-r15/install/rpm-native/staging/i686-linux/usr/lib/rpm/.debug/rpmq" 
>>
>
> NACK:
>
> 1) this isn't in .dev yet
true, we have first to check in .dev ... my fault
> 2) since when do -native recipes generate packages?
really don't know, I hope Marcin will give more info about it
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
 /-------------------------------------------------------------\
|           Alessandro Gardich : gremlin@gremlin.it             |
 >-------------------------------------------------------------<
|  I never saw a wild thing sorry for itself.                   |
|  A small bird will drop frozen dead from a bough              |
|  without ever having felt sorry for itself.                   |
 \-------------------------------------------------------------/




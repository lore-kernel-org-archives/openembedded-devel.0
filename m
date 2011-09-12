Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1R38GR-0006Bl-K2
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 17:17:39 +0200
Received: (qmail 3535 invoked by uid 2404007); 12 Sep 2011 15:12:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from 87-206-60-144.dynamic.chello.pl (HELO ?192.168.1.112?)
	(marcin@juszkiewicz.com.pl@87.206.60.144)
	by host4.kei.pl with ESMTPA; 12 Sep 2011 15:12:33 -0000
Message-ID: <4E6E2161.3070004@juszkiewicz.com.pl>
Date: Mon, 12 Sep 2011 17:12:33 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110906 Thunderbird/7.0
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>, 
	openembedded-devel@lists.openembedded.org
References: <1315581753-7944-1-git-send-email-sledz@dresearch-fe.de>
	<4E6E1E32.6010307@dresearch-fe.de>
In-Reply-To: <4E6E1E32.6010307@dresearch-fe.de>
X-Enigmail-Version: 1.4a1pre
Subject: Re: [PATCH] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernels
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
X-List-Received-Date: Mon, 12 Sep 2011 15:17:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 12.09.2011 16:58, Steffen Sledz pisze:
>  SRC_URI_append_hipox = " \
>>  	file://siocoutqsnd.patch \
>> +	file://drbcc-linedisc.patch \
>>  	"
>>  

This got added... so NACK.



Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PcvJK-0005rd-4W
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 08:40:02 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id BDE1949127F;
	Wed, 12 Jan 2011 08:39:32 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 12 Jan 2011 08:39:32 +0100
Message-ID: <4D2D5AB1.6060808@dresearch.de>
Date: Wed, 12 Jan 2011 08:39:29 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294768042-30115-1-git-send-email-sledz@dresearch.de>
	<4D2D4859.3080109@gmail.com>
In-Reply-To: <4D2D4859.3080109@gmail.com>
X-OriginalArrivalTime: 12 Jan 2011 07:39:32.0973 (UTC)
	FILETIME=[DA85C9D0:01CBB22B]
Subject: Re: [PATCH] alsa-lib: fix packaging error
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
X-List-Received-Date: Wed, 12 Jan 2011 07:40:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 12.01.2011 07:21, schrieb Khem Raj:
> On 1/11/2011 9:47 AM, Steffen Sledz wrote:
>> * symlink libasound.so ->  libasound.so.2.0.0 was missing
>>
>> Signed-off-by: Steffen Sledz<sledz@dresearch.de>
> 
> can you put ${libdir}/libasound.so into libasound-dev

Put it into alsa-lib-dev. See [PATCH v2].

Steffen




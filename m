Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PdmA7-0007SQ-AL
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 17:06:03 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 4C97549127F;
	Fri, 14 Jan 2011 17:05:31 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 14 Jan 2011 17:05:31 +0100
Message-ID: <4D307445.4090901@dresearch.de>
Date: Fri, 14 Jan 2011 17:05:25 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTim9j=t8uDyabZbN4epTC-JwfmktyERydQsxxjyx@mail.gmail.com>
In-Reply-To: <AANLkTim9j=t8uDyabZbN4epTC-JwfmktyERydQsxxjyx@mail.gmail.com>
X-OriginalArrivalTime: 14 Jan 2011 16:05:31.0329 (UTC)
	FILETIME=[DE56CB10:01CBB404]
Subject: Re: testing branch 2011-01-13 - do_configure python failed
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
X-List-Received-Date: Fri, 14 Jan 2011 16:06:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

do_configure python - 2.6.5 - ml12.2 failed with:

checking getaddrinfo bug... buggy
Fatal: You must get working getaddrinfo() function.
       or you can specify "--disable-ipv6".
ERROR: Function do_configure failed

see <http://tinderbox.openembedded.net/packages/1709663/>




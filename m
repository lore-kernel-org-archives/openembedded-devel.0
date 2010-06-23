Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OROmG-0003J1-2s
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 14:10:29 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id DE237491286
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 14:05:25 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 23 Jun 2010 14:05:25 +0200
Message-ID: <4C21F881.6060700@dresearch.de>
Date: Wed, 23 Jun 2010 14:05:21 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.10) Gecko/20100512 Lightning/1.0b1 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <111b01cb123eb0466e0MAN_POSIXLY_CORRECT=1Distant-earth.com>	<1277273473-17376-1-git-send-email-sledz@dresearch.de>
	<hvsedp$kjb$1@dough.gmane.org>
In-Reply-To: <hvsedp$kjb$1@dough.gmane.org>
X-OriginalArrivalTime: 23 Jun 2010 12:05:26.0001 (UTC)
	FILETIME=[5D696E10:01CB12CC]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] udev/mount.sh: use lazy umount
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
X-List-Received-Date: Wed, 23 Jun 2010 12:10:37 -0000
X-List-Received-Date: Wed, 23 Jun 2010 12:10:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 23.06.2010 09:51, schrieb Koen Kooi:
> Acked-by: Koen Kooi <koen@openembedded.org>

OK, pushed.

Steffen





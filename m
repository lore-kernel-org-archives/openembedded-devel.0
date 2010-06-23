Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1ORJHs-0002mo-AQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 08:18:16 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 68441491284
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 08:13:42 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 23 Jun 2010 08:13:42 +0200
Message-ID: <4C21A61E.6040304@dresearch.de>
Date: Wed, 23 Jun 2010 08:13:50 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.10) Gecko/20100512 Lightning/1.0b1 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1277201329-1339-1-git-send-email-sledz@dresearch.de>	<hvq586$1jc$1@dough.gmane.org>	<4C20A60D.40102@dresearch.de>	<hvqhbh$hqo$2@dough.gmane.org>
	<111b01cb123e$c90177a0$5b0466e0$@Distant-earth.com>
In-Reply-To: <111b01cb123e$c90177a0$5b0466e0$@Distant-earth.com>
X-OriginalArrivalTime: 23 Jun 2010 06:13:42.0462 (UTC)
	FILETIME=[3AB8EDE0:01CB129B]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev/mount.sh: try to kill active processes before umount
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
X-List-Received-Date: Wed, 23 Jun 2010 06:18:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 22.06.2010 21:11, schrieb John Willis:
> There is little harm in a umount -l in the short term.

OK, i've prepared a new patch for this.

Because i forgot the --in-reply-to it started a new thread. Sorry.

Steffen




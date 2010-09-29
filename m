Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P0sx4-00062j-Mf
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 11:27:51 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 8ECAB491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 11:27:40 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 29 Sep 2010 11:27:40 +0200
Message-ID: <4CA3069C.5040700@dresearch.de>
Date: Wed, 29 Sep 2010 11:27:56 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CA0B4FF.3050601@dresearch.de>
	<1285601000-28294-1-git-send-email-t.fromm@dresearch.de>
In-Reply-To: <1285601000-28294-1-git-send-email-t.fromm@dresearch.de>
X-OriginalArrivalTime: 29 Sep 2010 09:27:40.0153 (UTC)
	FILETIME=[8FCF2690:01CB5FB8]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add falloc.h to the exported kernel header files.
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
X-List-Received-Date: Wed, 29 Sep 2010 09:27:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 27.09.2010 17:23, schrieb Thilo Fromm:
> This adds include/linux/falloc.h to the list of files
> exported by the kernel to the C library.
> The include file is required for building e.g. a recent util-linux-ng
> against 2.6.24.
> 
> Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>

Acked-by: Steffen Sledz <sledz@dresearch.de>




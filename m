Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NpOMU-0005aP-38
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 17:02:23 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 3B8DC491264
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 16:59:22 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 10 Mar 2010 17:00:12 +0100
Message-ID: <4B97C1DB.2050801@dresearch.de>
Date: Wed, 10 Mar 2010 16:59:23 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268156863.16526.133.camel@trini-m4400>	<1268213424-16360-1-git-send-email-sledz@dresearch.de>
	<1268233792.16526.168.camel@trini-m4400>
In-Reply-To: <1268233792.16526.168.camel@trini-m4400>
X-OriginalArrivalTime: 10 Mar 2010 16:00:12.0501 (UTC)
	FILETIME=[C43F0050:01CAC06A]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: introducing new image fstype .cpio.gz.u-boot
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
X-List-Received-Date: Wed, 10 Mar 2010 16:02:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> On Wed, 2010-03-10 at 10:30 +0100, Steffen Sledz wrote:
>> * initrd images need to be prepared with mkimage to be usable from u-boot
>>
>> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> 
> Acked-by: Tom Rini <tom_rini@mentor.com>

OK, thx.

As soon as git.openembedded.org is online again, i'll push the patch.

Steffen




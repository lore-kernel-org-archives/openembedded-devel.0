Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 4D97F65CC6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 08:59:06 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1f6Y2J-0001bV-RG for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2018 10:56:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 12 Apr 2018 10:59:00 +0200
Message-ID: <pan70h$v8k$1@blaine.gmane.org>
References: <1523394065-15465-1-git-send-email-andrea.adami@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
In-Reply-To: <1523394065-15465-1-git-send-email-andrea.adami@gmail.com>
Subject: Re: [meta-handheld][PATCH] zaurusd: refresh patches (using devtool)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2018 08:59:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: nl

Op 10-04-18 om 23:01 schreef Andrea Adami:
> Silence warnings about ingnored context.
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>


> --- a/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
> +++ b/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
> @@ -1,17 +1,17 @@
> -From 85b94bed1feab70bc529a59fb80c26da825b9abe Mon Sep 17 00:00:00 2001
> +From 668a7bc50ca8f36df5a0eae73a5fa251aada9cc4 Mon Sep 17 00:00:00 2001
>  From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>  Date: Fri, 5 Aug 2011 16:00:10 +0400
>  Subject: [PATCH] zaurusd: add support for collie
> -Upstream-Status: Pending
Was that change intended?



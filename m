Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1P8nHo-00009n-B9
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 07:01:57 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.messagingengine.com (Postfix) with ESMTP id E7CCA23D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 01:01:21 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute3.internal (MEProxy); Thu, 21 Oct 2010 01:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=RVY66tl0dZIXClyDeVYeE2q4MgU=;
	b=htsd15nLBQ6YexzOR/oM5YYiGE3KRQ3AqYB7ks8K7mpfhwoqEF3OSQSkUrWCDfZtYFv4jQnSg9tYe1Nm9DQOoVGOJUYXG+oivI4MazVy9U2Hvry1xyFbJm2GPuGT96AiEE83q8oo8Kn9z8YTFv4rI1Ba6Rrr8qW0bxQy75SgKL8=
X-Sasl-enc: EuTMPiUuuxwKd2OceU2W+aLYtUhXA4zYM1StTNZKFvqi 1287637281
Received: from [192.168.1.37] (hnvr-4d079674.pool.mediaWays.net [77.7.150.116])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 64C28408728
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 01:01:21 -0400 (EDT)
Date: Thu, 21 Oct 2010 07:03:07 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201010151039.08619.marcin@juszkiewicz.com.pl>
Message-ID: <alpine.LNX.2.00.1010210654480.9653@asterix.crazy-teaparty.dyndns.org>
References: <201010151039.08619.marcin@juszkiewicz.com.pl>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: remove old kernels
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
X-List-Received-Date: Thu, 21 Oct 2010 05:01:57 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Hello Marcin,

On Fri, 15 Oct 2010, Marcin Juszkiewicz wrote:

> Hi
>
> recipes/linux/ contains 235 recipes. I would like to propose cleaning:
>
> 1. drop 2.4 kernels - if someone still needs them then .oz354x and .stable
>   branches have them.

I wouldn't mention the .stable branch in anything related to removals. 
Receipes from that era are so different that mixing things from both 
branches is impossible.

So "... testing_2010-09-27 has them" ;-)

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers



Received: from out5.smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OMKK6-0005sQ-1G
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 14:23:58 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id A3320F7818
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2010 08:19:37 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Wed, 09 Jun 2010 08:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=M2cbxWebJYo6+u2Lva9s1OIV47o=;
	b=Ljyo7GWI9iToz5hHaZlU4vIzwjdrNTzY4l7AZI+638XGc+QQNRwzZF55ktc2MDE8jM8NtGkOykZ2YRfcG/+vW/vAno+aYp0RTpLTbV3gr9vwz+1LbupD3uyobzHRcSDZ6ryUuXZWCwyJpLnxSXKA3oiGuApmSRxEmbQw3WWpX1o=
X-Sasl-enc: Lidl80lK+OyfgZdZRW3318FRBTR9ResAKV+s1tkU5W3G 1276085977
Received: from [192.168.1.35] (hnvr-4d079fe3.pool.mediaWays.net [77.7.159.227])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 0021A4CE449
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2010 08:19:36 -0400 (EDT)
Date: Wed, 9 Jun 2010 14:21:05 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100604133525.GA5602@dodger.lab.datenfreihafen.org>
Message-ID: <alpine.LNX.2.00.1006091419260.5418@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1004131528550.17768@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1006040541390.5274@asterix.crazy-teaparty.dyndns.org>
	<20100604133525.GA5602@dodger.lab.datenfreihafen.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.29
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] base.bbclass: add support for checksums in .bb files
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
X-List-Received-Date: Wed, 09 Jun 2010 12:23:58 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Fri, 4 Jun 2010, Stefan Schmidt wrote:

> On Fri, 2010-06-04 at 05:42, Vitus Jensen wrote:
>> On Tue, 13 Apr 2010, Vitus Jensen wrote:
>>
>>> From: Phil Blundell <philb@gnu.org>
>>>
>>> Ported from .dev branch to allow easy sharing of recipes between
>>> .dev and stable branches.
>>>
>>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>>
>> May I get comments for this patch?  I think it is really helpfull.
>
> Agreed. This makes syncing recipes easier.
>
> Acked-by: Stefan Schmidt <stefan@buglabs.net>
>

Thank you!  I need another ACK, from a maintainer of the stable branch 
(http://wiki.openembedded.net/index.php/Stable).  Anyone?

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers



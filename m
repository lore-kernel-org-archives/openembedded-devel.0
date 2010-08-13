Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OjprI-0004Es-1E
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 10:43:30 +0200
Received: from compute3.internal (compute3.internal [10.202.2.43])
	by gateway1.messagingengine.com (Postfix) with ESMTP id D63E38CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 04:43:11 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute3.internal (MEProxy); Fri, 13 Aug 2010 04:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=ErXv3sn6g4qJQb0mA71iQiWmCMY=;
	b=oBvkXdSL68oag6EfE1+t+GffXrsFqaVMxqPe48KnX69HyLl9HQBIKPIizF4ZY/N10arri4SiRuATxuGtI/c1Ckqle/JjVqQLXzvMyfOuuK4jTWMSCQKq5LjSN0acQfU1/+IQFJAP6QRtfTVCeV/n2t94Y6dkBnQC/5N6j2Lu0Tg=
X-Sasl-enc: xrb29z8/D89XoFQYzD21qxiDFGjavNfJgZaLoeSz065Z 1281688991
Received: from [192.168.1.34] (hnvr-4d07a29e.pool.mediaWays.net [77.7.162.158])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 5137640358F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 04:43:11 -0400 (EDT)
Date: Fri, 13 Aug 2010 10:44:48 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
Message-ID: <alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
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
Subject: Re: update canutils to current version
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
X-List-Received-Date: Fri, 13 Aug 2010 08:43:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Fri, 13 Aug 2010, Vitus Jensen wrote:

> The following patches will update canutils to the current version
> 4.0.6 and remove older 4.0.x versions.  Also only the latest
> version of libsocketcan will be kept.

Frans, thank you for the ACKs.  Could you please apply the patches, too? 
I have no right to do so.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers



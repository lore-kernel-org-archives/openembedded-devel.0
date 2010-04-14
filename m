Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O1uoV-0004Yb-05
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 07:07:00 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id BDB56EB0F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Apr 2010 01:03:32 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 14 Apr 2010 01:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=n+v0Zv0u5hA6BUSkenhcY0kRvsM=;
	b=l0eeIkIZsNVPT3iAyKter/GEQeL0fKF78SFNRGzZEEBdjZyS4ccpMJWVqsSvA79d/7lXFwOQlR1C61cstkUNUCGuc+xCJG/DmIrZh4DtSSHRKCrEBGAcF70uiVJXdI0vyl469M5zS3qpZCQr0hIIctVDfIb3UsEQDsn/lq5n1zc=
X-Sasl-enc: lX4GNQdRsYKXy0xu4chYzneZxflr4pvarQDvpI2+hK8H 1271221412
Received: from [192.168.1.34] (hnvr-4d07af8a.pool.mediaWays.net [77.7.175.138])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 14C897174
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Apr 2010 01:03:31 -0400 (EDT)
Date: Wed, 14 Apr 2010 07:04:46 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LNX.2.00.1004131528550.17768@asterix.crazy-teaparty.dyndns.org>
Message-ID: <alpine.LNX.2.00.1004140700480.10014@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1004131528550.17768@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
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
X-List-Received-Date: Wed, 14 Apr 2010 05:07:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Tue, 13 Apr 2010, Vitus Jensen wrote:

> From: Phil Blundell <philb@gnu.org>
>
> Ported from .dev branch to allow easy sharing of recipes between
> .dev and stable branches.
...

BTW: I think the new format should be described somewhere in the wiki. 
There are only pages about checksums.ini and an appended ";md5=xy" format.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers



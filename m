Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Oye45-0001ax-Cf
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 07:09:50 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 849736A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 01:09:45 -0400 (EDT)
Received: from frontend2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Thu, 23 Sep 2010 01:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=z3gMx9GTybZVyfo3TXPMN/x2RmY=;
	b=IlkMkzmJu89/kUYxZAxhATk7Od7khz7knbRsCVrbE0Dc5ItKJDmpkPDsPS32BmT6P/CALoWkMoYCRESAnR2+q2jWdZ6rQ4EL+9LCssvjFScBmalsi3lmLHldqYSHx5nxnZbrxdV6X0hWx23bu3ZVLpt87Hig2X+4myxmIheTIx0=
X-Sasl-enc: C51mO2r+TK2BfeiSFzM6Md+CMDNPaziUz3sbIsWCygYe 1285218585
Received: from [192.168.1.34] (hnvr-4d07a3b7.pool.mediaWays.net [77.7.163.183])
	by mail.messagingengine.com (Postfix) with ESMTPSA id EA5A95E191E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 01:09:44 -0400 (EDT)
Date: Thu, 23 Sep 2010 07:11:26 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1283817243-7436-1-git-send-email-vjensen@gmx.de>
Message-ID: <alpine.LNX.2.00.1009230711001.22766@asterix.crazy-teaparty.dyndns.org>
References: <1283817243-7436-1-git-send-email-vjensen@gmx.de>
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
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: htmldoc: remove -native recipes
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
X-List-Received-Date: Thu, 23 Sep 2010 05:09:50 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Tue, 7 Sep 2010, Vitus Jensen wrote:

> The following patches switch htmldoc to BBCLASSEXTEND = "native".
>
> 1.8.27 is the same revision as ever.  For 1.9.x I wanted to update to the latest
> snapshot revision at the same time but failed because gcc 4.4.3 reported far
> too many errors in the -native compile.  So the recipe of 1.9.x is ready for
> updates (just select SVN revision) but it's still the same old rev 1571.

Something wrong with these recipes?

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers



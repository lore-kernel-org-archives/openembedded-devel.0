Received: from [85.10.209.111] (helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <u.luckas@road.de>) id 1Kq2ne-0005Qr-5G
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 11:36:14 +0200
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 7AF7C39001B;
	Wed, 15 Oct 2008 11:31:04 +0200 (CEST)
Received: from ulitu.localnet (ulitu.handy-pc.constin.de [192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id 5462545404C;
	Wed, 15 Oct 2008 11:31:04 +0200 (CEST)
From: Uli Luckas <u.luckas@road.de>
Organization: Road GmbH
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2008 11:31:02 +0200
User-Agent: KMail/1.10.1 (Linux/2.6.26-1-686; KDE/4.1.1; i686; ; )
References: <200810080751.15817.zecke@selfish.org>
	<200810142341.06945.zecke@selfish.org>
In-Reply-To: <200810142341.06945.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200810151131.03357.u.luckas@road.de>
Cc: Holger Freyther <zecke@selfish.org>
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Wed, 15 Oct 2008 09:36:14 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> On Wednesday 08 October 2008 07:51:15 Holger Freyther wrote:
> > Wednesday:
> > 	- Be back up with git and use that as primary system.
> > 	- Disable monotone completely
>
> 1.) git user account created
> 2.) gitosis setup
> 3.) keys added and permissions added (see the end of the mail)
> 4.) populated the repository with content
> 5.) git-daemon is serving data
> 6.) push/pull with git ssh works
> 7.) notifications should work too
> 8.) the GitPhraseBook got updated with the final git location
> 9.) gitweb is nice and even tells you which URL to use
> 10.) mail almost sent
>
> I think the conversion is complete and we can disable the mtn servers now
> or leave them readonly for a while.
>
To Holger and all involved, here is my big "thank you".

Uli



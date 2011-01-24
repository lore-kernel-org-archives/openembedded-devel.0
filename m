Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PhOy4-0005iP-UX
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 17:08:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 43DF2314D215
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 17:07:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id PtcSgulsrAF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 17:07:47 +0100 (CET)
Received: from [172.22.22.61] (ip-178-200-120-208.unitymediagroup.de
	[178.200.120.208])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id BE076314D214
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 17:07:47 +0100 (CET)
Message-ID: <4D3DA3F6.2020307@opendreambox.org>
Date: Mon, 24 Jan 2011 17:08:22 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101210 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295834629-3974-1-git-send-email-raj.khem@gmail.com>	<ihjf6u$c5u$1@dough.gmane.org>	<AANLkTin6h0bLj=s=ngGQrJMEQx2PBfK3hbm54nsmXari@mail.gmail.com>	<ihjhd3$n1e$1@dough.gmane.org>
	<AANLkTimz3iOuZ_znFebxYU=6eeoeB8Czv3safbW=voNs@mail.gmail.com>
In-Reply-To: <AANLkTimz3iOuZ_znFebxYU=6eeoeB8Czv3safbW=voNs@mail.gmail.com>
Subject: Re: [PATCH] angstrom-2010.x.conf: Prefer binutils 2.21 and	uclibc-git
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
X-List-Received-Date: Mon, 24 Jan 2011 16:08:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Khem,

On 01/24/2011 04:38 PM, Khem Raj wrote:
>> bah it was not intentionally pushed. I wanted to push the other gcc
>> change and git push
>> pushed all branches. I should probably not track remote branches that
>> way git push wont
>> do this kind of mess. Sorry for the hassle. Thank you for reverting it

you can set "git config push.default current" to push only the current
branch.

Regards,
Andreas



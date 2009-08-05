Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MYe8D-0003jc-EK
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Aug 2009 12:54:07 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id D20D516DE84
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2009 12:43:06 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id E3FC22A4247
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2009 12:38:26 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 5 Aug 2009 12:37:51 +0200
Message-ID: <4A7960FC.6030608@dresearch.de>
Date: Wed, 05 Aug 2009 12:37:48 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF94F@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF94F@hiob.intern.dresearch.de>
X-OriginalArrivalTime: 05 Aug 2009 10:37:51.0156 (UTC)
	FILETIME=[C8443740:01CA15B8]
Cc: Kristoffer_e1@hotmail.com
Subject: Re: confusing qemu-native problem
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
X-List-Received-Date: Wed, 05 Aug 2009 10:54:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Sledz, Steffen schrieb:
> I've seen a very confusing, indetermined behaviour of the qemu-native build in the last time (current dev branch).
> 
> When calling the following three commands back-to-back the first and the second fail with something like "/bin/sh: .../staging/i686-linux/usr/bin/pod2man: ...bad interpreter: Permission denied" but the third call succeeds (details see below).
> 
>  bitbake hydraip-hipox-devimage
>  bitbake qemu-native
>  bitbake qemu-native
> 
> In general it looks like the success of the qemu-native is really randomly.
> 
> Why does the one call of "bitbake qemu-native" fails and the second succeeds?
> ...

No more ideas here?

Such indetermined behaviour is really a horror!

Steffen





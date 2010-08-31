Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OqPqy-0008Jc-Lz
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 14:22:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id CC2FB1C0B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 13:21:44 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id tSwJmUHcaa4B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 13:21:43 +0100 (BST)
Received: from [10.131.0.209] (188-220-38-49.zone11.bethere.co.uk
	[188.220.38.49])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 4CB8F1C14C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 13:21:43 +0100 (BST)
Message-ID: <4C7CF3D7.8090002@xora.org.uk>
Date: Tue, 31 Aug 2010 13:21:43 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.8) Gecko/20100820 Lightning/1.0b2 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282916906-21411-1-git-send-email-sledz@dresearch.de>	<4C77C60E.3080106@dresearch.de>	<AANLkTinuV6vLXXKJ_hrkNs-23cauS8OZA6gpyZySz-=s@mail.gmail.com>	<4C7A46EA.9040609@dresearch.de>	<1283256795.13038.210.camel@mill.internal.reciva.com>
	<4C7CF29F.6090806@dresearch.de>
In-Reply-To: <4C7CF29F.6090806@dresearch.de>
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rsyslog: keep rsyslog running as long as possible on shutdown
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
X-List-Received-Date: Tue, 31 Aug 2010 12:22:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 On 31/08/10 13:16, Steffen Sledz wrote:
> Am 31.08.2010 14:13, schrieb Phil Blundell:
>> Yes, the DISTRO maintainers would have the final say about start/stop
>> levels (and, indeed, whether to use sysvinit at all).  But it seems
>> sensible for the package to provide reasonable defaults that would be
>> acceptable to some/most distros.
> OK. What's the best way to get the distro maintainers attention (and acks)?
>
> Steffen
>
> BTW: There's a new version of this patch (see later in this thread).
>
For Angstrom

Acked-by: Graeme Gregory <dp@xora.org.uk>

G




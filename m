Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MbZsk-00010e-KR
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 14:58:14 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 0C7D31B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 12:44:58 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2009 14:41:01 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
	<19c1b8a90908111715h51cc0060lfd228d1a6db3c52f@mail.gmail.com>
	<87ws57vrhg.fsf@ossystems.com.br>
In-Reply-To: <87ws57vrhg.fsf@ossystems.com.br>
MIME-Version: 1.0
Message-Id: <200908131441.01244.holger+oe@freyther.de>
Subject: Re: [PATCH 2/3] uClibc: use __always_inline instead of __inline__
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
X-List-Received-Date: Thu, 13 Aug 2009 12:58:14 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thursday 13 August 2009 14:16:27 Mario Domenech Goulart wrote:

> This patch is actually from the uClibc tree
> (http://git.uclibc.org/uClibc/commit/?id=c190f738e1b0e87658ea5f86c057fb147d
>c19428).
>
> Without this patch, dynamic linked applications segfault at least on
> MIPS and MIPSEL.

Dare to make a proper patch for OE? Patch uclibc, have the patch contain a 
meaningful commit message and citing the source? (using the git commit of 
uclibc would be a good start)

z.



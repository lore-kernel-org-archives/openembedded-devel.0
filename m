Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NbU2E-0006VV-BF
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 08:15:57 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 105121B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2010 07:12:57 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jan 2010 08:12:55 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <op.u7dv44vqmn1qzu@camelguo>
In-Reply-To: <op.u7dv44vqmn1qzu@camelguo>
MIME-Version: 1.0
Message-Id: <201001310812.55227.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: circular dependency when building linux_2.6.25.bb
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
X-List-Received-Date: Sun, 31 Jan 2010 07:15:57 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 31 January 2010 07:25:42 Guo Hongruan wrote:
> Hi guys,
>    I tried to build openembedded with the following configration in my
> local.conf
> MACHIN=at91-l9260
> DISTRO=micro
> LIBC=glibc


It is very nice that you try to so many configurations. Is this the same 
circular dependency you have hit earlier with the kernel recipes?

Personally, I think it would be super awesome if you could walk the extra mile 
and make sure the issues are solved as well.

z.



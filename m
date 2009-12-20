Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NMCS0-0003kG-Ip
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 04:27:23 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id DF6251B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2009 03:21:30 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Dec 2009 04:25:25 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1261261569-19196-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1261261569-19196-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <200912200425.25787.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/3] eglibc: Add libc_nonshared.a to FILE list in eglibc-dev.
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
X-List-Received-Date: Sun, 20 Dec 2009 03:27:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 19 December 2009 23:26:09 Khem Raj wrote:
> * This file is an essential one even for shared linking so
>   once one installs libc6-dev package he expects the linking
>   to work which will not happen without this file as some
>   start up files refer to functions in this library therefore
>   package this file in eglibc-dev
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>



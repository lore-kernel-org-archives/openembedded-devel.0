Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NMCP2-0000xI-Ac
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 04:24:19 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 5ABEF1B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2009 03:18:26 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Dec 2009 04:22:18 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1261261596-19241-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1261261596-19241-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <200912200422.18969.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/3] gcc: Enable mips plt extentions if DISTRO_FEATURE has mplt.
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
X-List-Received-Date: Sun, 20 Dec 2009 03:24:19 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 19 December 2009 23:26:35 Khem Raj wrote:
> * Newer gcc (4.4+) has implemented -mplt option to
>   enable PLT and copy relocation extentions of MIPS ABI
>   which makes shared code run a lot faster. This feature
>   is however controlled by DISTRO_FEATURES which should
>   add 'mplt' to DISTRO_FEATURES to enable it.


Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>



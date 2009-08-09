Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Ma8mi-0005uR-Ty
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Aug 2009 15:50:04 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 19D001B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2009 13:37:00 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 9 Aug 2009 15:33:33 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A78E474.1030607@gmail.com>
In-Reply-To: <4A78E474.1030607@gmail.com>
MIME-Version: 1.0
Message-Id: <200908091533.33284.holger+oe@freyther.de>
Subject: Re: [PATCH] fix libmad compilation with GCC-4.4 on mips
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
X-List-Received-Date: Sun, 09 Aug 2009 13:50:05 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 05 August 2009 03:46:28 Graham Gower wrote:
> Fix build failure due to removal of the h asm constraint in GCC-4.4 mips
> port.

Signed-Off-By: Holger Freyther <holger@freyther.de>




Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Ma8Y4-0004yl-N2
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Aug 2009 15:34:56 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id E6E881B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2009 13:21:52 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 9 Aug 2009 15:18:20 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1249645320-4423-1-git-send-email-ihar.hrachyshka@gmail.com>
In-Reply-To: <1249645320-4423-1-git-send-email-ihar.hrachyshka@gmail.com>
MIME-Version: 1.0
Message-Id: <200908091518.20319.holger+oe@freyther.de>
Subject: Re: [PATCH] Added rcc (resource compiler) utility setup for QTE toolchain environment.
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
X-List-Received-Date: Sun, 09 Aug 2009 13:34:56 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 07 August 2009 13:42:00 Ihar Hrachyshka wrote:
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>

Thanks and in general nice work on Qt...

What I have on my agenda:

	- Set QMAKE_QT_CONFIG in the environment too (this would make QtE and QtX11 
be installable in one SDK)
	- Fix postgres test
	- Rename qt4-x11-free to qt4-x11
	- Kill qtopia from the path name..


z.



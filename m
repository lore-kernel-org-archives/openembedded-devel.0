Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Ma8Vw-0004ss-1I
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Aug 2009 15:32:44 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id EF2BF1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2009 13:19:39 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 9 Aug 2009 15:16:11 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1248208656-9496-1-git-send-email-methril@gmail.com>
	<b84dee3a0908090342h2e6cecf7v812be48974d049ab@mail.gmail.com>
In-Reply-To: <b84dee3a0908090342h2e6cecf7v812be48974d049ab@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200908091516.11483.holger+oe@freyther.de>
Subject: Re: [PATCH 1/1] Update the em-x270 machine to work with linux_2.6.23.
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
X-List-Received-Date: Sun, 09 Aug 2009 13:32:44 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 09 August 2009 12:42:57 Rafael Campos wrote:
> Ping
>
> have this message some issues  to not being included into the OE repo?

No problem, just hard to review. Could you use git format-patch -MC --find-
copies-harder? This should reduce the defconfig change and patch to a move?

z.



Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MwS73-000615-CZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Oct 2009 04:55:20 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 91F4C1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Oct 2009 03:02:31 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Oct 2009 04:54:17 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc2; KDE/4.3.2; i686; ; )
References: <200910100322.07608.david.lanzendoerfer@o2s.ch>
In-Reply-To: <200910100322.07608.david.lanzendoerfer@o2s.ch>
MIME-Version: 1.0
Message-Id: <200910100454.17331.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: libxml2-native build issue
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
X-List-Received-Date: Sat, 10 Oct 2009 02:55:20 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Saturday 10 October 2009 03:22:02 David Lanzend=F6rfer wrote:
> Does someone have an idea, what could cause the following error?:

The linux -> linux-gnu change. Khem's revert is going to fix that.

holger



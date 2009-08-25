Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MfvGK-0001VJ-5R
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 14:36:38 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C6CF01B10C0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 12:23:01 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2009 14:18:23 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A8E3AA6.10609@dresearch.de>
	<200908250403.12093.holger+oe@freyther.de>
	<4A93C0BB.50206@dresearch.de>
In-Reply-To: <4A93C0BB.50206@dresearch.de>
MIME-Version: 1.0
Message-Id: <200908251418.23224.holger+oe@freyther.de>
Subject: Re: Variable reference (was: Documentation update about	machine conf files)
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
X-List-Received-Date: Tue, 25 Aug 2009 12:36:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 25 August 2009 12:45:15 Steffen Sledz wrote:
> Holger Hans Peter Freyther wrote:
> >> It's a good starting point. But it has one drawback: It allows a short
> >> one liner docu only. Often it would be great to have some more info,
> >> e.g. a list of supported image file system types for IMAGE_FSTYPES.
> >
> > Why do you think so?
>
> When i had a look into conf/documentation.conf it occurred to me that the
> documentation field may only be a simple string. It seems not to be
> possible to use e.g. tables or lists there. Sorry, if i'm wrong here.

Ah okay, it certainly is possible to embed HTML, it might not be so pleasant.

z.



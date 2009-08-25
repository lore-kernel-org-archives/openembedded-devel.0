Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mflet-00038f-8r
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 04:21:15 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id E0FDE1B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 02:07:44 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2009 04:03:11 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A8E3AA6.10609@dresearch.de>
	<200908211344.53306.holger+oe@freyther.de>
	<4A92AB1F.3060404@dresearch.de>
In-Reply-To: <4A92AB1F.3060404@dresearch.de>
MIME-Version: 1.0
Message-Id: <200908250403.12093.holger+oe@freyther.de>
Subject: Re: Variable reference (was: Documentation update about machine conf files)
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
X-List-Received-Date: Tue, 25 Aug 2009 02:21:15 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 24 August 2009 17:00:47 Steffen Sledz wrote:
> >> Would be nice if it is not a glossary only but contains additional info
> >> (e.g. exact usage, restrictions, dependencies, examples). This may be
> >> realized by references to an own (wiki) page for each variable which
> >> needs more than a one liner.
> >>
> >> What's the community opinion? Should we start such an index in the wiki?
> >
> > Long time ago, I created conf/documentation.conf. For every variable back
> > then we have used VAR[doc] = "Documentation" to describe the semantic of
> > this variable. A utility like bitdoc spit out a HTML page...
> >
> > I would like to see this updated.
>
> It's a good starting point. But it has one drawback: It allows a short one
> liner docu only. Often it would be great to have some more info, e.g. a
> list of supported image file system types for IMAGE_FSTYPES.

Why do you think so?




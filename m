Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MeSpf-0002cc-8p
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 14:02:59 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 7BA021B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2009 11:49:34 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Aug 2009 13:44:53 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A8E3AA6.10609@dresearch.de>
In-Reply-To: <4A8E3AA6.10609@dresearch.de>
MIME-Version: 1.0
Message-Id: <200908211344.53306.holger+oe@freyther.de>
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
X-List-Received-Date: Fri, 21 Aug 2009 12:02:59 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 21 August 2009 08:11:50 Steffen Sledz wrote:
> [start new thread because of the more common subject]
>
> >> I would be really happy about an index of all variables usable in the
> >> recipes together with a desciption or a reference to it. I would
> >> prefer such an index in the wiki, but manual or documentation.conf
> >> would be fine too.
> >
> > Something like that you mean?
> >
> > http://pokylinux.org/doc/poky-handbook.html#ref-variables-glossary
>
> Yes.
>
> Would be nice if it is not a glossary only but contains additional info
> (e.g. exact usage, restrictions, dependencies, examples). This may be
> realized by references to an own (wiki) page for each variable which needs
> more than a one liner.
>
> What's the community opinion? Should we start such an index in the wiki?

Long time ago, I created conf/documentation.conf. For every variable back then 
we have used VAR[doc] = "Documentation" to describe the semantic of this 
variable. A utility like bitdoc spit out a HTML page...

I would like to see this updated.

z.



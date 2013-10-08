Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by mail.openembedded.org (Postfix) with ESMTP id 339CD6CE98
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 14:16:17 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUC003DTSYSDXF0@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	08 Oct 2013 09:16:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A5CC020101; Tue,
	08 Oct 2013 10:16:04 -0400 (EDT)
Date: Tue, 08 Oct 2013 10:16:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-id: <20131008141604.GE22340@denix.org>
References: <20131007201536.GU6240@jama> <20131007202336.GF18775@denix.org>
	<CAOMwXhMpx8KjDyq_4fD949owFWE8r1O61E7D085+U31=fR5kNg@mail.gmail.com>
	<20131007203527.GG18775@denix.org>
	<CAOMwXhORbuT7J8B6evLhcJSx2Z8BUCoAeXKGDe=twQsuY-wtOQ@mail.gmail.com>
	<20131008132109.GA22340@denix.org>
	<CAOMwXhN4C=Lob8ow9utU6hnqDOUjpt=PGj+Rp6W-pbnY5uky1g@mail.gmail.com>
	<20131008132609.GB22340@denix.org>
	<CAOMwXhP_EobkzYT91BQGLjqWWOtsvTwzYSPk9MJHsMRm1q7otQ@mail.gmail.com>
	<20131008133918.GB2872@jama>
MIME-version: 1.0
In-reply-to: <20131008133918.GB2872@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Laszlo Papp <lpapp@kde.org>, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Update to 5.1.1?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2013 14:16:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 08, 2013 at 03:39:18PM +0200, Martin Jansa wrote:
> On Tue, Oct 08, 2013 at 02:30:05PM +0100, Laszlo Papp wrote:
> > On Tue, Oct 8, 2013 at 2:26 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > > Since Dora is a branch of meta-qt5, I don't understand your statements
> > > about
> > > being orthogonal and not integrated...
> > >
> > 
> > You will be able to use *any* meta-qt5 on top of Dora, just as you can use
> > meta-qt5 on top of denzil nowadays. The "dora branching" sounds like red
> > herring to me. The dependencies in Dora will be good enough for 1-2 years,
> > if not much more.
> 
> That's not true, we were just lucky that there weren't any incompatible
> changes in oe-core, but as soon as 1.6. brings e.g. new cmake, master
> branch will work only with master and dora only with dora (because of
> .bbappend).
> 
> So the same branch names are the only supported combination, if you want
> to use meta-qt5/master with oe-core/dylan then you're on your own. It
> works now, but only because we're lucky.

Yep, well said!

-- 
Denys


Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7D66E6CEA3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 13:26:08 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUC00ATMQNLGV40@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	08 Oct 2013 08:26:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 19D06200A9; Tue,
	08 Oct 2013 09:26:09 -0400 (EDT)
Date: Tue, 08 Oct 2013 09:26:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Laszlo Papp <lpapp@kde.org>
Message-id: <20131008132609.GB22340@denix.org>
References: <20131007193306.GT6240@jama>
	<CAOMwXhNV3q5P_+kCZtnDNUpZpG-OvMoe7Rem=cw86Z6vx8WmbA@mail.gmail.com>
	<20131007194922.GE18775@denix.org> <20131007201536.GU6240@jama>
	<20131007202336.GF18775@denix.org>
	<CAOMwXhMpx8KjDyq_4fD949owFWE8r1O61E7D085+U31=fR5kNg@mail.gmail.com>
	<20131007203527.GG18775@denix.org>
	<CAOMwXhORbuT7J8B6evLhcJSx2Z8BUCoAeXKGDe=twQsuY-wtOQ@mail.gmail.com>
	<20131008132109.GA22340@denix.org>
	<CAOMwXhN4C=Lob8ow9utU6hnqDOUjpt=PGj+Rp6W-pbnY5uky1g@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAOMwXhN4C=Lob8ow9utU6hnqDOUjpt=PGj+Rp6W-pbnY5uky1g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 08 Oct 2013 13:26:08 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Tue, Oct 08, 2013 at 02:23:13PM +0100, Laszlo Papp wrote:
> On Tue, Oct 8, 2013 at 2:21 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > On Tue, Oct 08, 2013 at 08:15:53AM +0100, Laszlo Papp wrote:
> > > On Mon, Oct 7, 2013 at 9:35 PM, Denys Dmytriyenko <denis@denix.org>
> > wrote:
> > >
> > > > On Mon, Oct 07, 2013 at 09:29:50PM +0100, Laszlo Papp wrote:
> > > > > On Mon, Oct 7, 2013 at 9:23 PM, Denys Dmytriyenko <denis@denix.org>
> > > > wrote:
> > > > >
> > > > > > On Mon, Oct 07, 2013 at 10:15:36PM +0200, Martin Jansa wrote:
> > > > > > > On Mon, Oct 07, 2013 at 03:49:22PM -0400, Denys Dmytriyenko
> > wrote:
> > > > > > > > On Mon, Oct 07, 2013 at 08:43:48PM +0100, Laszlo Papp wrote:
> > > > > > > > > On Mon, Oct 7, 2013 at 8:33 PM, Martin Jansa <
> > > > martin.jansa@gmail.com>
> > > > > > wrote:
> > > > > > > > >
> > > > > > > > > > On Mon, Oct 07, 2013 at 08:57:10PM +0200, Eric Bénard
> > wrote:
> > > > > > > > > > > Le Mon, 07 Oct 2013 14:37:39 -0400,
> > > > > > > > > > > Denys Dmytriyenko <denis@denix.org> a écrit :
> > > > > > > > > > >
> > > > > > > > > > > > On Mon, Oct 07, 2013 at 08:29:56PM +0200, Eric Bénard
> > > > wrote:
> > > > > > > > > > > > > Hi Denys,
> > > > > > > > > > > > >
> > > > > > > > > > > > > Le Mon, 07 Oct 2013 14:01:20 -0400,
> > > > > > > > > > > > > Denys Dmytriyenko <denis@denix.org> a écrit :
> > > > > > > > > > > > >
> > > > > > > > > > > > > > Martin, Otavio, et al,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Are you planning on updating Qt version in master
> > to
> > > > 5.1.1
> > > > > > any
> > > > > > > > > > time soon,
> > > > > > > > > > > > > > preferably before 1.5 release? :) If nobody looked
> > into
> > > > > > that yet,
> > > > > > > > > > will you be
> > > > > > > > > > > > > > open to take patches for the same?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > I have 5.1.1 in test here. I expect to send the
> > patch in
> > > > the
> > > > > > coming
> > > > > > > > > > > > > days.
> > > > > > > > > > > >
> > > > > > > > > > > > Thanks! Sounds good. Let me know if you need help in
> > > > testing!
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > as soon as it finish to compile here I'll send the patch
> > > > serie
> > > > > > for
> > > > > > > > > > > testing.
> > > > > > > > > >
> > > > > > > > > > +Laszlo
> > > > > > > > > >
> > > > > > > > > > Laszlo also said that he is working on patches for 5.1.1 I
> > > > don't
> > > > > > know
> > > > > > > > > > how far he got..
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Not any far, sorry, but I would be happy to use someone
> > else's
> > > > > > patches. By
> > > > > > > > > the way, it would be nice to have 5.2.0 alpha (and later
> > beta)
> > > > > > updates
> > > > > > > > > soon, too.
> > > > > > > >
> > > > > > > > Having 5.2.0 alpha would be nice, but that's probably too
> > unstable
> > > > to
> > > > > > try and
> > > > > > > > get in before Dora release. I want 5.1.1 as the latest stable
> > to
> > > > get
> > > > > > into
> > > > > > > > Dora. :) So, I'm offering any help to expedite things like
> > testing
> > > > and
> > > > > > such :)
> > > > > > >
> > > > > > > I've already branched meta-qt5/dora before removing 5.0.2 recipes
> > > > from
> > > > > > > master.
> > > > > > >
> > > > > > > I'm willing to "backport" 5.1.1 from master to dora or even
> > remove
> > > > 5.0.2
> > > > > > > there as well, but last time I've asked around nobody responded
> > to
> > > > say
> > > > > > > if they are still using 5.0.2 or 5.1.* is good enough for
> > everybody.
> > > > > >
> > > > > > Sorry for not responding before, but for our needs 5.0.2 is not
> > > > sufficient,
> > > > > > 5.1.x and specifically 5.1.1 is preferred. I would very appreciate
> > > > > > backporting
> > > > > > 5.1.1 into Dora
> > > > >
> > > > > Be careful with this. I assume you mean the dora branch as opposed
> > to the
> > > > > Dora poky release.
> > > >
> > > > And besides, Poky release does not contain meta-qt5, as far as I know.
> > > >
> > >
> > > That was my point, yes. Your email reads like as if they were strictly
> > tied
> > > together, or maybe even integrated. While, you can freely use post-dora
> > > meta-qt5 version with Dora, too. As I wrote, they are orthogonal.
> >
> > Just knowing what mailing list this is would clear all your doubts right
> > away.
> 
> 
> As you can see, it has not. So, please be clear in the future. :) meta-qt5
> is orthogonal to Dora as far as it is not integrated.

Since Dora is a branch of meta-qt5, I don't understand your statements about 
being orthogonal and not integrated...

-- 
Denys


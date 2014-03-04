Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id E1D246DCFF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2014 19:52:22 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1X0045WGID82K0@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	04 Mar 2014 13:52:05 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 716CD20396; Tue,
	04 Mar 2014 14:51:47 -0500 (EST)
Date: Tue, 04 Mar 2014 14:51:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140304195147.GC22890@denix.org>
References: <1393640395-9737-1-git-send-email-net147@gmail.com>
	<1393640395-9737-2-git-send-email-net147@gmail.com>
	<CAP9ODKoiySoue8v5eQ4=MtV9gWXaGkmXndH3MxAXOfjPu7DbVg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKoiySoue8v5eQ4=MtV9gWXaGkmXndH3MxAXOfjPu7DbVg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Tue, 04 Mar 2014 19:52:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Mar 01, 2014 at 05:34:22PM -0300, Otavio Salvador wrote:
> On Fri, Feb 28, 2014 at 11:19 PM, Jonathan Liu <net147@gmail.com> wrote:
> 
> > This adds the necessary target packages for development with all of the
> > Qt 5 modules.
> >
> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> >
> 
> I like it :)

I like the X11 conditional, but what about the rest? We need some way to 
conditionally include things in the SDK...

-- 
Denys


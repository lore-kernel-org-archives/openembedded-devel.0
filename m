Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id B76CF65D0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 18:55:38 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7Q00FLDN7STZ80@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	25 Jun 2014 13:55:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 692202009B; Wed,
	25 Jun 2014 14:55:04 -0400 (EDT)
Date: Wed, 25 Jun 2014 14:55:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140625185504.GD1580@denix.org>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
	<53AB1718.7000608@balister.org>
MIME-version: 1.0
In-reply-to: <53AB1718.7000608@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Wed, 25 Jun 2014 18:55:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jun 25, 2014 at 11:38:16AM -0700, Philip Balister wrote:
> On 06/25/2014 03:07 AM, Paul Eggleton wrote:
> > On Tuesday 24 June 2014 16:14:58 Philip Balister wrote:
> >> What's the best available solution for creating an image you can dd to
> >> an SD card? It seems like this wheel has been invented several times and
> >> I am wondering if people are converging on one approach.
> >>
> >> Bonus points for resizing the linux partition.
> >>
> >> How are people doing this today?
> > 
> > I think wic has seen some uptake and enhancement since its introduction a 
> > couple of releases ago. It has certainly worked for me in writing SD cards for 
> > Galileo. We seem to be a bit short on documentation for it though...
> 
> Googling for "wic sd" doesn't help. I've seen some commits, so I'll take
> a look in the meta data.

http://cgit.openembedded.org/openembedded-core/tree/scripts/wic

But indeed, better documentation would be most appreciated.

-- 
Denys


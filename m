Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 5F16F60030
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 18:01:07 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7S00JJHFDB8SJ0@vms173023.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	26 Jun 2014 13:00:58 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 905F42018D; Thu,
	26 Jun 2014 14:00:47 -0400 (EDT)
Date: Thu, 26 Jun 2014 14:00:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140626180046.GF1580@denix.org>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
	<53AB1718.7000608@balister.org>
	<CAFZh4h80FCq=6u-enoDTzreQhBRB+Sgko+8hRzWRrk1EoS00nw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAFZh4h80FCq=6u-enoDTzreQhBRB+Sgko+8hRzWRrk1EoS00nw@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Jun 2014 18:01:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jun 25, 2014 at 03:04:31PM -0400, Brian Hutchinson wrote:
> On Wed, Jun 25, 2014 at 2:38 PM, Philip Balister <philip@balister.org> wrote:
> > On 06/25/2014 03:07 AM, Paul Eggleton wrote:
> >> On Tuesday 24 June 2014 16:14:58 Philip Balister wrote:
> >>> What's the best available solution for creating an image you can dd to
> >>> an SD card? It seems like this wheel has been invented several times and
> >>> I am wondering if people are converging on one approach.
> >>>
> >>> Bonus points for resizing the linux partition.
> >>>
> >>> How are people doing this today?
> >>
> >> I think wic has seen some uptake and enhancement since its introduction a
> >> couple of releases ago. It has certainly worked for me in writing SD cards for
> >> Galileo. We seem to be a bit short on documentation for it though...
> >
> > Googling for "wic sd" doesn't help. I've seen some commits, so I'll take
> > a look in the meta data.
> >
> > Philip
> 
> I think he's talking about:
> http://patchwork.openembedded.org/patch/59059/
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3847

A lot of good info is hidden in those 2 obscure places! :)
How about copying all that to a Wiki page for starters?

-- 
Denys


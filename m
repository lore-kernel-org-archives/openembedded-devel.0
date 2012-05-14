Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SU0pE-0003Ps-3s
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 21:20:56 +0200
Received: by obhx4 with SMTP id x4so8624533obh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 12:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=ThdIjs/fXxbdvHVWzWT0L+cCadum+URwAtPR+oaRt38=;
	b=pJ0QY25pp+OwHy20ao/JNWZ06Zf3Zar3SBASO/TKZ6OoyURJYyAY+8dM++NQ2Xv8aS
	oj9HJkzjA95YLLEL+r0oQ/CizLwcDcVxVUc4I7UIVQ0sV/OYFJImS9KsyTNmUIQv27Ey
	GxxxrY1Mff5gxbd6lzub0kl7HzY5HZvTSFKjISldtcuidPKd+Gxftc89y7fqjgPPh+5y
	1B6LWQwnme4ZuR1XZtDjIKFEgIrgtTk0cMn613NRqXWiVXbIkli4vMHVRLnPARNpG3dB
	760OfDuwNuG6Omdla6oyBItYtp3gOstdMCK09Tdh2QOKs5ovee1SazaFrNW8qOeSAx0m
	bHqA==
Received: by 10.182.5.164 with SMTP id t4mr14036562obt.1.1337022656360;
	Mon, 14 May 2012 12:10:56 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id a6sm20128019obo.10.2012.05.14.12.10.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 12:10:55 -0700 (PDT)
Date: Mon, 14 May 2012 12:11:02 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120514191102.GF10008@bill-the-cat>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
	<1337011834-24879-13-git-send-email-Chase.Maupin@ti.com>
	<CAPhnLPDYGfet15Wek+2yRpiJK1+FwLi5+HyZv63khU5v9WCrcw@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED10138E31694@DLEE12.ent.ti.com>
	<20120514181329.GB3166@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120514181329.GB3166@jama.jama.net>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 12/69] atk: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 19:20:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 14, 2012 at 08:13:29PM +0200, Martin Jansa wrote:
> On Mon, May 14, 2012 at 05:49:26PM +0000, Maupin, Chase wrote:
> > > -----Original Message-----
> > > From: Flanagan, Elizabeth [mailto:elizabeth.flanagan@intel.com]
> > > Sent: Monday, May 14, 2012 12:30 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: Maupin, Chase
> > > Subject: Re: [oe] [PATCH 12/69] atk: Update LICENSE field version
> > > 
> > > On Mon, May 14, 2012 at 9:09 AM, Chase Maupin
> > > <Chase.Maupin@ti.com> wrote:
> > > > * Update LICENSE field version from generic LGPL to GPLv2+ and
> > > > ?LGPLv2+ to reflect the real license version.
> > > > * This change was based on setting in oe-core as well as code
> > > > ?inspection.
> > > >
> > > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > > ---
> > > > ?recipes/atk/atk_1.30.0.bb | ? ?4 ++--
> > > > ?1 files changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/recipes/atk/atk_1.30.0.bb
> > > b/recipes/atk/atk_1.30.0.bb
> > > > index b3505bf..23c6685 100644
> > > > --- a/recipes/atk/atk_1.30.0.bb
> > > > +++ b/recipes/atk/atk_1.30.0.bb
> > > > @@ -1,9 +1,9 @@
> > > > ?DESCRIPTION = "An accessibility toolkit for GNOME."
> > > > ?SECTION = "x11/libs"
> > > > ?PRIORITY = "optional"
> > > > -LICENSE = "LGPL"
> > > > +LICENSE = "GPLv2+ LGPLv2+"
> > > 
> > > This should be:
> > > 
> > > LICENSE = "GPLv2+ & LGPLv2+"
> > > 
> > > or whatever the operator is (Most likely & or |)
> > 
> > I know that & works in oe-core, but when I use this in oe-classic I get build errors like:
> > 
> > NOTE: Running task 432 of 513 (ID: 1, /home/a0271661/projects/arago-4.7/arago-oe-dev/recipes/atk/atk_1.30.0.bb, do_patch)
> > ERROR: Function SRC_DISTRIBUTECOMMAND failed
> > NOTE: Task failed: ('function SRC_DISTRIBUTECOMMAND failed', '/home/a0271661/projects/arago-4.7/arago-tmp/work/armv7a-arago-linux-gnueabi/atk-1.30.0-r2/temp/log.SRC_DISTRIBUTECOMMAND.27742')
> > ERROR: Logfile of failure stored in: /home/a0271661/projects/arago-4.7/arago-tmp/work/armv7a-arago-linux-gnueabi/atk-1.30.0-r2/temp/log.SRC_DISTRIBUTECOMMAND.27742
> > Log data follows:
> > | /home/a0271661/projects/arago-4.7/arago-tmp/work/armv7a-arago-linux-gnueabi/atk-1.30.0-r2/temp/run.SRC_DISTRIBUTECOMMAND.27742: line 1288: /atk: No such file or directory
> > | ERROR: Function SRC_DISTRIBUTECOMMAND failed
> > NOTE: package atk-1.30.0-r2: task do_distribute_sources: Failed
> > ERROR: TaskFailed event exception, aborting
> > ERROR: Build of /home/a0271661/projects/arago-4.7/arago-oe-dev/recipes/atk/atk_1.30.0.bb do_distribute_sources failed
> > ERROR: Task 16 (/home/a0271661/projects/arago-4.7/arago-oe-dev/recipes/atk/atk_1.30.0.bb, do_distribute_sources) failed with exit code 1
> > 
> > The line (1288) that is causing this error looks like:
> > 
> > cd /home/a0271661/projects/arago-4.7/arago-tmp/deploy/glibc/sources/&/atk
> > SRC_DISTRIBUTECOMMAND
> > 
> > Looking at other recipes I noticed that when they had multiple licenses they used a space separated list and in the case of an or license option |.
> > 
> > Any input on this would be appreciated.  I don't believe / is right because that would make it look like a path for the classes that use the license.
> 
> yes, special characters like '+'
> http://git.openembedded.org/openembedded/commit/?id=1c25e6c73b219dc8077780567fb0fb515092b5cf
> or '&' or even spaces
> http://git.openembedded.org/openembedded/commit/?id=819fa4c451ea5a811b8dd78bbcbb38dc38c68aa4
> 
> break oe-classic, more about it
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032579.html

I'm OK saying that the data just needs to be human-readable and correct
in oe-classic and correct and fully tool-usable in oe-core/etc.

-- 
Tom



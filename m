Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0746FC43
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 18:21:36 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6LILWrM026117; Mon, 21 Jul 2014 13:21:32 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072113213206-40772 ;
	Mon, 21 Jul 2014 13:21:32 -0500 
Date: Mon, 21 Jul 2014 13:21:25 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140721182125.GA11181@bshelton-desktop>
References: <1405957930-15362-1-git-send-email-ben.shelton@ni.com>
	<1405957930-15362-4-git-send-email-ben.shelton@ni.com>
	<20140721170203.GK22875@jama>
MIME-Version: 1.0
In-Reply-To: <20140721170203.GK22875@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 01:21:32 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 01:21:32 PM,
	Serialize complete at 07/21/2014 01:21:32 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-20_03:2014-07-18, 2014-07-20,
	1970-01-01 signatures=0
Subject: Re: [meta-oe][PATCH 4/4] syslog-ng: Improved initscript VERBOSE handling.
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
X-List-Received-Date: Mon, 21 Jul 2014 18:21:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/21, Martin Jansa wrote:
> On Mon, Jul 21, 2014 at 10:52:10AM -0500, Ben Shelton wrote:
> > From: Richard Tollerton <rich.tollerton@ni.com>
> > 
> > The messages echoed when starting and stopping syslog-ng are currently
> > printed regardless of the setting of VERBOSE.  Adjust the initscript so
> > they're only printed when VERBOSE is enabled.
> 
> Can you please try to integrate fixes sent by RP?
> 
> Or add it as last commit in your series.
> 

Oops -- didn't see the work that had already been done on syslog-ng.

I'll integrate our fixes on top of that and resubmit.

Thanks,
Ben




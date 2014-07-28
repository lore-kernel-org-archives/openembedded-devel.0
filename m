Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 41AA760030
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 21:54:01 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6SLs2p6031454 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 16:54:02 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072816540241-334847 ;
	Mon, 28 Jul 2014 16:54:02 -0500 
Date: Mon, 28 Jul 2014 16:53:49 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140728215349.GA13093@bshelton-desktop>
References: <1406575596-15006-1-git-send-email-ben.shelton@ni.com>
	<CAMKF1sor__WRSb_Yo_G1+NhDX0TF8uY5tXAfMJQBgfD7um1rOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sor__WRSb_Yo_G1+NhDX0TF8uY5tXAfMJQBgfD7um1rOg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 04:54:02 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 04:54:02 PM,
	Serialize complete at 07/28/2014 04:54:02 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-28_03:2014-07-28, 2014-07-28,
	1970-01-01 signatures=0
Subject: Re: [meta-oe][PATCH 1/3] font-misc-misc: add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 21:54:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/28, Khem Raj wrote:
> On Mon, Jul 28, 2014 at 12:26 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> > +RDEPENDS_${PN}_class-native = "font-util-native"
> 
> there is no native bbclassextend here so why is this needed ?

Good catch -- I'll remove it and resubmit.

Thanks,
Ben

> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


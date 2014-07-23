Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 2EED56AC6C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 21:56:49 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6NLuokS016463 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 16:56:50 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072316565010-159151 ;
	Wed, 23 Jul 2014 16:56:50 -0500 
Date: Wed, 23 Jul 2014 16:56:41 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140723215641.GC4842@bshelton-desktop>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 04:56:50 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 04:56:50 PM,
	Serialize complete at 07/23/2014 04:56:50 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-23_07:2014-07-23, 2014-07-23,
	1970-01-01 signatures=0
Subject: [meta-nslu2] Setting util-linux hwclock ALTERNATIVE_PRIORITY in meta-nslu2
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
X-List-Received-Date: Wed, 23 Jul 2014 21:56:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

If I were going to lower the util-linux hwclock ALTERNATIVE_PRIORITY
from meta-nslu2 so it can be raised back in oe-core for other platforms,
which file(s) would be the appropriate place to do it?

Thanks,
Ben


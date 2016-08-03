Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 372B1731C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Aug 2016 13:10:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2016 06:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,465,1464678000"; d="scan'208";a="1034317601"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2016 06:10:52 -0700
Date: Wed, 3 Aug 2016 16:10:37 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160803131037.GA14041@mbabyjoh-desk.ger.corp.intel.com>
References: <1470226224-13589-1-git-send-email-maxin.john@intel.com>
	<20160803125222.h6z6coqrygdamro3@jama>
MIME-Version: 1.0
In-Reply-To: <20160803125222.h6z6coqrygdamro3@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] pointercal: move recipe to meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Aug 2016 13:10:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

On Wed, Aug 03, 2016 at 02:52:22PM +0200, Martin Jansa wrote:
> On Wed, Aug 03, 2016 at 03:10:24PM +0300, Maxin B. John wrote:
> > xtscal is being replaced with xinput-calibrator in oe-core
> > and that made pointercal redundant. So, move it from oe-core to
> > meta-oe.
> 
> It's added to meta-gpe not meta-oe.
>
Sorry, will fix it.

> I'll wait with applying this to master-next until someone says he needs
> it, there is enough junk being moved from oe-core to meta-oe layers
> already.

Fair enough.

> You also forgot to migrate pointercal related changes in layer.conf.
 
Thanks for reminding it. Will do that.

> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  .../recipes-graphics/pointercal/pointercal/COPYING |   2 ++
<snip>

Best Regards,
Maxin


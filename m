Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A70AC770E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:22:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 15 Aug 2016 03:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,524,1464678000"; d="scan'208";a="865582664"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 15 Aug 2016 03:22:28 -0700
Date: Mon, 15 Aug 2016 13:23:45 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160815102345.GA16766@mbabyjoh-desk.ger.corp.intel.com>
References: <1470989266-6267-1-git-send-email-richard.leitner@skidata.com>
	<20160812130632.GA28597@mbabyjoh-desk.ger.corp.intel.com>
	<20160813030438.GB23947@haswell>
MIME-Version: 1.0
In-Reply-To: <20160813030438.GB23947@haswell>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] README: fix branches of openembedded layers we depend on
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
X-List-Received-Date: Mon, 15 Aug 2016 10:22:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Fri, Aug 12, 2016 at 08:04:38PM -0700, Khem Raj wrote:
> On 16-08-12 16:06:33, Maxin B. John wrote:
> > Hi,
> > 
> > On Fri, Aug 12, 2016 at 10:07:46AM +0200, Richard Leitner wrote:
> > > Since 33fbcd43 (rxtx: Add remove-libtool class to remove all .la files)
> > > rxtx requires the remove-libtool class. This class was introduced
> > > in the krogoth branch of openembedded-core and not backported.
> > > 
> > > Therefore update the branch names in the README to "krogoth".
> > > 
> > > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > > ---
> > >  README | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/README b/README
> > > index 259fa75..f766869 100644
> > > --- a/README
> > > +++ b/README
> > > @@ -7,11 +7,11 @@ Yocto Project build systems.
> > >  This layer depends on:
> > >  
> > >  URI: git://git.openembedded.org/openembedded-core
> > > -branch: daisy
> > > +branch: krogoth
> > >  revision: HEAD
> > >  
> > >  URI: git://git.openembedded.org/meta-openembedded
> > > -branch: daisy
> > > +branch: krogoth
> > >  revision: HEAD
> > >  
> > >  Contributing
> > > -- 
> > > 2.1.4
> > 
> > README was a bit outdated. Thanks for updating it.
> > 
> > Pushed to master.
> 
> This should also reflect the fact that it also works
> with master branches of respective layers

Thanks for the suggestion. Will update it soon.

> > 

Warm Regards,
Maxin


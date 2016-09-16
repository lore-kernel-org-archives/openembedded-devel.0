Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D0F5873189
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 08:50:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 16 Sep 2016 01:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,343,1470726000"; d="scan'208";a="879967604"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 16 Sep 2016 01:50:38 -0700
Date: Fri, 16 Sep 2016 11:50:51 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20160916085050.GA27969@mbabyjoh-desk.ger.corp.intel.com>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
	<1472730043-31245-5-git-send-email-maxin.john@intel.com>
	<12285709.EfYBoYq9CT@peggleto-mobl.ger.corp.intel.com>
	<1649463.EYVuLskMBZ@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1649463.EYVuLskMBZ@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/4] tslib: move recipe from oe-core
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
X-List-Received-Date: Fri, 16 Sep 2016 08:50:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Fri, Sep 16, 2016 at 10:19:50AM +1200, Paul Eggleton wrote:
> On Fri, 16 Sep 2016 10:17:11 Paul Eggleton wrote:
> > On Thu, 01 Sep 2016 14:40:43 Maxin B. John wrote:
> > > Move tslib recipe from oe-core layer.
> > > 
> > > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > > ---
> > > 
> > >  meta-gpe/recipes-graphics/tslib/tslib/ts.conf  | 25 ++++++++++++
> > >  meta-gpe/recipes-graphics/tslib/tslib/tslib.sh |  8 ++++
> > >  meta-gpe/recipes-graphics/tslib/tslib_1.1.bb   | 53
> > > 

Apparently I missed to notice some replies to these patches (recently
my inbox has been behaving a bit strangely - missing or delaying some mails
for a day or two). Sorry for that!

> Also, is meta-gpe really an appropriate place for this?
> 
I am open to suggestions. xtscal had HOMEPAGE set as "http://gpe.linuxtogo.org".
Since other packages were logically connected to that, moved them to meta-gpe
as well.

> Cheers,
> Paul

Best Regards,
Maxin


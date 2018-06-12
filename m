Return-Path: <maxin.john@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 0D11378F49
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 15:10:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 08:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,215,1526367600"; d="scan'208";a="48393642"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga007.jf.intel.com with ESMTP; 12 Jun 2018 08:10:56 -0700
Date: Tue, 12 Jun 2018 18:03:29 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: prvs=69472e970=Richard.Leitner@skidata.com
Message-ID: <20180612150329.GA40594@mbabyjoh-desk.ger.corp.intel.com>
References: <20180612143331.2445-1-richard.leitner@skidata.com>
	<20180612143848.GA39978@mbabyjoh-desk.ger.corp.intel.com>
	<a2ccf761-b1e4-eab3-14d8-3ddacea57a11@skidata.com>
MIME-Version: 1.0
In-Reply-To: <a2ccf761-b1e4-eab3-14d8-3ddacea57a11@skidata.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 0/4] README: update to reflect current status
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
X-List-Received-Date: Tue, 12 Jun 2018 15:10:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Tue, Jun 12, 2018 at 04:51:49PM +0200, prvs=69472e970=Richard.Leitner@skidata.com wrote:
> Hi Maxin,
> 
> On 06/12/2018 04:38 PM, Maxin B. John wrote:
> > Hi Richard,
> > 
> > On Tue, Jun 12, 2018 at 04:33:27PM +0200, openembedded-devel-bounces@lists.openembedded.org wrote:
> >> Update the README file to reflect current maintainers, dependencies and patch
> >> formatting/sending guidlines.
> >>
> >> Mario Domenech Goulart (1):
> >>   README: Remove Mario Goulart from the list of maintainers
> >>
> >> Richard Leitner (3):
> >>   README: fix dependent branch names
> >>   README: add note on how to send a patch series with cover-letter
> >>   README: add maintainer: Richard Leitner
> >>
> >>  README | 20 ++++++++++++++------
> >>  1 file changed, 14 insertions(+), 6 deletions(-)
> > 
> > For some reasons, the "Author" of patches are not clearly set. It shows up like - "openembedded-devel-bounces@lists.openembedded.org",
> > instead of your mail-id.
> 
> Just wrote you an email because of that. It's strange because the
> answer from Otavio to my [PATCH 3/4] parses the "From:" correctly.
> Also my "raw patches" which I passed to "git send-email" seem to be fine...

It seems something is wrong at my side, not yours :( 

> 
> Do you have any ideas what causes this problem?

Not yet. Probably some messup from the mail client.

> regards;Richard.L

Regards,
Maxin


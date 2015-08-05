Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E7FAD60125
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 08:18:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2015 01:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,615,1432623600"; d="scan'208";a="762291631"
Received: from igurvich-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.22.90])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2015 01:18:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 05 Aug 2015 09:18:23 +0100
Message-ID: <2647592.KstcPSrDuS@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CANx9H-B8xQbXPwL5TvxMx4Vv8Z-O0U64edhH2wt+Mh9D2P511Q@mail.gmail.com>
References: <1438741545-900-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CANx9H-B8xQbXPwL5TvxMx4Vv8Z-O0U64edhH2wt+Mh9D2P511Q@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-python][PATCH v2] python-requests: upgrade 2.5.1->2.7.0
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
X-List-Received-Date: Wed, 05 Aug 2015 08:18:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 04 August 2015 21:51:36 Tim Orling wrote:
> .
> 
> On Tue, Aug 4, 2015 at 7:25 PM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > ---
> > 
> >  .../python/{python-requests_2.5.1.bb => python-requests_2.7.0.bb}  | 7
> > 
> > +++----
> > 
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-requests_2.5.1.bb =>
> > 
> > python-requests_2.7.0.bb} (56%)
> > 
> > diff --git a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> > b/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> > similarity index 56%
> > rename from meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> > rename to meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> > index b719dca..1564d50 100644
> > --- a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> > +++ b/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> > @@ -2,15 +2,14 @@ DESCRIPTION = "Python HTTP for Humans."
> > 
> >  HOMEPAGE = "http://python-requests.org"
> >  SECTION = "devel/python"
> >  LICENSE = "Apache-2.0"
> > 
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=c7869e52c8275537186de35e3cd5f9ec"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
> 
> Again, since the LIC_FILES_CHKSUM has changed, it is a courtesy to indicate
> why. As the committer, it is your responsibility to make sure the same
> license still applies.

A minor correction - it's not just a courtesy, I think we'd consider it 
mandatory. We probably ought to document that somewhere (at the OE level) if 
we haven't already.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D2CDB6605F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 11:07:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2014 04:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1034,1389772800"; d="scan'208";a="530394993"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.14])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2014 04:06:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 12 May 2014 12:06:46 +0100
Message-ID: <1446980.Ld486h44me@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.3-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <CAP9ODKqZE8aY+EVq+Db6x0FLjjB=jvAxvmfHOv0vE_T35hC-iw@mail.gmail.com>
References: <1399721553-2020-1-git-send-email-fathi.boudra@linaro.org>
	<CAP9ODKqZE8aY+EVq+Db6x0FLjjB=jvAxvmfHOv0vE_T35hC-iw@mail.gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] pm-qa: update to 0.4.9 release
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
X-List-Received-Date: Mon, 12 May 2014 11:07:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 12 May 2014 00:15:40 Otavio Salvador wrote:
> On Sat, May 10, 2014 at 8:32 AM, Fathi Boudra <fathi.boudra@linaro.org> 
wrote:
> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> > ---
> > 
> >  meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> > b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb index 4d33975..f6ffcb6
> > 100644
> > --- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> > +++ b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
> > @@ -4,12 +4,12 @@ HOMEPAGE =
> > "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/Test
> https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite
> 
> The URI is wrong.

That's just the patch context, not something that is being changed; the URL is 
correct in the recipe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


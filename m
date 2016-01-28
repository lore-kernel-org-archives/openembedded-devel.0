Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1DF731C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 17:35:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 28 Jan 2016 09:35:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,359,1449561600"; d="scan'208";a="736024658"
Received: from tramaiah-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.140.69])
	by orsmga003.jf.intel.com with ESMTP; 28 Jan 2016 09:34:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Philip Balister <philip@balister.org>
Date: Fri, 29 Jan 2016 06:34:56 +1300
Message-ID: <5510016.r0vissdbSN@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-303.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <1453998177-24110-1-git-send-email-philip@balister.org>
References: <1453998177-24110-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-vcversioner: Fix bad DESCRIPTION and HOMEPAGE entries.
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
X-List-Received-Date: Thu, 28 Jan 2016 17:35:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 28 Jan 2016 11:22:57 Philip Balister wrote:
> Copy/paste is the root of all evil.
> 
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git
> a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb index
> 152034b..6c96875 100644
> --- a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> @@ -1,5 +1,5 @@
> -DESCRIPTION = "Twisted Web Sockets"
> -HOMEPAGE = "https://github.com/MostAwesomeDude/txWS"
> +DESCRIPTION = "Python vcversioner"
> +HOMEPAGE = "https://github.com/habnabit/vcversioner"

Sorry to pick on this, I know you're fixing a completely wrong description, 
but:

* Short descriptions should go in SUMMARY
* This is a pretty useless short description, it doesn't do anything beyond 
what the recipe name does.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


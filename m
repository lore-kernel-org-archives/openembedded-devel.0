Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D96FD612D1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 14:10:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 24 Jun 2013 07:10:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,928,1363158000"; d="scan'208";a="354880350"
Received: from unknown (HELO helios.localnet) ([10.252.122.47])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jun 2013 07:10:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jun 2013 15:10:10 +0100
Message-ID: <34304782.BKnWrLGkFL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <1372031841-21518-1-git-send-email-raj.khem@gmail.com>
References: <1372031841-21518-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] proj: Update to 4.8.0
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
X-List-Received-Date: Mon, 24 Jun 2013 14:10:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 23 June 2013 16:57:21 Khem Raj wrote:
> 4.7.0 tars have disappeared on the download servers.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-navigation/proj/proj.inc      |   13 -------------
>  meta-oe/recipes-navigation/proj/proj_4.7.0.bb |    7 -------
>  meta-oe/recipes-navigation/proj/proj_4.8.0.bb |   13 +++++++++++++
>  3 files changed, 13 insertions(+), 20 deletions(-)
>  delete mode 100644 meta-oe/recipes-navigation/proj/proj.inc
>  delete mode 100644 meta-oe/recipes-navigation/proj/proj_4.7.0.bb
>  create mode 100644 meta-oe/recipes-navigation/proj/proj_4.8.0.bb

Just so I'm clear, are we embarking on a policy now of dropping inc files?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


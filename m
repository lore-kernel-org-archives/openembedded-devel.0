Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF136FF24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 16:26:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Aug 2014 09:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,837,1400050800"; d="scan'208";a="582847888"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.124])
	by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2014 09:26:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: YangHaibo <b40869@freescale.com>
Date: Sun, 10 Aug 2014 17:26:56 +0100
Message-ID: <5845461.pDedrMP9qU@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1407223893-7560-1-git-send-email-b40869@freescale.com>
References: <1407223893-7560-1-git-send-email-b40869@freescale.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-webserver][PATCH v4] integrate fcgi-2.4.0 and add OML license file
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
X-List-Received-Date: Sun, 10 Aug 2014 16:26:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 05 August 2014 15:31:33 YangHaibo wrote:
> Signed-off-by: YangHaibo <b40869@freescale.com>
> ---
>  meta-oe/licenses/OML                               | 28
> ++++++++++++++++++++++ .../fcgi/fcgi/Fix_EOF_not_declared_issue.patch     |
> 17 +++++++++++++ .../fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch     | 18
> ++++++++++++++ meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb     | 15

I've merged this, thanks; I did move it to recipes-support (rather than 
recipes-fcgi) though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


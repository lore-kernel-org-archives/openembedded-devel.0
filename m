Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3186B8BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 08:43:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 16 Jun 2014 01:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,485,1400050800"; d="scan'208";a="548521858"
Received: from lakaruna-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.8])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2014 01:43:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Eduardo Silva <eduardo@monkey.io>
Date: Mon, 16 Jun 2014 09:43:25 +0100
Message-ID: <6983375.pDRiSKljRX@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.6-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1402756840-30533-1-git-send-email-eduardo@monkey.io>
References: <1402756840-30533-1-git-send-email-eduardo@monkey.io>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] monkey: new v1.5.1 release.
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
X-List-Received-Date: Mon, 16 Jun 2014 08:43:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Eduardo,

On Saturday 14 June 2014 08:40:40 Eduardo Silva wrote:
> This patch add the minor release fix of Monkey HTTP Server v1.5.1. It fixes
> some problems when switching user when started as root.
> 
> monkey/yocto: 7a702d00c5e48d1e03d8bbd2c7bd93a0d26f701e
> 
> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>  .../recipes-httpd/monkey/monkey_1.5.1.bb           | 36
> ++++++++++++++++++++++ 1 file changed, 36 insertions(+)

Typically we try to keep only one version of each recipe unless there is a 
good reason to do otherwise. Could you send a v2 of your patch which also 
removes the previous version recipe?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


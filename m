Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0083F6E374
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 18:22:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Feb 2014 10:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,840,1384329600"; d="scan'208";a="481036322"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.58])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2014 10:21:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2014 18:21:42 +0000
Message-ID: <30942504.aDmGqzKfcz@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.12.10-300.fc20.x86_64; KDE/4.12.2; x86_64; ;
	)
In-Reply-To: <1392270611-7344-1-git-send-email-raj.khem@gmail.com>
References: <1392270611-7344-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libmicrohttpd: add recipe
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
X-List-Received-Date: Thu, 13 Feb 2014 18:22:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 12 February 2014 21:50:11 Khem Raj wrote:
> libmicrohttpd is needed by systemd-journald-gatewayd

meta-oe already contains libmicrohttpd:

meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb
meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb

We should probably replace the old versions assuming there isn't a good reason 
to keep them around.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


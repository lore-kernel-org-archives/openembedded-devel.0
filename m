Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8332560DFA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Apr 2014 13:11:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Apr 2014 06:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,804,1389772800"; d="scan'208";a="507918685"
Received: from tmcqueen-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.95])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2014 06:11:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2014 14:11:09 +0100
Message-ID: <2010470.4z7UHuNiJD@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.7-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <1396444803-17605-1-git-send-email-linus.walleij@linaro.org>
References: <1396444803-17605-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] h3600: add new patches, update config
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
X-List-Received-Date: Sun, 06 Apr 2014 13:11:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Linus,

On Wednesday 02 April 2014 15:20:03 Linus Walleij wrote:
> This adds the latest iPAQ microcontroller patches to the yocto-dev
> recipe, updates the defconfig, adds the h3600 variant to the bbappend
> file and selects this as default for the h3600.

Thanks! I've merged this partially, except for switching over to linux-yocto-
dev by default - Andrea has updated linux-yocto to 3.14 and included your 
patches, so that should now be being built instead.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


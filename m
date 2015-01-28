Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4A19160017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 08:59:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jan 2015 00:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,480,1418112000"; d="scan'208";a="677226651"
Received: from jkaplinx-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.113])
	by orsmga002.jf.intel.com with ESMTP; 28 Jan 2015 00:59:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jan 2015 08:59:03 +0000
Message-ID: <5351926.a74nUugD2W@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1422415423-19807-1-git-send-email-Chong.Lu@windriver.com>
References: <1422415423-19807-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] samba: disable service by default
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
X-List-Received-Date: Wed, 28 Jan 2015 08:59:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chong,

On Wednesday 28 January 2015 11:23:43 Chong Lu wrote:
> Disable smb, nmb, winbind service by default.

The commit message says what you are doing, but doesn't explain the reason - 
why do you want to do this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


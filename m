Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1EA6010B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Sep 2018 23:51:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Sep 2018 16:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,353,1531810800"; d="scan'208";a="262068964"
Received: from guxiaoho-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.255.163.185])
	by fmsmga006.fm.intel.com with ESMTP; 09 Sep 2018 16:51:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Sep 2018 11:50:59 +1200
Message-ID: <1730710.uE1zf6BjpF@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <20180906172210.42551-10-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
	<20180906172210.42551-10-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 10/17] mosquitto: Make enabling systemd also enable build dep on systemd
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
X-List-Received-Date: Sun, 09 Sep 2018 23:51:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 7 September 2018 5:22:03 AM NZST Khem Raj wrote:
> systemd support in mqtt needs system developement headers and libs installed
> in recipe sysroot

True - sorry about that. I could have reissued the update patch though - I see 
it's not in master-next, should I do that?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre




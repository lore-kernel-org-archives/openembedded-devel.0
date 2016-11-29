Return-Path: <paul.eggleton@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CC435719F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:53:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2016 09:52:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="906820106"
Received: from cloo7-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.199])
	by orsmga003.jf.intel.com with ESMTP; 29 Nov 2016 09:52:48 -0800
From: Paul Eggleton <paul.eggleton@intel.com>
To: Michael Halstead <michael@yoctoproject.org>,
	Jose Lamego <jose.a.lamego@intel.com>
Date: Wed, 30 Nov 2016 06:52:46 +1300
Message-ID: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
MIME-Version: 1.0
Cc: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: meta-openembedded patchwork git hook
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
X-List-Received-Date: Tue, 29 Nov 2016 17:53:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi folks,

Martin just brought to my attention that the git hook for the 
meta-openembedded repository that's supposed to update patchwork still isn't 
working and hasn't done so for a very long time. I thought we'd fixed this so 
that merged patches get marked as "Accepted", but at least for meta-
openembedded it seems like that's not the case.

Jose / Michael - can you look into this if you haven't already? Please let me 
know if you need any help.

Thanks,
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre


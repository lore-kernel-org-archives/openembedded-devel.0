Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 754BB605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 14:59:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 26 Feb 2015 06:51:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,653,1418112000"; d="scan'208";a="672081354"
Received: from jwatso2-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.13])
	by fmsmga001.fm.intel.com with ESMTP; 26 Feb 2015 06:59:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Cliff Brake <cbrake@bec-systems.com>
Date: Thu, 26 Feb 2015 14:59:31 +0000
Message-ID: <3940856.MG0aP8oKbE@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <CAOd_LFwt57hC7kxYeNA2bY-pLkJcJBZ5c2w9LZxxE1CxvCJ06g@mail.gmail.com>
References: <CAOd_LFwt57hC7kxYeNA2bY-pLkJcJBZ5c2w9LZxxE1CxvCJ06g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: building 32-bit SDK on 64-bit machine?
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
X-List-Received-Date: Thu, 26 Feb 2015 14:59:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 26 February 2015 09:31:45 Cliff Brake wrote:
> Does anyone know if its possible to build a 32-bit SDK on a 64-bit
> workstation in OE?

Absolutely, just set SDKMACHINE to "i686" and you should be good to go.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


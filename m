Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 32804605BA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:44:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jun 2016 05:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,427,1459839600"; d="scan'208";a="981749895"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2016 05:44:53 -0700
To: openembedded-devel@lists.openembedded.org
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
	<2e56393d31a7bc3596af56ffb0803409d2127aa1.1464090710.git.alexander.kanavin@linux.intel.com>
	<20160602164453.GB2571@jama>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <df345609-0ba6-5629-15dc-aa77b68ad9ba@linux.intel.com>
Date: Mon, 6 Jun 2016 15:44:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160602164453.GB2571@jama>
Subject: Re: [PATCH 2/8] florence: update to 0.6.3
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
X-List-Received-Date: Mon, 06 Jun 2016 12:44:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2016 07:44 PM, Martin Jansa wrote:
> commit 5adc7db356071e22219d652e11911b98d9f8bf6e
> Author: Stefan Agner <stefan.agner@toradex.com>
> Date:   Tue May 24 13:43:11 2016 -0700
>
>     florence: move to latest GTK2 version 0.5.4
>
> It also doesn't apply because of this, so please confirm and resend.

No need to. I updated florence to fix build failures against my oe-core 
changes, and this update to an older version does the job just fine as 
well. I have no special interest in florence :)

Alex



Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B5FE16059A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 10:07:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2014 03:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,544,1400050800"; d="scan'208";a="533829917"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.121.119])
	by orsmga001.jf.intel.com with ESMTP; 25 Jun 2014 03:07:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Philip Balister <philip@balister.org>
Date: Wed, 25 Jun 2014 11:07:53 +0100
Message-ID: <2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.8-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <53AA0672.7070606@balister.org>
References: <53AA0672.7070606@balister.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Wed, 25 Jun 2014 10:08:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 June 2014 16:14:58 Philip Balister wrote:
> What's the best available solution for creating an image you can dd to
> an SD card? It seems like this wheel has been invented several times and
> I am wondering if people are converging on one approach.
> 
> Bonus points for resizing the linux partition.
> 
> How are people doing this today?

I think wic has seen some uptake and enhancement since its introduction a 
couple of releases ago. It has certainly worked for me in writing SD cards for 
Galileo. We seem to be a bit short on documentation for it though...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4DF5870022
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 00:43:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 16 Sep 2016 17:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,347,1470726000"; d="scan'208";a="1052187155"
Received: from ananthna-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.179.76])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2016 17:43:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 17 Sep 2016 12:43:45 +1200
Message-ID: <58965482.AtoM11idVP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.3-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAJTo0LYBx4JAof1mHvPc87eN24kioa9n33K46ig_O_JoE7z1vg@mail.gmail.com>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
	<CAAQYJAtf4ixqfk+0Xk2z7jSHE8=b3GWW1m=Viw8Qnu_1ZMCFSQ@mail.gmail.com>
	<CAJTo0LYBx4JAof1mHvPc87eN24kioa9n33K46ig_O_JoE7z1vg@mail.gmail.com>
MIME-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 4/4] tslib: move recipe from oe-core
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
X-List-Received-Date: Sat, 17 Sep 2016 00:43:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 16 Sep 2016 16:08:57 Burton, Ross wrote:
> On 16 September 2016 at 13:10, Andrea Adami <andrea.adami@gmail.com> wrote:
> > Well, there is still one drawback...the 'custom' xserver-nodm-init is
> > still present but there are patches on the ML for its removal.
> 
> Hopefully the improvements in oe-core mean the meta-oe recipe can be
> removed, but it was decided that it was too late in the cycle to push this
> and will wait for 2.3 to release before looking at deleting bits of meta-oe.

The trouble is there are still people using it and we didn't wait for the 
recipe to be merged into meta-oe before removing it from oe-core. Can we 
please put in place procedures to avoid this happening in future?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


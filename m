Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 43D9C6F2A0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Mar 2014 22:48:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Mar 2014 14:48:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,569,1389772800"; d="scan'208";a="492240976"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.253])
	by orsmga002.jf.intel.com with ESMTP; 01 Mar 2014 14:48:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 01 Mar 2014 22:48:57 +0000
Message-ID: <5621583.lHbqxaxFpZ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.4-200.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <CAJTo0LbSeFKkk0JrEYQAS3Lb2NVAJYuraaBAkNCgT_-LUW+Gdw@mail.gmail.com>
References: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
	<5362182.lGPryEyDJx@peggleto-mobl5.ger.corp.intel.com>
	<CAJTo0LbSeFKkk0JrEYQAS3Lb2NVAJYuraaBAkNCgT_-LUW+Gdw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors
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
X-List-Received-Date: Sat, 01 Mar 2014 22:48:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 01 March 2014 20:18:44 Burton, Ross wrote:
> On 1 March 2014 09:59, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> > That would be nice, but since you can't actually distribute a product that
> > connects to the main pool.ntp.org server (you need to register your own
> > NTP
> > pool [1]) we've elected not to set any default so that you are encouraged
> > to do the right thing and explicitly set your own.
> 
> We should probably put this in the documentation.  I'll file a bug.

Whose documentation though? ntp is part of meta-networking rather than OE-
Core.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


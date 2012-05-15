Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SUEKF-0004oR-Bs
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 11:45:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 May 2012 02:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="140783189"
Received: from unknown (HELO helios.localnet) ([10.252.120.119])
	by orsmga001.jf.intel.com with ESMTP; 15 May 2012 02:35:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Date: Tue, 15 May 2012 10:35:36 +0100
Message-ID: <167138120.T8PAYiiqZy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-19-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAF6bG8e9WW3S_OrP_Ad085-9XB4eBCrd9aCAh_xsrOPZ_kuisA@mail.gmail.com>
References: <CAF6bG8e9WW3S_OrP_Ad085-9XB4eBCrd9aCAh_xsrOPZ_kuisA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-games layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2012 09:45:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 May 2012 03:02:08 Marko Lindqvist wrote:
> Do you maintain any kind of list of freely available recipes provided
> by third parties? If I need some library for which there is no recipe
> in openembedded-core or meta-openembedded, I'd like to check if
> someone else has already made it and not to reinvent the Wheel myself.
> 
> I found layers list http://www.openembedded.org/wiki/LayerIndex . Is
> there some criteria what layers are accepted to that list? I just
> wonder if I should/could add my new project to provide basic recipes
> for some open source games, called meta-games layer (
> https://github.com/cazfi/meta-games ), to that list.

The only real criteria would be that there's someone willing to maintain the 
layer; the layer has a reasonably well-defined purpose (i.e. not just "bob's 
miscellaneous recipes"), and doesn't overlap too much with other existing 
layers assuming the existing layers are well-maintained.

meta-games looks like it definitely qualifies - I've added it to the layer 
index. Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



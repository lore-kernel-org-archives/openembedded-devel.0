Return-Path: <dvhart@infradead.org>
X-Greylist: delayed 1482 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Jun 2017 17:45:08 UTC
Received: from bombadil.infradead.org (bombadil.infradead.org [65.50.211.133])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD8378075
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 17:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AEYprfW0ESlao/vepxDqy5puG+DUmixBzFI8YAxvKJU=;
	b=TtPL5CVG8XjCbYOl9sUhcILjr
	rS3fLf0/B1+VoS9X09COvoshB2kgF8JlPsgdEhnAn4zoFaa6eCkCOVTsOg0wA64zvxIgrT60VYgrK
	CZUb1Apjhu+zuOUw3skhisV1KBw+lwFZSmpxobkPP16aAVYfQ+3CmXpefndajlogWEYXGU6Vnmrrr
	OfynTKHloDaQJyxSNEkeO1EfJu7J4yjc/JlnJEldnHmlMF3Wp/Ovmx64hd/YFceqbsJidzixmhN0n
	gmPo/tpriMVJ1g7VuNfJVlnX/dGA0m9qd76EUoOY4gDAGTnmFZHQSKkk/aFIu5nfKceGMWNoZiaSh
	BqDgmoOdw==;
Received: from dvhart by bombadil.infradead.org with local (Exim 4.87 #1 (Red
	Hat Linux)) id 1dOSFv-0003sb-Rm; Fri, 23 Jun 2017 17:20:27 +0000
Date: Fri, 23 Jun 2017 10:20:26 -0700
From: Darren Hart <dvhart@infradead.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20170623172026.GA29859@fury>
References: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
	<7c692d80-c09b-798b-6fbe-1edc78572080@xevo.com>
	<CA+chaQeAHdzfBAaDcx_LQyFpCs_utwiE0a9Sxk3FoDQR+ridHA@mail.gmail.com>
	<5720950.qHQRHiQ22q@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <5720950.qHQRHiQ22q@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 00/14] new recipe: open-vm-tools recipe
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
X-List-Received-Date: Fri, 23 Jun 2017 17:45:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 23, 2017 at 09:41:08AM +0200, Paul Eggleton wrote:
> On Thursday, 15 June 2017 7:17:18 PM CEST Martin Jansa wrote:
> > No problem, I had issues with that script as well, but it works for me if I
> > provide all necessary params manually (when it doesn't try to figure out
> > anything).
> 
> Which issues have you been experiencing with send-pull-request? Have you 
> reported these as bugs?

I had also reached out, but hadn't subscribed to the list yet. He said he would
respin the patches and provide specifics on the failure he experienced.

If I recall, it can still be picking about certain remotes, but I thought github
was one that it handled well. So I'm looking forward to seeing the report. Happy
to help once we have some details.

-- 
Darren Hart
VMware Open Source Technology Center


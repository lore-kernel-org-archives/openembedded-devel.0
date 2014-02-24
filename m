Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8176D75D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 12:15:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Feb 2014 04:15:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,534,1389772800"; d="scan'208";a="487029387"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.208])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2014 04:15:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 24 Feb 2014 12:15:34 +0000
Message-ID: <3829871.fcosCAaezP@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <CAMCfZKHGAHVN0e9PkAQw5x98OeSOgHVXxZwNzdJZB1YxxOv1tg@mail.gmail.com>
References: <CAMCfZKHGAHVN0e9PkAQw5x98OeSOgHVXxZwNzdJZB1YxxOv1tg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: New recipes and recipes from oe-classic
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
X-List-Received-Date: Mon, 24 Feb 2014 12:15:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Diego,

On Monday 24 February 2014 08:42:39 Diego Sueiro wrote:
> What are the policies to add new recipes and recipes from openembedded
> classic?
> I could not found anything about this in openembedded wiki page.

I don't know if there really are policies, other than:

* Find a layer where the recipe fits in; or, if the recipe fits into a new 
category and there are likely to be others added soon that will also fit into 
it, create a new layer; otherwise, add it to meta-oe.

* Note in the commit message that the recipe is being migrated over from OE-
Classic.

As far as the migration goes please refer to the following wiki page:

  http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core

Hope this helps.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


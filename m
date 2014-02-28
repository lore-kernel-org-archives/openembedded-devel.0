Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 45DF86B7A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 15:43:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 28 Feb 2014 07:43:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,562,1389772800"; d="scan'208";a="483656205"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.227])
	by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2014 07:43:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Feb 2014 15:43:56 +0000
Message-ID: <8822299.R2rVXokoOe@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.4-200.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <20140228144532.GJ26981@jama>
References: <1393592670-3088-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B57545378@COSNADEXC13.usr.ingenico.loc>
	<20140228144532.GJ26981@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] fbida 2.09: cleanups and use PACKAGECONFIG
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
X-List-Received-Date: Fri, 28 Feb 2014 15:43:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 February 2014 15:45:32 Martin Jansa wrote:
> On Fri, Feb 28, 2014 at 02:21:58PM +0000, Matthieu CRAPET wrote:
> > Thanks Martin for your great help!
> > 
> > Concerning shell function & tabs, maybe a line may be added in wiki:
> > http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core
> 
> Updated there and in
> http://www.openembedded.org/wiki/Styleguide

IMO, I think four spaces for multi-line indentation is not ideal. The 
indentation is there for readability; it should line up with the opening quote 
on the first line if there is one. IIRC we only ended up with these after your 
search and replace in meta-oe because it was too hard to do otherwise.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


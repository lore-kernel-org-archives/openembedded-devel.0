Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id C93B0786DD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 05:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 000DB20AB9;
	Wed, 10 Jan 2018 05:39:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FAHH4qlQWyff; Wed, 10 Jan 2018 05:39:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D37BF20189;
	Wed, 10 Jan 2018 05:39:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5964316325F; Wed, 10 Jan 2018 00:39:40 -0500 (EST)
Date: Wed, 10 Jan 2018 00:39:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Message-ID: <20180110053940.GG9657@denix.org>
References: <20180110041539.11889-1-timothy.t.orling@linux.intel.com>
	<20180110051244.GF9657@denix.org>
	<2AD6C5F1-F975-4F02-B2E7-82091F520993@linux.intel.com>
	<1919E005-DFF5-46F3-BAF4-8585985A2BC5@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1919E005-DFF5-46F3-BAF4-8585985A2BC5@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] stress-ng: upgrade to 0.09.09 and fix musl build
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
X-List-Received-Date: Wed, 10 Jan 2018 05:39:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 09, 2018 at 09:34:27PM -0800, Tim Orling wrote:
> Here’s another bb diff with -M05 threshold

Thanks, that's much easier to see the diff! Any chance to get it inline 
instead of an attachment? Sorry for being a PITA... :)

-- 
Denys


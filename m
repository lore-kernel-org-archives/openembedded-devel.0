Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA7B60191
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 05:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0EBF520CF6;
	Mon, 15 Oct 2018 05:42:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id U4rLwErk0UYd; Mon, 15 Oct 2018 05:42:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DE15120CF1;
	Mon, 15 Oct 2018 05:42:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 64CF916477D; Mon, 15 Oct 2018 01:42:33 -0400 (EDT)
Date: Mon, 15 Oct 2018 01:42:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181015054233.GD7186@denix.org>
References: <20181015034620.GC7186@denix.org>
	<CAMKF1soJ_zWahqTPNYeqqwQsRUdEpYL+GiFKziWfZYK6MrTN7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soJ_zWahqTPNYeqqwQsRUdEpYL+GiFKziWfZYK6MrTN7g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] commits w/o patches on the list?
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
X-List-Received-Date: Mon, 15 Oct 2018 05:42:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 14, 2018 at 10:04:51PM -0700, Khem Raj wrote:
> On Sun, Oct 14, 2018 at 8:46 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > I noticed there are commits to meta-qt5 that didn't have corresponding patches
> > sent to the list and didn't have any discussions around those. Is that the new
> > norm?
> 
> in a way yes. meta-qt5 has recently started to accept github pull requests.

well, that's something for another discussion...

for now, I'm trying to locate a PR/patch for this commit:
https://github.com/meta-qt5/meta-qt5/commit/3224b028e70ab3a910ce4fccdd9f3fac4e37011f

-- 
Denys


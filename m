Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B9BD8606BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 19:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DED2A20900;
	Thu, 22 Jun 2017 19:35:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mVoEAb6WWWAp; Thu, 22 Jun 2017 19:35:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B390020156;
	Thu, 22 Jun 2017 19:35:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 436BA16250F; Thu, 22 Jun 2017 15:35:47 -0400 (EDT)
Date: Thu, 22 Jun 2017 15:35:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20170622193547.GT28053@denix.org>
References: <1496925018-5300-1-git-send-email-samuli.piippo@qt.io>
	<91dc3ff5-ad3a-ff4c-163a-4b82bb721422@gmail.com>
	<CA+chaQe9JFMTrZ8HcOPyVqj7VDvg4N_8VKGRf3X3vDuwC37f8w@mail.gmail.com>
	<CA+chaQe=8hRDdymjoqn0wRo03XUF0cTdvNiLQTUuvqzLsL2Q2w@mail.gmail.com>
	<CABXoSoWZBLfn4K2DcHED90U3Bvcj8GRLX9Qa5XL844hZB0+Tzg@mail.gmail.com>
	<CA+chaQc8V+tVZ4g+B7CAeR49wbDgs4+Uo+B++8ieKgG8HA4Zig@mail.gmail.com>
	<CAHUNapTL=U_t4EwTKkQ8B8A7j+=WKCU64u_MFeioB0yv_VfACA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapTL=U_t4EwTKkQ8B8A7j+=WKCU64u_MFeioB0yv_VfACA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v3] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Thu, 22 Jun 2017 19:35:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 15, 2017 at 01:25:12AM -0400, Trevor Woerner wrote:
> On Fri, Jun 9, 2017 at 4:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Then why does it work for chromium which used to have the same issue?
> 
> https://github.com/OSSystems/meta-browser/blob/master/recipes-browser/chromium/chromium/chromium/m32.patch

Hmm, I'm wondering who comes up with such nonsense upstream that we have to 
patch it out? Is it due to laziness or are there some real limitations?

-- 
Denys


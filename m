Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E9FA670621
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 09:49:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43130741"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Nov 2014 17:45:54 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAA9mrgx019518;
	Mon, 10 Nov 2014 17:48:53 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD03.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6;
	Mon, 10 Nov 2014 17:49:05 +0800
Date: Mon, 10 Nov 2014 17:49:02 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <martin.jansa@gmail.com>
Message-ID: <20141110174902.1c4f3a12@Fedora>
In-Reply-To: <20141110064955.GC2440@jama>
References: <1415353921-20973-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<20141110064955.GC2440@jama>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] xgamma: Add new recipes
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
X-List-Received-Date: Mon, 10 Nov 2014 09:49:17 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Mon, 10 Nov 2014 07:49:55 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> How was this recipe tested?
> 
> ERROR: ParseError at
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb:1:
> Could not include required file xorg-app-common.inc

Oh Jansa, I'm really sorry for my mistake. :( I had a wrong workflow while doing
my work. I'll send a new patch later. I tested my other two patch(tomoyo-tools
and umip) and they're OK.


Qian Lei


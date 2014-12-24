Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 689C672656
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Dec 2014 07:49:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="46281471"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Dec 2014 15:46:30 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBO7nOsN024634;
	Wed, 24 Dec 2014 15:49:24 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD01.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6;
	Wed, 24 Dec 2014 15:49:59 +0800
Date: Wed, 24 Dec 2014 15:49:44 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141224154944.5ee3e7ac@Fedora>
In-Reply-To: <CAP9ODKpRc=t3MLbACCfxJ8hy=_9RseX1kGy_mcSPeckY49nsVg@mail.gmail.com>
References: <1419237023-27713-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<CAP9ODKpRc=t3MLbACCfxJ8hy=_9RseX1kGy_mcSPeckY49nsVg@mail.gmail.com>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: Re: [meta-oe][PATCH] fedora-initscripts: Add new recipe
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
X-List-Received-Date: Wed, 24 Dec 2014 07:49:59 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 23 Dec 2014 19:21:58 -0200
Otavio Salvador <otavio@ossystems.com.br> wrote:

> On Mon, Dec 22, 2014 at 6:30 AM, Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:
> > The initscripts package contains the basic system scripts used to boot your
> > Red Hat or Fedora system, change runlevels, and shut the system down
> > cleanly. Initscripts also contains the scripts that activate and deactivate
> > most network interfaces.
> >
> > Port from Fedora 20.
> >
> > Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> 
> Could you explain why you wish to have this included? What is missing
> on the standard init scripts?
> 

Thanks for your feedback.
I had a look at the standard initscripts in oe-core and found it much better.
I'll use it instead of my fedora-initscripts. So please ignore this patch.

-- 
Qian Lei


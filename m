Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 298E072278
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 01:26:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44310882"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2014 09:23:14 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB21QB7q013668;
	Tue, 2 Dec 2014 09:26:11 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD01.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6; Tue, 2 Dec 2014
	09:26:35 +0800
Date: Tue, 2 Dec 2014 09:26:23 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141202092623.7645e77e@Fedora>
In-Reply-To: <CAP9ODKpj=+MZGBRbKw5ruo+5wUJE+oSKkkyHsNVBdiviyFby8w@mail.gmail.com>
References: <1417425246-30891-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<CAP9ODKpj=+MZGBRbKw5ruo+5wUJE+oSKkkyHsNVBdiviyFby8w@mail.gmail.com>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: Re: [meta-oe][PATCH] logwatch: Add new recipe
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
X-List-Received-Date: Tue, 02 Dec 2014 01:26:44 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Mon, 1 Dec 2014 13:29:33 -0200
Otavio Salvador <otavio@ossystems.com.br> wrote:

> On Mon, Dec 1, 2014 at 7:14 AM, Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:
> > Logwatch is a customizable, pluggable log-monitoring system. It will go
> > through your logs for a given period of time and make a report in the areas
> > that you wish with the detail that you wish. Easy to use - works right out
> > of the package on many systems.
> >
> > Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> 
> Doesn't it have a  'make install' ?
> 
> 

No, there's only a shell script to install some lib/script/conf files
to the host, so I have to implement do_install myself to do the same work. 

-- 
Qian Lei


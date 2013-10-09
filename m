Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B8AE06CE6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 17:03:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Oct 2013 10:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1064,1371106800"; d="scan'208";a="414395844"
Received: from unknown (HELO helios.localnet) ([10.252.120.216])
	by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2013 10:03:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Wed, 09 Oct 2013 18:03:18 +0100
Message-ID: <1487978.uQOoSkE9UG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1381303656.git.hongxu.jia@windriver.com>
References: <cover.1381303656.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/2] mariadb: fix warning and update libdir for libtool
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
X-List-Received-Date: Wed, 09 Oct 2013 17:03:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Hongxu,

On Wednesday 09 October 2013 15:30:33 Hongxu Jia wrote:
> The following changes since commit 2a463dddcf76d7fa437e96f6cf0210143e97a904:
> 
>   thunar-volman: Add PACKAGECONFIG for notify (2013-10-05 14:24:05 +0200)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib hongxu/fix-mariadb
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-mariadb
> 
> Hongxu Jia (2):
>   mariadb: update libdir for libtool
>   mariadb: fix warning while invoking 'mysql_install_db' on target
> 
>  meta-oe/recipes-support/mysql/mariadb/my.cnf     | 2 +-
>  meta-oe/recipes-support/mysql/mariadb_5.1.67.inc | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

These look OK to me.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


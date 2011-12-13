Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RacAo-0007kS-OP
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 00:54:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Dec 2011 15:47:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101881956"
Received: from unknown (HELO helios.localnet) ([10.252.122.62])
	by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2011 15:47:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 13 Dec 2011 23:47:02 +0000
Message-ID: <3017837.W6lmoH9RaO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1323819509-19552-1-git-send-email-dbaryshkov@gmail.com>
References: <1323819509-19552-1-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] obexftp: fix LICENSE field
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 23:54:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 December 2011 03:38:29 Dmitry Eremin-Solenikov wrote:
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  recipes-support/obexftp/obexftp_0.23.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes-support/obexftp/obexftp_0.23.bb
> b/recipes-support/obexftp/obexftp_0.23.bb index 46cc628..b6aa9fb 100644
> --- a/recipes-support/obexftp/obexftp_0.23.bb
> +++ b/recipes-support/obexftp/obexftp_0.23.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "OBEX Ftp Client based on openobex."
>  SECTION = "console/network"
>  HOMEPAGE = "http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp"
> -LICENSE = "GPLv2/LGPLv2"
> +LICENSE = "GPLv2 & LGPLv2"
>  DEPENDS = "openobex bluez4 virtual/libusb0 virtual/libiconv"
>  PR = "r1"

Merged to meta-opie, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



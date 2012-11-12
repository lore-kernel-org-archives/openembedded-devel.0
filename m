Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TXrUv-0000xW-3A
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 11:44:09 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Nov 2012 02:30:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,761,1344236400"; d="scan'208";a="216425349"
Received: from unknown (HELO helios.localnet) ([10.252.122.159])
	by azsmga001.ch.intel.com with ESMTP; 12 Nov 2012 02:30:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2012 10:30:13 +0000
Message-ID: <1768834.C2QXGxk9V4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1352207841-25397-1-git-send-email-ml@communistcode.co.uk>
References: <1352207841-25397-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [meta-webserver][PATCH v2 1/2] hiawatha: update to 8.6
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
X-List-Received-Date: Mon, 12 Nov 2012 10:44:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 November 2012 13:17:20 Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> 
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  .../recipes-httpd/hiawatha/{hiawatha_8.5.bb => hiawatha_8.6.bb}       | 4
> ++-- 1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_8.5.bb =>
> hiawatha_8.6.bb} (91%)
> 
> diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
> b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb similarity index
> 91%
> rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
> rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
> index 71cc885..393e77f 100644
> --- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
> +++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
> @@ -9,8 +9,8 @@ SECTION = "net"
>  SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
>             file://hiawatha-init"
> 
> -SRC_URI[md5sum] = "71d3903657953c93fc930758d158097d"
> -SRC_URI[sha256sum] =
> "2567e6b4b4c6666388087b586238e6e91a4afd80e10a879920020a097fcdc946"
> +SRC_URI[md5sum] = "372ea9e8329ed36e4fb781fdc1a6734c"
> +SRC_URI[sha256sum] =
> "1a7fa98ce66beb54fc8490cc787461d719a98cb0e4a81caedfa18ac8b5ba3b3b"
> 
>  inherit cmake update-rc.d

Merged these two to meta-webserver, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UDzd3-0002pm-ER
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 16:54:41 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Mar 2013 07:38:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,809,1355126400"; d="scan'208";a="211235038"
Received: from unknown (HELO helios.localnet) ([10.255.12.228])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Mar 2013 07:38:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 08 Mar 2013 15:38:04 +0000
Message-ID: <1410016.OfJ0gICJPg@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1362753870-23009-1-git-send-email-ml@communistcode.co.uk>
References: <1362753870-23009-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
Subject: Re: [meta-webserver][PATCH] hiawatha: update to 8.8.1
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
X-List-Received-Date: Fri, 08 Mar 2013 15:54:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 08 March 2013 14:44:30 Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> 
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  .../recipes-httpd/hiawatha/{hiawatha_8.7.bb => hiawatha_8.8.1.bb}     | 4
> ++-- 1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_8.7.bb =>
> hiawatha_8.8.1.bb} (93%)
> 
> diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb
> b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb similarity index
> 93%
> rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb
> rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb
> index d8a0583..9e4f119 100644
> --- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb
> +++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.8.1.bb
> @@ -9,8 +9,8 @@ SECTION = "net"
>  SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
>             file://hiawatha-init "
> 
> -SRC_URI[md5sum] = "712b1822ef525153dc4347417252768d"
> -SRC_URI[sha256sum] =
> "c35e1e975962e1105d7914f74901e304ba90681985c94236c113eaca502b5e34"
> +SRC_URI[md5sum] = "5def93779bbc10a021796abd3609caf7"
> +SRC_URI[sha256sum] =
> "2583d8e7f48ddc6cdedc27bb51d3e130679fc2f4411622bae9ddce3ef965d063"
> 
>  inherit cmake update-rc.d

Merged, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



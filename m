Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7A14B6ADA3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:34:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2013 09:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="337099315"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by orsmga001.jf.intel.com with ESMTP; 28 Jun 2013 09:34:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jun 2013 17:34:41 +0100
Message-ID: <5384825.8IglVI3LmO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <1372256115-29853-1-git-send-email-ml@communistcode.co.uk>
References: <1372256115-29853-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [meta-webserver][PATCH] Hiawatha: update to 9.2
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
X-List-Received-Date: Fri, 28 Jun 2013 16:34:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 26 June 2013 15:15:15 Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> 
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  .../recipes-httpd/hiawatha/{hiawatha_9.1.bb => hiawatha_9.2.bb}       | 4
> ++-- 1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_9.1.bb =>
> hiawatha_9.2.bb} (94%)
> 
> diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.1.bb
> b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb similarity index
> 94%
> rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_9.1.bb
> rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
> index ece4c2f..2c9fe80 100644
> --- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.1.bb
> +++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
> @@ -10,8 +10,8 @@ SRC_URI =
> "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
> file://hiawatha-init \
>             file://hiawatha.service "
> 
> -SRC_URI[md5sum] = "833ffc295310cb30694e2b6a2c7ffc9c"
> -SRC_URI[sha256sum] =
> "699958c178757be0a5074093c15a136cd4387403e60911d29520d362f345ab48"
> +SRC_URI[md5sum] = "a77f044634884c4cc5d21dab44e822a3"
> +SRC_URI[sha256sum] =
> "5d9cdec51c618bb3efab747030e593d9bd49dfaf3236254c8e0cb60715716dbf"
> 
>  INITSCRIPT_NAME = "hiawatha"
>  INITSCRIPT_PARAMS = "defaults 70"

Merged, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


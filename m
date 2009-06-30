Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MLhYf-0002v3-38
	for openembedded-devel@openembedded.org; Tue, 30 Jun 2009 19:55:53 +0200
Received: (qmail 18382 invoked from network); 30 Jun 2009 17:44:03 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 Jun 2009 10:44:03 -0700
Date: Tue, 30 Jun 2009 10:44:02 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090630174402.GM23935@smtp.west.cox.net>
References: <1246379971-1420-1-git-send-email-k.kooi@student.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <1246379971-1420-1-git-send-email-k.kooi@student.utwente.nl>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [STABLE][PATCH] myththv: bump SRCREV
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
X-List-Received-Date: Tue, 30 Jun 2009 17:55:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2009 at 06:39:31PM +0200, Koen Kooi wrote:

> From: Koen Kooi <koen@openembedded.org>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
>  recipes/mythtv/mythtv_0.21.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/mythtv/mythtv_0.21.bb b/recipes/mythtv/mythtv_0.21.bb
> index 3594afb..89b9b11 100644
> --- a/recipes/mythtv/mythtv_0.21.bb
> +++ b/recipes/mythtv/mythtv_0.21.bb
> @@ -5,7 +5,7 @@ inherit qmake qt3x11
>  PR = "${SRCREV}+r5"
>  REALPV = "0.21"
>  
> -SRCREV = "19479"
> +SRCREV = "20763"
>  SRC_URI = "svn://svn.mythtv.org/svn/branches/release-0-21-fixes;module=mythtv;proto=http"
>  
>  SRC_URI += " \
> -- 
> 1.6.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini



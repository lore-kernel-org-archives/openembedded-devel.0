Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1B671E30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2017 03:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F2BE120AAE;
	Sat, 14 Jan 2017 03:14:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pYv1JO80kTIh; Sat, 14 Jan 2017 03:14:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D9C51208D7;
	Sat, 14 Jan 2017 03:14:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 914D2162320; Fri, 13 Jan 2017 22:14:08 -0500 (EST)
Date: Fri, 13 Jan 2017 22:14:08 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170114031408.GK15833@denix.org>
References: <1484355363-12304-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1484355363-12304-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [morty-next][PATCH] qtwebengine: update SRCREV due to old commit no longer being available
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
X-List-Received-Date: Sat, 14 Jan 2017 03:14:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry, this was supposed to be marked [meta-qt5]


On Fri, Jan 13, 2017 at 07:56:03PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Previous commit used for 5.7.1 baseline is no longer available on 5.7 branch.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-qt/qt5/qtwebengine_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
> index 4712441..210f791 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -122,7 +122,7 @@ SRC_URI += " \
>      file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
>  "
>  
> -SRCREV_qtwebengine = "9cc97f0c63049a8076476acc89c875c9e240abfb"
> +SRCREV_qtwebengine = "6766290699acd0d73c81cf690012d52729e518b9"
>  # This is in git submodule, but we're using the latest in 49-based
>  # SRCREV_chromium = "c109a95a067af783e48f93d1cdeca870cda98878"
>  SRCREV_chromium = "b3c79e92f0a631273b639af171e59f4c367ae02e"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by mail.openembedded.org (Postfix) with ESMTP id E9EEA60EA1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 00:04:10 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUB0007GPIVYEQ3@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	07 Oct 2013 19:04:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 74FEA20091; Mon,
	07 Oct 2013 20:04:07 -0400 (EDT)
Date: Mon, 07 Oct 2013 20:04:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-id: <20131008000407.GI18775@denix.org>
References: <1381188738-29468-1-git-send-email-eric@eukrea.com>
	<1381188738-29468-18-git-send-email-eric@eukrea.com>
MIME-version: 1.0
In-reply-to: <1381188738-29468-18-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 18/18] qt: use 5.1.1 by default
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
X-List-Received-Date: Tue, 08 Oct 2013 00:04:11 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Tue, Oct 08, 2013 at 01:32:18AM +0200, Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  conf/distro/include/qt5-versions.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
> index b9959ac..f43009d 100644
> --- a/conf/distro/include/qt5-versions.inc
> +++ b/conf/distro/include/qt5-versions.inc
> @@ -1,7 +1,7 @@
>  # Select which version you prefer by defining QT5_VERSION and including this file
> -# possible values now "5.0.2", "5.1.0", "5.1.0+git%"
> +# possible values now "5.0.2", "5.1.1", "5.1.0+git%"

This one also mentions 5.0.2, which was removed already.

>  
> -QT5_VERSION ?= "5.1.0"
> +QT5_VERSION ?= "5.1.1"
>  
>  PREFERRED_VERSION_qtbase-native = "${QT5_VERSION}"
>  PREFERRED_VERSION_qtbase = "${QT5_VERSION}"
> -- 
> 1.8.4.rc3
> 


Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1A34F6C73E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 12:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 686EF31481E4;
	Thu,  5 Dec 2013 13:47:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id qug7H2szJyYF; Thu,  5 Dec 2013 13:47:32 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.228.66])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id DD95D31481E3;
	Thu,  5 Dec 2013 13:47:31 +0100 (CET)
Message-ID: <52A075E3.5020707@opendreambox.org>
Date: Thu, 05 Dec 2013 13:47:31 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1382009929-6537-1-git-send-email-obi@opendreambox.org>
	<1382010620-6944-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1382010620-6944-1-git-send-email-obi@opendreambox.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-filesystems][PATCH v2] xfsprogs: change DESCRIPTION to SUMMARY
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
X-List-Received-Date: Thu, 05 Dec 2013 12:47:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping.

On 17.10.2013 13:50, Andreas Oberritter wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
> index ceb0ddf..1dc6f09 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION = "XFS Filesystem Utilities"
> +SUMMARY = "XFS Filesystem Utilities"
>  HOMEPAGE = "http://oss.sgi.com/projects/xfs"
>  SECTION = "base"
>  LICENSE = "GPLv2"
> 



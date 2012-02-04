Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtVHB-0000em-RW
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 03:22:54 +0100
Received: by pbbb4 with SMTP id b4so3014259pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 18:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=xihY431rKvXI1DUKPMIYYgdIf9CSpIjyG+rwB2MzWxc=;
	b=sH6lEe+hI1/v3mGC+4mdxSIJgn0+oEEdW7UhKGVOc+vTUIoC+Y+dxPMYeboeQm6V8q
	Jtssdmu3i3nTNUKC9zqDZ/Ht5a/N5WIQb+9CyOlBGMb37ysi6XUMVd2L/YUX8i7wer2O
	/fpfpxzzIdukNPyYRXa1Qeb+PjrumN6OmGTnA=
Received: by 10.68.130.40 with SMTP id ob8mr22465565pbb.106.1328321694233;
	Fri, 03 Feb 2012 18:14:54 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id t10sm17277082pbb.18.2012.02.03.18.14.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 18:14:52 -0800 (PST)
Date: Fri, 3 Feb 2012 18:14:43 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120204021443.GA26306@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1328132338-15939-1-git-send-email-tworaz666@gmail.com>
	<1328310612-2098-1-git-send-email-tworaz666@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1328310612-2098-1-git-send-email-tworaz666@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v3] tmux: Add initial recipe for version 1.6.
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
X-List-Received-Date: Sat, 04 Feb 2012 02:22:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/02/12 00:10), Peter Tworek wrote:
> Run tested on netbook pro.
> 
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  meta-oe/recipes-extended/tmux/tmux_1.6.bb |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/tmux/tmux_1.6.bb
> 
> diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
> new file mode 100644
> index 0000000..fa58065
> --- /dev/null
> +++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Terminal multiplexer"
> +HOMEPAGE = "http://tmux.sourceforge.net"
> +SECTION = "console/utils"
> +
> +LICENSE = "ISC"

what is ISC license ? I thought tmux is more like BSD license here is
what I read in NOTES files

tmux is intended to be a simple, modern, BSD-licensed alternative....



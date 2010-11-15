Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PI1hO-0008KD-S9
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 17:14:35 +0100
Received: by fxm11 with SMTP id 11so3641430fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 08:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=tjeHle1z7t6Wqy1d9ZKKnVtXS2A8RvW/oajN7SsfMuI=;
	b=omUpIFM8P6b3F1m0fFTPwdrsFw4QHkPyF6xJdwmf61LfSI6Cba5HajQAWmSkj6lPYm
	jtUrqNFQmWYjxztkJYhkYQBmR1qdAGhkTC1PnYlWMyC1yH9gilhu2V2zTHEnSEAHlZp8
	otcsfEdHsgjIhy7Vbx8oEBZDqml7OvE9kKPcA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=bSutPpjeKZ+VHrfhmM8e5u86xbp/OqaWh7YXkCvJmH98oSjZCMmQfmcazs6ZHMROnR
	SlcSSL0d8x0EGduJn0+IyNRrn/+M78p1S99HJsVsYG8DMZsV6oU364gbn8T+nDaMNpvh
	BRfHz/auHdljB3bXmYEDFqc14IvgM+p6iMg84=
Received: by 10.223.98.198 with SMTP id r6mr312479fan.96.1289837602370;
	Mon, 15 Nov 2010 08:13:22 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l23sm917383fam.19.2010.11.15.08.13.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 15 Nov 2010 08:13:21 -0800 (PST)
Date: Mon, 15 Nov 2010 17:13:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101115161322.GC20958@jama>
References: <E1PI1cy-0004Ny-7n@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1PI1cy-0004Ny-7n@melo.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Alex Ferguson : jlime-extras: Bump PR from 1.0 to 1.0.1.
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
X-List-Received-Date: Mon, 15 Nov 2010 16:14:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 15, 2010 at 04:09:56PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 77dd054f88d2d1641e518c4aa6d79418dc7863a3
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=77dd054f88d2d1641e518c4aa6d79418dc7863a3
> 
> Author: Alex Ferguson <thoughtmonster@gmail.com>
> Date:   Fri Nov 12 17:13:45 2010 +0200
> 
> jlime-extras: Bump PR from 1.0 to 1.0.1.
> 
> The remote source file changed, so we bump PR and fix the
> checksums.
> 
> Signed-off-by: Alex Ferguson <thoughtmonster@gmail.com>
> Signed-off-by: Kristoffer Ericson <kristoffer.ericson@gmail.com>
> 
> ---
> 
>  recipes/jlime/jlime-extras_1.0.1.bb |   17 +++++++++++++++++
>  recipes/jlime/jlime-extras_1.0.bb   |   17 -----------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/recipes/jlime/jlime-extras_1.0.1.bb b/recipes/jlime/jlime-extras_1.0.1.bb
> new file mode 100644
> index 0000000..0257a34
> --- /dev/null
> +++ b/recipes/jlime/jlime-extras_1.0.1.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Various extras for the Jlime userlands"
> +PR = "r0"
> +
> +RRECOMMENDS = "jlime-extras-${MACHINE}"

also RRECOMMENDS_${PN}

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 330 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 17:41:36 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id E6540605F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 17:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 3F2AF314BCDF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 19:36:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dKGR3QZ_R2Ys
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 19:35:57 +0200 (CEST)
Received: from [172.22.22.61] (55d465ee.access.ecotel.net [85.212.101.238])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 533ED314BCA0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 19:35:57 +0200 (CEST)
Message-ID: <5361347D.1040001@opendreambox.org>
Date: Wed, 30 Apr 2014 19:35:57 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1398876295-19178-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1398876295-19178-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [meta-systemd][PATCH] lighttpd: rename .bbappend to match with any version
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
X-List-Received-Date: Wed, 30 Apr 2014 17:41:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Martin,

On 30.04.2014 18:44, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../lighttpd/{lighttpd_1.4.33.bbappend => lighttpd_1.4.35.bbappend}       | 0

this contradicts the subject.

Regards,
Andreas

>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-systemd/oe-core/recipes-extended/lighttpd/{lighttpd_1.4.33.bbappend => lighttpd_1.4.35.bbappend} (100%)
> 
> diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.33.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend
> similarity index 100%
> rename from meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.33.bbappend
> rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend
> 



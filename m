Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P1gGI-0005yg-Vq
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 16:07:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 6CB203148E2D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Oct 2010 16:06:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id J-eVtnkF5t3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Oct 2010 16:06:40 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 589E63148346
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Oct 2010 16:06:40 +0200 (CEST)
Message-ID: <4CA5EAEF.6080205@opendreambox.org>
Date: Fri, 01 Oct 2010 16:06:39 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285836574.3805.42.camel@mattotaupa>
	<1285931131-15759-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1285931131-15759-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] netkit-base-0.17: fix compile with gcc-4.x
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
X-List-Received-Date: Fri, 01 Oct 2010 14:07:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01.10.2010 13:05, Andreas Oberritter wrote:
> * v2: Added header to patch.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> * Resent with correct subject line.
> 
>  .../netkit-base-0.17/gcc4_buildfix.patch           |   19 +++++++++++++++++++
>  recipes/netkit-base/netkit-base_0.17.bb            |    3 ++-
>  2 files changed, 21 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch

Btw., this patch supersedes a similar patch sent by Pieter Grimmerink
in 2009: http://patchwork.openembedded.org/patch/1187/

Best regards,
Andreas



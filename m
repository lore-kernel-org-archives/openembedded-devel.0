Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P2jlm-0000Vb-54
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 14:03:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 9CEFC3148FE0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Oct 2010 14:03:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id B06ecYKqXdnJ
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Oct 2010 14:03:23 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id D60E531485AD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Oct 2010 14:03:23 +0200 (CEST)
Message-ID: <4CA9C28B.3000304@opendreambox.org>
Date: Mon, 04 Oct 2010 14:03:23 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285931854-17148-1-git-send-email-obi@opendreambox.org>	<1285931854-17148-3-git-send-email-obi@opendreambox.org>
	<AANLkTimSu5dVZJDbjSswaKf523NM9FfpNto=ZSq61g+M@mail.gmail.com>
In-Reply-To: <AANLkTimSu5dVZJDbjSswaKf523NM9FfpNto=ZSq61g+M@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] cdfs-2.6.27: initial recipe
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
X-List-Received-Date: Mon, 04 Oct 2010 12:03:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02.10.2010 18:28, Frans Meulenbroeks wrote:
> Looks interesting, but pity this is only for 2.6.27 (with no newer
> version being available) so can't test/use this.

Actually, 2.6.27 is only the version of CDfs. You should be able to
use it with newer kernels. It was tested with 2.6.32 and therefore
contains a patch to fix a compile error with Linux 2.6.32.

Best regards,
Andreas



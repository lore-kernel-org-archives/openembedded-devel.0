Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PNPEj-0003Mi-3b
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 13:23:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id EBA5F314B430
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 13:21:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Q70SbDykCCiN
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 13:21:44 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 9EC73314B42F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 13:21:44 +0100 (CET)
Message-ID: <4CF4EC58.4030008@opendreambox.org>
Date: Tue, 30 Nov 2010 13:21:44 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CF4E21A.90009@opendreambox.org>
	<1291119423-4541-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1291119423-4541-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] sane-srcdates.inc: remove from all distro configs as	well as file itself
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
X-List-Received-Date: Tue, 30 Nov 2010 12:23:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/30/2010 01:17 PM, Martin Jansa wrote:
> * it's empty for > 6 months
> * entries were moved to recipes
> * SRCREV instead of SRCDATE is preferred anyways http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=8da9744fcdf856abebcfbe9e3bc1b8cf07bc317b
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Andreas Oberritter <obi@opendreambox.org>



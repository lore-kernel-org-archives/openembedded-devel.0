Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P8dSH-0000Va-84
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 20:32:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id E19F031491A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 20:31:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id K4c7U+XBnWgu
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 20:31:25 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 4A51B314931F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 20:31:25 +0200 (CEST)
Message-ID: <4CBF357C.10600@opendreambox.org>
Date: Wed, 20 Oct 2010 20:31:24 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CBEB7E8.5020109@nedap.com>	<AANLkTikBiKGuQYXCdi_QMirA7_AjQn9b0A0CWtmkMu90@mail.gmail.com>	<29F88E4E-18CC-4CD2-8A76-5C78ED4EDAC7@nikom.net>	<20101020140543.GN3324@jama>	<4CBF01C6.7030409@gravedo.de>
	<i9n56p$ppm$1@dough.gmane.org>
	<AANLkTikF4A8F5n8nNdr=5ttSox5qgfTwobz-pNTEL+Li@mail.gmail.com>
In-Reply-To: <AANLkTikF4A8F5n8nNdr=5ttSox5qgfTwobz-pNTEL+Li@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building gcc-cross-initial for armv5te
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
X-List-Received-Date: Wed, 20 Oct 2010 18:32:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/2010 07:18 PM, Khem Raj wrote:
> The problem should be fixed now

I think the same fix should be applied to gcc-configure-target.inc.

Regards,
Andreas



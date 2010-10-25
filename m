Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAPQe-00006r-Bx
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 17:57:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id A3E87314A35A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 17:57:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id b0KMjTfMUaCz
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 17:56:53 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 0309531482F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 17:56:52 +0200 (CEST)
Message-ID: <4CC5A8C1.2050103@opendreambox.org>
Date: Mon, 25 Oct 2010 17:56:49 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.14) Gecko/20101006 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288011024-22560-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1288011024-22560-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libungif-4.1.3: update recipe, fix packaging
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
X-List-Received-Date: Mon, 25 Oct 2010 15:57:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/25/2010 02:50 PM, Andreas Oberritter wrote:
> * Use lib_package to move static libraries to -static
>   and *.la and *.so symlinks to -dev.

Forgot to mention that this depends on my change to lib_package.bbclass:
http://patchwork.openembedded.org/patch/3428/

Regards,
Andreas



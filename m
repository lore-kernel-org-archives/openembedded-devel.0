Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NNn58-0001vB-Dm
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 13:46:21 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C4BD61B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 12:40:46 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Dec 2009 13:44:17 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <> <1260868213-26276-1-git-send-email-camelguo@gmail.com>
In-Reply-To: <1260868213-26276-1-git-send-email-camelguo@gmail.com>
MIME-Version: 1.0
Message-Id: <200912241344.17294.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Enable --ignore-deps options to access regular expression string
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
X-List-Received-Date: Thu, 24 Dec 2009 12:46:21 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 15 December 2009 10:10:13 Guo Hongruan wrote:
> 1. Add a function named re_match_strings(target,strings), to match
>    target using the string in strings which can be regular expression

I pushed this to 1.10 and master of bitbake. thanks a lot

regards
	z.



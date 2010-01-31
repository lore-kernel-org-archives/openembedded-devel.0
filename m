Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NbRHD-0005Sv-CN
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 05:19:14 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2FDB41B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2010 04:16:15 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jan 2010 05:16:14 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <op.u7dnj4v0mn1qzu@camelguo> <op.u7do2cw1mn1qzu@camelguo>
	<op.u7dpieeymn1qzu@camelguo>
In-Reply-To: <op.u7dpieeymn1qzu@camelguo>
MIME-Version: 1.0
Message-Id: <201001310516.14421.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building u-boot - git failed
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
X-List-Received-Date: Sun, 31 Jan 2010 04:19:14 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Sunday 31 January 2010 05:02:28 Guo Hongruan wrote:
> I think I got the answer, see
> http://git.denx.de/?p=u-boot.git;a=commitdiff;h=f865fcbbb35851e75fee9c3a3fa
> 8e0f71d9e6463
> 
> adding the following patch to u-boot recipe can solve this problem.

Please create a patch that can be applied to the OE tree.

thanks



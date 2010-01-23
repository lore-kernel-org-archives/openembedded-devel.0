Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYcrG-0000f8-KL
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:04:49 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C335E1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 10:01:18 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 11:02:10 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <he0ijk$kqa$2@ger.gmane.org>
	<c384c5ea0911180344u7aa5a29ao71528ff23547643e@mail.gmail.com>
	<20091118123012.GD2919@mx.loc>
In-Reply-To: <20091118123012.GD2919@mx.loc>
MIME-Version: 1.0
Message-Id: <201001231102.11017.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert of 406cd0fee12ad99ba6d6f7d55f743cc4c6697955
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
X-List-Received-Date: Sat, 23 Jan 2010 10:04:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 18 November 2009 13:30:12 Bernhard Reutner-Fischer wrote:
> I suggest to just #define it to _exit, yes.
> (glibc has it as weak alias but i'd prefer to get away with a define),
> like:

Two things..

1.) The patch can not be applied as someone's mailer has linewrapped it
2.) Does the issue still apply?




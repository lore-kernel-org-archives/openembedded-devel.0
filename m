Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NcFaw-0005YS-RO
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 11:02:57 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 8CBE11B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2010 10:00:07 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 2 Feb 2010 10:59:52 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1265103507.19185.8.camel@balakrishnan-desktop>
In-Reply-To: <1265103507.19185.8.camel@balakrishnan-desktop>
MIME-Version: 1.0
Message-Id: <201002021059.52148.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] regulus: Adding pxa270 based machine
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
X-List-Received-Date: Tue, 02 Feb 2010 10:02:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 02 February 2010 10:38:27 balakrishnan wrote:
> Dear OE,
>        I have mailed four patches to OE dev list on last month regarding
> "pxa270 based machine" inclusion in OE(stable/2009). Can I have status
> of my patches?

Two things,
I think one of the stable/2009 rules is that it needs to be in dev first and 
will be backported then. So you would have to prepare your changes to .dev and 
then ask for stable review.

The other weird part is that I have not seen your patches on patchwork. Now 
going through the archive I see your patches and they seem to be fine.

z.






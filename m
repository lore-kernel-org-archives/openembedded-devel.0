Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KD5Rq-0000bF-Ik
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 00:32:42 +0200
Received: from andromeda.vanille.de (e180179167.adsl.alicedsl.de
	[85.180.179.167])
	by drlauer-research.com (Postfix) with ESMTP id 802C4584C35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 00:33:43 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jun 2008 00:29:47 +0200
User-Agent: KMail/1.9.9
References: <4861533F.7020906@balister.org>
In-Reply-To: <4861533F.7020906@balister.org>
MIME-Version: 1.0
Message-Id: <200806300029.47251.mickey@vanille-media.de>
Subject: Re: Building a rootfs, without building a kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 29 Jun 2008 22:32:42 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Dienstag 24 Juni 2008 22:04:15 schrieb Philip Balister:
> Does anyone know how to build an image, without building a kernel for a
> machine?

Can't you just include a dummy kernel recipe?

:M:



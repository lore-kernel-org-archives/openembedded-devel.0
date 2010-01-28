Received: from smtp3.mundo-r.com ([212.51.32.191] helo=smtp2.mundo-r.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjaquez@igalia.com>) id 1NaSXs-0003Xe-Fu
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 12:28:23 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgsFACcCYUtbdWOb/2dsb2JhbACBNNdphDwE
X-IronPort-AV: E=Sophos;i="4.49,359,1262559600"; d="scan'208";a="581204152"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp2.mundo-r.com with ESMTP; 28 Jan 2010 12:24:56 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:DHE_RSA_3DES_EDE_CBC_SHA1:24) (Exim)
	id 1NaSUZ-0004k5-Fg for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 12:24:55 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtp 
	(Cipher TLSv1:DES-CBC3-SHA:168) (Exim) id 1NaSUY-0002NO-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 12:24:55 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.71)
	(envelope-from <vjaquez@igalia.com>) id 1NaSUH-0001xX-Kq
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 12:24:37 +0100
Date: Thu, 28 Jan 2010 12:24:37 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100128112437.GB14524@lit.local.igalia.com>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.51.32.191
X-SA-Exim-Mail-From: vjaquez@igalia.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: recipies for dsp code
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
X-List-Received-Date: Thu, 28 Jan 2010 11:28:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've been playing with my own OE overlay for the beagleboard[1]. But I want to
be able to build binaries for the DSP also.

Can you point me out any examples of recipes and local configurations for
using simultaneously another toolchain?

1. http://gitorious.org/vjaquez-beagleboard/marmita



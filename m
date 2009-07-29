Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MW2fT-0007jW-NE
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2009 08:29:39 +0200
Received: from tamarin.localnet (123-192-154-148.dynamic.kbronet.com.tw
	[123.192.154.148])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 7B4A41B10C0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2009 06:16:51 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jul 2009 06:14:40 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.2.98; i686; ; )
References: <20090728072202.GA5422@gmail.com>
In-Reply-To: <20090728072202.GA5422@gmail.com>
MIME-Version: 1.0
Message-Id: <200907290614.40124.holger+oe@freyther.de>
Subject: Re: [RFC] Adding TLS selection choice to metadata
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
X-List-Received-Date: Wed, 29 Jul 2009 06:29:39 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 28 July 2009 09:22:02 Khem Raj wrote:
> Hi
>
> Enabling TLS support on uclibc/glibc is not sound enough in out build.
> Reason is we depend upon various autotools tests to find out if the
> software combination we chose can support it or not and these tests are not
> doing the correct think many times.

Have you seen the patch I sent? The title was 
[oe] [PATCH] gcc: Pass --enable-tls=no on uclibc builds...


z.





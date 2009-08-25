Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MfvwX-0002v0-G4
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 15:20:10 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id B53B41B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 13:06:33 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2009 15:01:58 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A8D91A2.1080602@linuxbj.com>
In-Reply-To: <4A8D91A2.1080602@linuxbj.com>
MIME-Version: 1.0
Message-Id: <200908251501.59031.holger+oe@freyther.de>
Subject: Re: [PATCH] linux-nokia800-2.6.21-osso71.bb fixed undefined reference to __aeabi_uldivmod problem when using gcc-4.3 compile linux-nokia800-2.6.21-osso71
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
X-List-Received-Date: Tue, 25 Aug 2009 13:20:11 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 20 August 2009 20:10:42 Ming Chow =E5=91=A8=E6=98=8E wrote:
>  From bc8990dbee051e9f36a2b90761ce1f405f8dabc6 Mon Sep 17 00:00:00 2001
> From: Ming Zhou <chow.ming@linuxbj.com>
> Date: Fri, 21 Aug 2009 02:04:15 +0800
> Subject: [PATCH] linux-nokia800-2.6.21-osso71.bb fixed undefined
> reference to __aeabi_uldivmod problem when using gcc-4.3 compile
> linux-nokia800-2.6.21-osso71


http://patchwork.openembedded.org/patch/975/


Your mailer created a total mess, could you attempt to fix that?



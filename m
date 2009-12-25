Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NO7qe-0007Ig-QI
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Dec 2009 11:56:47 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2096E1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2009 10:51:17 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Dec 2009 11:54:45 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <> <200912250546.52376.holger+oe@freyther.de>
	<op.u5hc0pupmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u5hc0pupmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
Message-Id: <200912251154.45042.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Upgrade glibc from 2.6.1 to 2.10.1, the 2.6.1 glibc cause ltrace compilation failed
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
X-List-Received-Date: Fri, 25 Dec 2009 10:56:47 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 25 December 2009 07:16:00 Guo Hongruan wrote:
> =E5=9C=A8 Fri, 25 Dec 2009 12:46:52 +0800=EF=BC=8CHolger Hans Peter Freyt=
her

> The include/sys/ptrace.h of glibc 2.6.1 lacks of the above macroes, this
> is a bug of it, which was fixed by the later glibc There is a newer
> version of glibc recipes, so I have no reason to not test with it.

Sure you have no reason to not test it but that is different from changing =
the=20
default for everyone else. The other thing from released software something=
 is=20
always missing...






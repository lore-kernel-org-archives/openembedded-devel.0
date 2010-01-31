Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NbUX1-0000sL-7H
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 08:47:46 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2A7081B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2010 07:44:46 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jan 2010 08:44:45 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <op.u7dv44vqmn1qzu@camelguo>
	<201001310812.55227.holger+oe@freyther.de>
	<op.u7dyjvnhmn1qzu@camelguo>
In-Reply-To: <op.u7dyjvnhmn1qzu@camelguo>
MIME-Version: 1.0
Message-Id: <201001310844.45729.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: circular dependency when building linux_2.6.25.bb
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
X-List-Received-Date: Sun, 31 Jan 2010 07:47:46 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 31 January 2010 08:17:45 Guo Hongruan wrote:
> =E5=9C=A8 Sun, 31 Jan 2010 15:12:55 +0800=EF=BC=8CHolger Hans Peter Freyt=
her
>=20
> <holger+oe@freyther.de> =E5=86=99=E9=81=93:
> > It is very nice that you try to so many configurations. Is this the same
> > circular dependency you have hit earlier with the kernel recipes?
>=20
> Yes, I did found some kernel recipe has circular dependency. Previously, I
> submit a patch for storcenter kernel, which has circular dependency too.

Yes,
and then there was discussion and you left. So the patch is still in the qu=
eue=20
waiting for a resolution.
z.



Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NbT7K-0006vG-SK
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 07:17:09 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 1674A1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2010 06:14:10 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jan 2010 07:14:09 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <op.u7dmmldamn1qzu@camelguo> <op.u7dt8jyhmn1qzu@camelguo>
	<op.u7dus8qwmn1qzu@camelguo>
In-Reply-To: <op.u7dus8qwmn1qzu@camelguo>
MIME-Version: 1.0
Message-Id: <201001310714.09989.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building piccontrol - 0.4 failed due to lack of liblua5.1.a
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
X-List-Received-Date: Sun, 31 Jan 2010 06:17:10 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 31 January 2010 06:56:58 Guo Hongruan wrote:
> =E5=9C=A8 Sun, 31 Jan 2010 13:44:33 +0800=EF=BC=8CGuo Hongruan <camelguo@=
gmail.com> =E5=86=99=E9=81=93:

>     20 LDFLAGS +=3D " ${STAGING_LIBDIR}/liblua5.1.a -lpthread -lm -ldl "

Okay,
care to write a patch with a proper commit message and a Signed-off-by line?

PS: In the long run the lua recipe should install the .pc and we should lin=
k=20
with pkg-config --libs lua5.1



Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OAbYl-0004gc-EN
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 06:22:39 +0200
Received: from [123.192.188.67] (123-192-188-67.dynamic.kbronet.com.tw
	[123.192.188.67])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 123271B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 May 2010 04:26:14 +0000 (UTC)
Message-ID: <4BE4E626.8030800@freyther.de>
Date: Sat, 08 May 2010 12:18:46 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-3.fc13 Lightning/1.0b1
	Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE43043.2000605@szluug.org>
In-Reply-To: <4BE43043.2000605@szluug.org>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FreeBSD 8 bitbake errors
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
X-List-Received-Date: Sat, 08 May 2010 04:22:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/07/2010 11:22 PM, Krzysztof 'soltys' Koro=C5=9Bcik wrote:
> Hi all,
> I'm trying to setup oe environment on fresh FreeBSD 8 install. I'd
> installed everything listed in [1] and [2], but when I try to bitbake
> anything I get this:
>=20
> [soltys@ ~/oe/ngw100]$ bitbake nano
> NOTE: Handling BitBake files: / (6387/8361) [76 %]ERROR: Information
> not available for target 'i386-freebsd8'

we need an entry for freebsd8.x, it should be mostly the same as for
freebsd7



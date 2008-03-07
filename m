Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>)
	id 1JXdkV-00030c-1D; Fri, 07 Mar 2008 15:40:41 +0100
Received: from cimmeria ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Fri, 07 Mar 2008 14:39:03 +0000
	id 00030435.47D15388.00003A77
Date: Fri, 7 Mar 2008 14:39:03 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-commits@lists.openembedded.org
Message-ID: <20080307143903.0df8f8b9@cimmeria>
In-Reply-To: <E1JXdfA-0002tB-NY@linuxtogo.org>
References: <E1JXdfA-0002tB-NY@linuxtogo.org>
X-Mailer: Claws Mail 3.2.0 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.angstrom-2007.12-stable linux-rp 2.6.24: disable rc patch for akita - it doesn't apply and only handles spitz
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Mar 2008 14:40:43 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 07 Mar 2008 15:35:08 +0100
"koen commit" <openembedded-commits@lists.openembedded.org> wrote:

> linux-rp 2.6.24: disable rc patch for akita - it doesn't apply and
> only handles spitz
> * again, no backport, since this is unsuitable for .dev
>=20
If one of the akita maintainers want to fix this then the OE RH-2 remote
is currently sitting on my desk unused.

=46rom what I remeber akita is just a couple of gpio different for the
remote than spitz so this should be low hanging fruit.

Graeme



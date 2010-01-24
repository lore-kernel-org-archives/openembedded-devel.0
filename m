Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYseh-0001M0-Lf
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 03:56:54 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A76681B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 02:53:26 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2010 03:54:09 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <4B584F62.1050406@balister.org>
	<1264284382.3738.175.camel@mattotaupa.wohnung.familie-menzel.net>
In-Reply-To: <1264284382.3738.175.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
Message-Id: <201001240354.09475.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using `git send-email` (was: Number 1 tip for getting your patch committed)
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
X-List-Received-Date: Sun, 24 Jan 2010 02:56:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Saturday 23 January 2010 23:06:22 Paul Menzel wrote:

> In my opinion we should therefore find a way to also work easily with
> attached patches having been created with `git format-patch`. Can some
> of the developers mention what the disadvantage of attached patches is.
> You can easily quote them to and saving and applying should be as easy
> as with messages sent using `git send-email`.

E.g. I'm still using git format-patch but most of the time as inline messag=
e,=20
with KMail there is an option to not wordwrap so the patch will not be=20
altered. I hope/asume that these options exist for other mailers too?



> And of course that it is not easy to retrieve them from Patchwork. If
> that is the only obstacle I would try to contact the Patchwork hackers
> and ask them to implement an option to retrieve the attachment if it has
> for example the extension =BBpatch=AB or =BBdiff=AB.

=46irst test if it already works and then pester them?




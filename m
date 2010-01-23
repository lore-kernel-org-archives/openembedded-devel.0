Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NYic7-0002pJ-Ki
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 17:13:34 +0100
Received: from 88-109-44-56.dynamic.dsl.as9105.com ([88.109.44.56]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NYiZt-0003E2-Rw
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 16:11:14 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1264249142.3630.41.camel@mattotaupa.wohnung.familie-menzel.net>
References: <201001230943.24210.holger+oe@freyther.de>
	<hjejrf$m65$1@ger.gmane.org>
	<1264249142.3630.41.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Sat, 23 Jan 2010 16:11:08 +0000
Message-ID: <1264263068.9974.14.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New state for patches not complying with commit policy (was: Patchwork Workflow improvement)
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
X-List-Received-Date: Sat, 23 Jan 2010 16:13:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2010-01-23 at 13:19 +0100, Paul Menzel wrote:
> If it is possible, I suggest to add a new state (=C2=BBRejected =E2=80=93=
 Commit
> Policy=C2=AB) for patches not complying with the commit policy [3]?

If the patch is basically correct then it seems a little bit officious
to reject it purely because it fails to conform to the commit policy in
some way.  Most of the issues listed in the policy are easy enough to
fix up when applying the patch, after all.

By all means send a note to the patch submitter explaining how they
could write a better commit message (or whatever) in the future, but I
don't think there is any need to reject the patch just for that.

p.





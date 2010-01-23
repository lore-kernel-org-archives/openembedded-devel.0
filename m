Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NYhi3-0006Bd-6s for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 16:15:38 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NYhfn-0004Aq-T2
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 16:13:15 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 16:13:15 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 16:13:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 23 Jan 2010 16:12:53 +0100
Message-ID: <hjf3lk$1oe$1@ger.gmane.org>
References: <201001230943.24210.holger+oe@freyther.de>	<201001231056.17675.holger+oe@freyther.de>
	<1264258385.21187.29.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <1264258385.21187.29.camel@mattotaupa.wohnung.familie-menzel.net>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patchwork Workflow improvement
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
X-List-Received-Date: Sat, 23 Jan 2010 15:15:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-01-10 15:53, Paul Menzel wrote:
> Dear Holger,
> 
> 
> Am Samstag, den 23.01.2010, 10:56 +0100 schrieb Holger Hans Peter Freyther:
>> On Saturday 23 January 2010 09:43:24 Holger Hans Peter Freyther wrote:
> 
> […]
> 
>> I have pushed "holger/staging-branch" to the server. It does contain all 
>> patches from patchwork that are still applying. Please go through the branch 
>> and cherry-pick or follow up on the emails..
> 
> if I understood correctly you mean with »patches from patchwork that are
> still applying« that the mbox file can be applied with `git am` as
> `pw-am.sh` does [1].
> 
> That requires that all patches are submitted using `git send-email`,

That is not a hard requirement, but seems to be the most fool-proof one

>  Probably every project or developers
> wrote her/his own scripts (as OE did with `pw-am.sh`) and everyone
> reinvents the wheel.

In this case it was purposely reinvented since getting OE developers to
install extra software is like pulling teeth, so a simple shell script
was added.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLWxH0MkyGM64RGpERAgAPAJ0VTGsXK2zviMV5G8Prq/Had2jzEgCfWwxu
u1NK7hM+MNyDm2tDhAFIIug=
=ONPl
-----END PGP SIGNATURE-----




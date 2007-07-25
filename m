Received: from [62.142.5.117] (helo=emh07.mail.saunalahti.fi)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philippedeswert@scarlet.be>) id 1IDgkC-00080V-DO
	for openembedded-devel@openembedded.org; Wed, 25 Jul 2007 15:17:39 +0200
Received: from saunalahti-vams (vs3-10.mail.saunalahti.fi [62.142.5.94])
	by emh07-2.mail.saunalahti.fi (Postfix) with SMTP id 9F65118D792
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Jul 2007 16:16:21 +0300 (EEST)
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
	by vs3-10.mail.saunalahti.fi ([62.142.5.94])
	with SMTP (gateway) id A05D0B9CF38; Wed, 25 Jul 2007 16:16:21 +0300
Received: from [192.168.0.102] (a91-153-17-113.elisa-laajakaista.fi
	[91.153.17.113])
	by emh03.mail.saunalahti.fi (Postfix) with ESMTP id 97050158B26
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Jul 2007 16:16:20 +0300 (EEST)
From: Philippe De Swert <philippedeswert@scarlet.be>
To: openembedded-devel@openembedded.org
In-Reply-To: <46A72E54.5030800@kernelconcepts.de>
References: <E1IDL1e-0002ro-9i@linuxtogo.org>
	<46A60832.30203@dominion.kabel.utwente.nl>
	<46A7230E.6000707@kernelconcepts.de>
	<46A7262F.1080406@dominion.kabel.utwente.nl>
	<46A72E54.5030800@kernelconcepts.de>
Date: Wed, 25 Jul 2007 16:12:33 +0300
Message-Id: <1185369153.18324.10.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Antivirus: VAMS
Subject: Re: mtn disapprove d7758e2637918ff4035244d64fb7227f6cf833ad, was Re: [oe-commits] org.oe.dev phoneserver: Add patch for FIC	GTA01	support.
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
X-List-Received-Date: Wed, 25 Jul 2007 13:17:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 2007-07-25 at 13:04 +0200, Florian Boor wrote:
> Hi,
> 
> Koen Kooi schrieb:
> > You are right that it's more productive to fix small errors than to disapprove, but:
> > I did that the first few times with PACKAGE_ARCH = "${MACHINE}", and people still keep
> > adding it, so now I'm doing dissaprove + mail to oe-devel to raise awareness.
> > Fixing errors afterwards is only productive if people learn from it and stop making the
> > same error again, which wasn't the case here.
> 
> didn't I react on the mail to the list?
> Did I introduce a similar bug lately?
> 
> I really do not appreciate if people revert a complete change for the lack of
> five bytes. That wastes too much of precious time - I can live with that, but I
> do not want such reactions causing other contributors to run away.

I tend to agree with Florian here. However the first time you need to
fix it mail the person who made the mistake and cc the mailing list so
everybody knows. Only afterwards you can start disapproving commits.

Cheers,

Philippe




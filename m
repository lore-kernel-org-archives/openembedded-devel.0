Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IDi8s-0003SJ-Sm
	for openembedded-devel@openembedded.org; Wed, 25 Jul 2007 16:47:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6PEjuix018328
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Jul 2007 15:45:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18272-01 for <openembedded-devel@openembedded.org>;
	Wed, 25 Jul 2007 15:45:47 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6PEji0f018303
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Jul 2007 15:45:44 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1185369153.18324.10.camel@localhost.localdomain>
References: <E1IDL1e-0002ro-9i@linuxtogo.org>
	<46A60832.30203@dominion.kabel.utwente.nl>
	<46A7230E.6000707@kernelconcepts.de>
	<46A7262F.1080406@dominion.kabel.utwente.nl>
	<46A72E54.5030800@kernelconcepts.de>
	<1185369153.18324.10.camel@localhost.localdomain>
Date: Wed, 25 Jul 2007 15:45:43 +0100
Message-Id: <1185374743.6190.8.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: mtn disapprove d7758e2637918ff4035244d64fb7227f6cf833ad, was Re: [oe-commits] org.oe.dev phoneserver: Add patch for	FIC	GTA01	support.
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
X-List-Received-Date: Wed, 25 Jul 2007 14:47:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 2007-07-25 at 16:12 +0300, Philippe De Swert wrote:
> On Wed, 2007-07-25 at 13:04 +0200, Florian Boor wrote:
> > Koen Kooi schrieb:
> > > You are right that it's more productive to fix small errors than to disapprove, but:
> > > I did that the first few times with PACKAGE_ARCH = "${MACHINE}", and people still keep
> > > adding it, so now I'm doing dissaprove + mail to oe-devel to raise awareness.
> > > Fixing errors afterwards is only productive if people learn from it and stop making the
> > > same error again, which wasn't the case here.
> > 
> > didn't I react on the mail to the list?
> > Did I introduce a similar bug lately?
> > 
> > I really do not appreciate if people revert a complete change for the lack of
> > five bytes. That wastes too much of precious time - I can live with that, but I
> > do not want such reactions causing other contributors to run away.
> 
> I tend to agree with Florian here. However the first time you need to
> fix it mail the person who made the mistake and cc the mailing list so
> everybody knows. Only afterwards you can start disapproving commits.

We've been chasing people introducing that particular bug for a while,
there are commits from me 18 months ago fixing it and I'm fairly sure
florian has been told about it before.

A disapprove could therefore arguably be justified to raise the profile
of the problem a bit since if its been going on for 18 months, the
message has not sunk in. Thats been done, the profile has been raised,
lets get back to normal now :).

Cheers,

Richard




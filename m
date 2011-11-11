Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ROoap-0003qy-Rt for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 11:44:21 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ROoUc-0004Qx-Ci for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 11:37:54 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 11:37:54 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 11:37:54 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 11 Nov 2011 11:37:41 +0100
Message-ID: <j9ittl$sf4$1@dough.gmane.org>
References: <4EBBF280.30301@freyther.de>
	<1320945711.21488.21.camel@phil-desktop>	<j9hbqb$b8u$1@dough.gmane.org>
	<1320959262.3080.11.camel@lenovo.internal.reciva.com>
	<j9iooh$q1p$1@dough.gmane.org> <4EBCE9FB.9030002@kernelconcepts.de>
	<1321006234.21488.35.camel@phil-desktop>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <1321006234.21488.35.camel@phil-desktop>
X-Enigmail-Version: 1.3.2
Subject: Re: RFC Creation of a meta-telephony repository
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
X-List-Received-Date: Fri, 11 Nov 2011 10:44:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-11-11 11:10, Phil Blundell schreef:
> On Fri, 2011-11-11 at 10:25 +0100, Florian Boor wrote:
>> In this context my interpretation would be that the TSC grants 
>> permissions for write access to the Git tree but nothing more. And 
>> further control related to the responsible use of Git is not defined 
>> and IMHO never was. Phil has the required permissions to create a 
>> layer, so why he would have to ask?
>> 
>> If there are really members out there who interpret this sentence as 
>> "you have to ask the TSC for everything related to use of the Git 
>> server" we need to discuss the charter again. If we do not make this 
>> more clear it won't take long and someone steps up claiming that the 
>> TSC would have to accept any single commit :-/
> 
> Well, indeed.  Also, in the particular case at hand, it seems that the 
> board has already made a policy decision about community-maintained 
> layers being appropriate for hosting on oe.org.  I'm not sure that it is
>  within the TSC's remit to obstruct the implementation of that policy by
>  insisting on some sort of extra approval process every time someone
> wants to create such a layer.
> 
> The other thing that seems faintly absurd in this particular instance is
>  that nobody has raised any actual objection to the creation of the layer
>  in principle and, aside from noting that we don't wish the admin team to
>  be overworked, nor has anybody suggested any reasons why it shouldn't be
>  hosted on oe.org.  So, on that basis, and absent any reason to believe 
> that this layer would produce a crippling administrative workload, it 
> isn't obvious what rational basis the TSC would have for deciding to 
> oppose its creation.

Have you asked the TSC? My point was that you should ask before going ahead.
I can't speak for the TSC, but I wouldn't expect any troubles on that front,
but you do need to ask first.

In the past the TSC has expressed their suprise at git repos popping up on
oe.org with their knowledge.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOvPr1MkyGM64RGpERAk5TAJ4z69GzWmjV6p9LCZv/HkDzgL4VlACdEuPh
rJ1ZwBNpUSyu5Foca7mJbIw=
=XQNE
-----END PGP SIGNATURE-----




Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1ROoAD-0003OD-GD
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 11:16:49 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1ROo4A-0003D8-0B
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 11:10:34 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Nov 2011 10:10:32 +0000
In-Reply-To: <4EBCE9FB.9030002@kernelconcepts.de>
References: <4EBBF280.30301@freyther.de>
	<1320945711.21488.21.camel@phil-desktop>	<j9hbqb$b8u$1@dough.gmane.org>
	<1320959262.3080.11.camel@lenovo.internal.reciva.com>
	<j9iooh$q1p$1@dough.gmane.org> <4EBCE9FB.9030002@kernelconcepts.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1321006234.21488.35.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 11 Nov 2011 10:16:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-11 at 10:25 +0100, Florian Boor wrote:
> In this context my interpretation would be that the TSC grants permissions for
> write access to the Git tree but nothing more. And further control related to
> the responsible use of Git is not defined and IMHO never was. Phil has the
> required permissions to create a layer, so why he would have to ask?
> 
> If there are really members out there who interpret this sentence as "you have
> to ask the TSC for everything related to use of the Git server" we need to
> discuss the charter again. If we do not make this more clear it won't take long
> and someone steps up claiming that the TSC would have to accept any single
> commit :-/

Well, indeed.  Also, in the particular case at hand, it seems that the
board has already made a policy decision about community-maintained
layers being appropriate for hosting on oe.org.  I'm not sure that it is
within the TSC's remit to obstruct the implementation of that policy by
insisting on some sort of extra approval process every time someone
wants to create such a layer.

The other thing that seems faintly absurd in this particular instance is
that nobody has raised any actual objection to the creation of the layer
in principle and, aside from noting that we don't wish the admin team to
be overworked, nor has anybody suggested any reasons why it shouldn't be
hosted on oe.org.  So, on that basis, and absent any reason to believe
that this layer would produce a crippling administrative workload, it
isn't obvious what rational basis the TSC would have for deciding to
oppose its creation.

p.





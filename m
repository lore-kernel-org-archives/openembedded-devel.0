Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1K8NPm-0007eR-AV; Tue, 17 Jun 2008 00:43:06 +0200
Received: from [78.54.175.96] (helo=[192.168.1.156])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1K8NQX-0004xZ-WD; Tue, 17 Jun 2008 00:43:54 +0200
Message-ID: <4856EC43.8090007@kernelconcepts.de>
Date: Tue, 17 Jun 2008 00:42:11 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1213345201.13942.3.camel@dax.rpnet.com>	<g2ubb9$a55$1@ger.gmane.org>	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>	<200806132137.51103.zecke@selfish.org>	<87mylpqccr.fsf@neumann.lab.ossystems.com.br>
	<g35sln$rc9$1@ger.gmane.org>
In-Reply-To: <g35sln$rc9$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
Cc: openembedded-devel@openembedded.org
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 16 Jun 2008 22:43:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Rolf Leggewie wrote:
> With the huge number of open bugs and things that need fixing which have
> been untouched for ages, I am not convinced that slowing things down
> even further is a step in the right direction.

thanks! :) I share this opinion. In fact we had a lot of good ideas how to
improve the OE quality, but in my opinion this all is not realistic. Things in
the development branch can break - this is one reason why we have such a branch.
I would not want to trade OE's main advantages (agility, development speed and
the huge contributor community) for a semi-stable development branch.

If we have enough resources some time we could create such a semi-stable
'testing' branch with its own QA and commit policies. But for people with write
access no additional policies or review rules should apply. (Except for some
critical pieces such as classes and libc maybe.)

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76



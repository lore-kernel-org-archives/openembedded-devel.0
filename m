Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1LQM4U-0002XO-Pj
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jan 2009 14:27:42 +0100
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1LQM77-0000eT-2Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jan 2009 14:30:25 +0100
Message-ID: <4979C416.3060401@kernelconcepts.de>
Date: Fri, 23 Jan 2009 14:20:22 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200901230131.09511.mickey@vanille-media.de>
In-Reply-To: <200901230131.09511.mickey@vanille-media.de>
X-Enigmail-Version: 0.95.0
Subject: Re: Bugtracker Status
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
X-List-Received-Date: Fri, 23 Jan 2009 13:27:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

HI,

Michael 'Mickey' Lauer schrieb:
> 2.1.) Removing all autobuilder bugs completely (how can we script that?) and 
> stop autobuilder automatically adding bugs. It was a great idea, but it 
> didn't work out. We do not have enough manpower and it just messes up the 
> bugtracker.

that would be a good idea. Most of these have never been relevant and unless we
have someone who volunteers tracking them down they only mess up the database.
It should be quite easy to get rid of them with a short shell+sql script. The
GPE 'product' and 'version' entries in the bugtracker database are created from
a script as well.

> 2.2.) Remove all software specific bugs that have an upstream and are not 
> distribution-relevant, such as GPE, Opie, Kernel, etc.

Yes, but we should make sure no patches and other important information gets lost.

> 2.3.) Reinstate the monthly bug squashing weekends.

Yes!

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en



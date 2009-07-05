Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1MNYia-00071K-VT
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Jul 2009 22:53:50 +0200
Received: from [92.227.209.84] (helo=[192.168.1.177])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1MNYWd-0007HW-Es
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Jul 2009 22:41:28 +0200
Message-ID: <4A510FDA.7010103@kernelconcepts.de>
Date: Sun, 05 Jul 2009 22:40:58 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <c2a08bbd0907040026s1d7d617fg95537e865b254761@mail.gmail.com>
In-Reply-To: <c2a08bbd0907040026s1d7d617fg95537e865b254761@mail.gmail.com>
X-Enigmail-Version: 0.95.7
Subject: Re: OpenEmbedded goals?
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
X-List-Received-Date: Sun, 05 Jul 2009 20:53:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Mart R. wrote:
> I have been exploring CEngstrC6m and thus OpenEmbedded lately. The
> building process works nicely out of the box, but running it on some
> low end embedded system is out of the question because it is just too
> slow and bloated for my taste. Stripping it down is not an easy job
> either as I would have to edit countless of *.bb files.

you might want to take a look at the "micro" distribution in OE and its
images. The initrd images are another example for tiny images.

> - Out of the box cross-compile environment to whatever system you can
> - imagine,

> - Vanilla *.bb files for distributions to use, so they would not have
> to duplicate all that work that has already been put into creating
> those rules.
> It would also mean scrapping all the distribution configurations out
> of OE, doing away with all non-essential patches from the BitBake
> recipes, etc.

I don't see a reason to do this. OE summarizes a lot of knowledge about how
to (cross-) build whole distributions. Why should we strip away a part of
this?
I see it takes a while to get along with the complexity of OE.... but would
you be happier with less know how and less examples how to do things
correctly?

Greetings

Florian



-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en



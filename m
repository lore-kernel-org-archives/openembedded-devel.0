Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JZ5GS-0002ZU-D1
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 15:15:43 +0100
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JZ5jv-0004RZ-0j
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 15:46:03 +0100
Message-ID: <47D6939A.8000708@kernelconcepts.de>
Date: Tue, 11 Mar 2008 15:13:46 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803110807.11368.zecke@selfish.org>	<200803111126.04715.openembedded@haerwu.biz>	<fr5ntp$n0v$1@ger.gmane.org>	<1205233201.4521.30.camel@dax.rpnet.com>
	<20080311143030.68d6341b@widy.localdomain>
In-Reply-To: <20080311143030.68d6341b@widy.localdomain>
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 14:15:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Paul Sokolovsky schrieb:
> Yeah, I'd say, *every* git user hit your problem before - that
> git is inconsistent, poorly implemented set of hacks. And if they grow
> to love it, why that can't happen to yourself, right?

in this discussion I really miss information and arguments *for* a particular
solution.
I found some input for the decision here:
http://www.selenic.com/pipermail/mercurial/2005-May/000334.html
(quite old, but easy to read)
http://texagon.blogspot.com/2008/02/use-mercurial-you-git.html
http://www.jukie.net/~bart/blog/git-vs-hg

... and some more.

From what I have read so far it looks like we would have a good solution with
both git and hg. The features seem to be more or less the same. The key
advantage of git is that it is more familiar to many developers. The key
advantage of hg would be a much cleaner and well designed user interface which
is more attractive for people who need to get used to it.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76



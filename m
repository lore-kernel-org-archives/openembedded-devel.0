Received: from ausc60pc101.us.dell.com ([143.166.85.206])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sean_Hudson@Dell.com>) id 1OQnCw-0000xJ-9G
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 22:03:03 +0200
X-Loopcount0: from 10.166.62.177
From: <Sean_Hudson@Dell.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Jun 2010 14:57:09 -0500
Thread-Topic: Re: [PATCH] Add a waf bitbake class. (Koen Kooi)
Thread-Index: AcsRe+747soQUyAHTg63rvm9dbNXjQ==
Message-ID: <113134CF306E8E4CACC27BE5937261B2092DE57AC9@AUSX7MCPS303.AMER.DELL.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 21 Jun 2010 19:57:13.0764 (UTC)
	FILETIME=[F153C640:01CB117B]
X-SA-Exim-Connect-IP: 143.166.85.206
X-SA-Exim-Mail-From: Sean_Hudson@Dell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add a waf bitbake class. (Koen Kooi)
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
X-List-Received-Date: Mon, 21 Jun 2010 20:03:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 18-06-10 21:58, Koen Kooi <k.kooi@student.utwente.nl> wrote:
------------------------------
> On 18-06-10 21:58, Sean_Hudson@Dell.com wrote:
> > Hi All,
> >=20
> >   We are using waf for some of our modules and decided to add a class t=
o make it easier to write recipes.
>
> Why is there still a staging method in there? Those have been deprecated
> for months now.

Thanks for taking the time to reply.  To answer your question, the waf clas=
s was cloned from the autotools.bbclass, so the staging stuff came from the=
re.  Is there a better way to handle the staging?

It's a fairly trivial class, but I'm interested to hear if anyone had any a=
dditional thoughts on ways to improve the class?



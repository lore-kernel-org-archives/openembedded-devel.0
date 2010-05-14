Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OCyP5-0002oy-NA
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 19:10:29 +0200
Received: from localhost ([127.0.0.1])
	by astoria.ccjclearline.com with esmtpa (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OCyLI-0002Df-Fm
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 13:06:32 -0400
Received: from 174.113.191.234 ([174.113.191.234]) by crashcourse.ca (Horde
	MIME library) with HTTP; Fri, 14 May 2010 13:06:32 -0400
Message-ID: <20100514130632.b78odmevsc4k4o4s@crashcourse.ca>
Date: Fri, 14 May 2010 13:06:32 -0400
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-devel@lists.openembedded.org
References: <alpine.DEB.2.00.1005141154440.30572@lynx>
	<hsjvm5$m40$1@dough.gmane.org>
In-Reply-To: <hsjvm5$m40$1@dough.gmane.org>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.6)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: current angstrom/beagle breakage: firefox and abiword
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
X-List-Received-Date: Fri, 14 May 2010 17:10:29 -0000
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Quoting Koen Kooi <k.kooi@student.utwente.nl>:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 14-05-10 17:56, Robert P. J. Day wrote:
>>
>>   long story short:
>>
>> ... snip ...
>> ERROR: Task 3295  =20
>> (/home/rpjday/oe/openembedded/recipes/mozilla/firefox_3.6.3.bb,  =20
>> do_install) failed
>> ERROR: Task 3457  =20
>> (/home/rpjday/oe/openembedded/recipes/abiword/abiword_2.8.3.bb,  =20
>> do_install) failed
>> NOTE: Tasks Summary: Attempted 11085 tasks of which 11085 didn't  =20
>> need to be rerun and 2 failed.
>> ERROR:  =20
>> '/home/rpjday/oe/openembedded/recipes/mozilla/firefox_3.6.3.bb'  =20
>> failed
>> ERROR:  =20
>> '/home/rpjday/oe/openembedded/recipes/abiword/abiword_2.8.3.bb'  =20
>> failed
>>
>>   i can post log file contents but, if experience is any guide, by the
>> time i notice build breakage, someone else is already testing a fix.
>
> Reading and applying http://catb.org/~esr/faqs/smart-questions.html
> would help you a lot. My crystal ball is still in repairs.

   point taken.  soon as i get a chance, i'll make sure my working copy
is up to date, do another build and post results.

rday




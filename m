Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S88Yq-0001J1-SE
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 12:09:37 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C4B20F8124A; Thu, 15 Mar 2012 05:00:51 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8F68DF81249;
	Thu, 15 Mar 2012 05:00:50 -0600 (MDT)
Message-ID: <4F61CBE2.1040508@mlbassoc.com>
Date: Thu, 15 Mar 2012 05:00:50 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1331754944.git.Martin.Jansa@gmail.com>
	<7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
	<4F61C710.3030901@mlbassoc.com> <20120315114858.46433c87@eb-e6520>
In-Reply-To: <20120315114858.46433c87@eb-e6520>
Subject: Re: [meta-oe][meta-efl][PATCH 1/5] midori: upgrade to 0.4.4
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
X-List-Received-Date: Thu, 15 Mar 2012 11:09:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012-03-15 04:48, Eric B=E9nard wrote:
> Le Thu, 15 Mar 2012 04:40:16 -0600,
> Gary Thomas<gary@mlbassoc.com>  a =E9crit :
>
>> On 2012-03-14 13:59, Martin Jansa wrote:
>>> * custom waf to fix dirty vala version was dropped
>>> * I've fixed our vala to stop reporting dirty even for valid released=
 tarballs
>>>     so you can still get dirty version but it's not so common to keep=
 this ugly binary here.
>>> * disable PARALLEL_MAKE to improve our chances agains build hangs
>>>     (btw fedora is doing the same
>>>      http://osdir.com/ml/scm-fedora-commits/2011-11/msg04672.html)
>>>
>>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>>
>> I have a few questions about midori that I'm having trouble with.
>> * Where does this come from?  Is there a project web page?  There's
>>     no real indication in the recipes that I can find.
> http://en.wikipedia.org/wiki/Midori_(web_browser)
> http://www.twotoasts.de/index.php?/pages/midori_summary.html
>
>> * Who/where can I go to with problems and/or questions?  The version
>>     I've been using (0.4.3) isn't very stable and has some "interestin=
g"
>>     behaviours I'd like to have addressed.
>>
> on their page they say :
> Join #midori on Freenode to talk about Midori, discuss bugs and new
> ideas.
>
> Report bugs at the Launchpad Bug Tracker. See also the old Flyspray Bug
> Tracker.
> https://bugs.launchpad.net/midori

Thanks, these pointers helped.  Perhaps they should be mentioned in the r=
ecipes?

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------



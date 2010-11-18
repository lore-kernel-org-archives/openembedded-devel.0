Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1PJ89N-0003jr-6C
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 18:19:58 +0100
Received: (qmail 4110 invoked by uid 1003); 18 Nov 2010 17:18:47 -0000
Received: from adsl-75-37-22-143.dsl.pltn13.sbcglobal.net (HELO
	?192.168.1.148?) (philip@opensdr.com@75.37.22.143)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	18 Nov 2010 17:18:47 -0000
Message-ID: <4CE55FF6.5030900@balister.org>
Date: Thu, 18 Nov 2010 09:18:46 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Fedora/3.1.6-1.fc13 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>	<ic06a8$uft$1@dough.gmane.org>
	<4CE3A6DE.2070203@xora.org.uk>	<ic0aj2$hqc$1@dough.gmane.org>	<AANLkTimdqZ1hdZNPN70LXd1WuJSn4pU2y=2C5tZs0-LT@mail.gmail.com>	<1290074903.3183.202.camel@mill.internal.reciva.com>	<AANLkTimnEoW_9i8T65WTsQsYXc2E2gcx+015o13cVsKF@mail.gmail.com>
	<1290079874.3183.222.camel@mill.internal.reciva.com>
In-Reply-To: <1290079874.3183.222.camel@mill.internal.reciva.com>
X-SA-Exim-Connect-IP: 216.168.135.166
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Thu, 18 Nov 2010 17:19:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2010 03:31 AM, Phil Blundell wrote:
> On Thu, 2010-11-18 at 21:31 +1030, Graham Gower wrote:
>> So, why not just branch it already and apply the same commit policy as
>> the existing stable branch.
>
> Essentially because nobody has yet volunteered to do the ongoing
> maintenance work that would be involved in having a long-lived stable
> branch.  And, if OE is going to have releases off master on a fairly
> frequent schedule (I think the proposal is four releases per year or
> thereabouts) then the requirement for such a branch is somewhat
> diminished.
>
> If you're interested in doing the work to maintain a new stable branch
> along the same lines as stable/2009, and you can commit the time that is
> required to make it work, then you are certainly very welcome to do so.
> You don't need any particular permission to do this: you can (subject to
> the Branching Policy) create a new branch at any time.

I'd like to emphasize this point, the tag is a sane place for people to 
start from. The OE project deliver meta-data for people to build 
products on. It is the responsibility of the people delivering 
images/packages to people to manage their own branches for maintenance.

We certainly encourage groups of people to collaborate with each other 
to maintain branches, but I don't see a one policy suits all branch.

One man's stable is anothers stagnant.

Philip



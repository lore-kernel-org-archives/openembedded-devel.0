Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1PJUsd-0003Y0-Ed
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 18:36:14 +0100
Received: (qmail 6834 invoked by uid 1003); 19 Nov 2010 17:34:50 -0000
Received: from adsl-75-37-22-143.dsl.pltn13.sbcglobal.net (HELO
	?192.168.1.148?) (philip@opensdr.com@75.37.22.143)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	19 Nov 2010 17:34:50 -0000
Message-ID: <4CE6B538.6050801@balister.org>
Date: Fri, 19 Nov 2010 09:34:48 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Fedora/3.1.6-1.fc13 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinVj9oh0p9xp9ZUtBijB63Fy7O8LcXc5-tUF9v6@mail.gmail.com>	<ic5jrc$ksc$1@dough.gmane.org>
	<4CE67FA1.6020901@mentor.com>	<ic60r2$hrs$1@dough.gmane.org>
	<20101119144425.GC3411@jama>
In-Reply-To: <20101119144425.GC3411@jama>
X-SA-Exim-Connect-IP: 216.168.135.166
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010.12 branch ready for testing
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
X-List-Received-Date: Fri, 19 Nov 2010 17:36:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/2010 06:44 AM, Martin Jansa wrote:
....


> I think that short-lived branch is better, because every testing branch
> had few easy-to-fix issues which were fixed almost immediately in .dev
> after testing branched and it would be hard to choose which branch was best.
>
> But tag from any testing branch + first few quick fixes would be almost as
> good as based on any other testing branch.
>
> And I also agree with Phil that this short lived branch should be
> removed when the tag is created (to show that it's final state without
> maintainance).

I also think a *short lived* branch is a good route to try. I've been 
thinking about how the git history looks of a tag after you delete the 
branch leading up to it.

For emphasis, the short lived branch will not be used to maintain the tag.

Philip



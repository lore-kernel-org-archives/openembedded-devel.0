Received: from smtpauth17.prod.mesa1.secureserver.net ([64.202.165.29])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Po1SO-0004Rb-MR
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 23:27:17 +0100
Received: (qmail 22429 invoked from network); 11 Feb 2011 21:39:00 -0000
Received: from unknown (209.242.7.132)
	by smtpauth17.prod.mesa1.secureserver.net (64.202.165.29) with ESMTP;
	11 Feb 2011 21:39:00 -0000
Message-ID: <4D55B139.4020503@mwester.net>
Date: Fri, 11 Feb 2011 15:59:21 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTik+8d-hWG+ndtvSP7cKbbHhfyXq3tLxw1Fyi-=6@mail.gmail.com>	<1297447579-5311-1-git-send-email-filip.zyzniewski@gmail.com>	<4D557DED.5070606@mentor.com>
	<AANLkTinpBmx9F9ftYrkC2t6GUEKN8_MVXM2aa=Mn=3eo@mail.gmail.com>
In-Reply-To: <AANLkTinpBmx9F9ftYrkC2t6GUEKN8_MVXM2aa=Mn=3eo@mail.gmail.com>
Subject: Re: [PATCH] initscripts: handle busybox version of makedevs properly.
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
X-List-Received-Date: Fri, 11 Feb 2011 22:27:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2/11/2011 3:10 PM, Filip Zyzniewski wrote:
> On 2/11/11, Tom Rini <tom_rini@mentor.com> wrote:
> 
>> Is there a syntax that works for both?
> 
> I've looked at the source code of both versions and there is no
> compatible syntax.

Hmmm... perhaps this means that the more correct fix would be to create
a patch for busybox that would bring it into line with the syntax of the
real application?

-Mike (mwester)



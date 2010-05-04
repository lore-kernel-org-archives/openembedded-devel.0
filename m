Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1O9OXP-0007K6-5X
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 22:16:18 +0200
Received: (qmail 25583 invoked by uid 1003); 4 May 2010 20:12:26 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 4 May 2010 20:12:26 -0000
Message-ID: <4BE07FA7.6060206@balister.org>
Date: Tue, 04 May 2010 16:12:23 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <z2od1ded4381005041245j8e67e6e9z8790de994abb4e2c@mail.gmail.com>
In-Reply-To: <z2od1ded4381005041245j8e67e6e9z8790de994abb4e2c@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: GSoC participation
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
X-List-Received-Date: Tue, 04 May 2010 20:16:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2010 03:45 PM, Adrian Alonso wrote:
> Hi All,
>
> Via the Linux Foundation and Grant L. mentoring help, I will be working on
> OE to
> improve xilinx platforms support and adding Microblaze arch support;

I have an ml403 here I can test stuff on. I don't have access to the EDK 
though :(

This looks like a really good project! Thanks for doing this work.

Philip

>
> Our Gsoc work aims tree areas
> 1. Support most xilinx target platforms
> 2. Add microblaze arch support
> 3. Improve software/hardware co-design work flow
>
> Over the lasts moths I've been working on xilinx ml507 board support
> to the point that been able to run xfce46 in this platform, some patches
> are still queued in oe mailing list,  and we want to extend this
> improvements
> to other xilinx boards. Some descriptions of my work can be found at my blog
> [1].
>
> I already start with microblaze support [2], an encounter that I will
> be fighting
> with autotools hell this summer :); Running `bitbake task-base` it reachs
> the point
> to start cross-compiling and it fails due that config scripts don't have
> target
> definitions for microblaze, see error log at [3];forgive my autotools lack
> of expertise
> but where do I need to look to add target information for microblaze.
>
> Thanks in advance for your help.
>
> [1] http://aalonso.wordpress.com
> [2] http://www.gitorious.org/oe-microblaze
> [3] http://pastebin.com/DpZFsCgb
>



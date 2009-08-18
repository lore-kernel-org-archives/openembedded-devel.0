Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MdMNG-0003Kp-M5 for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 12:57:06 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MdM6k-0006uf-ED
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 12:40:02 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 12:40:02 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 12:40:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 18 Aug 2009 12:35:57 +0200
Message-ID: <h6e06e$h0m$2@ger.gmane.org>
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>	<1250515743-10823-2-git-send-email-msmith@cbnco.com>	<200908171611.08535.holger+oe@freyther.de>
	<be7a9f3d0908180202t125e5c21tf77ed80c0ab07d22@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <be7a9f3d0908180202t125e5c21tf77ed80c0ab07d22@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 2/3] mtools: don't install-info; fixes build on non-Debian hosts
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
X-List-Received-Date: Tue, 18 Aug 2009 10:57:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-08-09 11:02, Otavio Salvador wrote:
> Hello Holger,
>
> On Mon, Aug 17, 2009 at 11:11 AM, Holger Hans Peter
> Freyther<holger+oe@freyther.de>  wrote:
>> again, no need to bump the PR.
>
> I completely disagree with changes landing without PR bump.
>
> Not bumping them can cause a change, that breaks something, to not be
> noticed for long time.
>
> In my opinion we ought to _always_ bump PR when changing the recipe.
> This ensure it is widely tested and deployed.

It also makes it easier to spot patterns in tinderbox.

regards,

Koen





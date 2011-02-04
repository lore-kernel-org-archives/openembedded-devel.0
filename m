Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PlN9Y-0006PY-NH
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 16:00:52 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PlN8c-0000dM-MZ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 06:59:54 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 4 Feb 2011 06:59:54 -0800
Received: from [172.30.80.88] ([172.30.80.88]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 4 Feb 2011 07:59:53 -0700
Message-ID: <4D4C1464.4030609@mentor.com>
Date: Fri, 04 Feb 2011 07:59:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201101271038.18945.ml@vdm-design.de>	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>	<4D418914.2030703@mentor.com>
	<20110203070901.GA11867@denix.org>	<4D4AE93E.2020509@mentor.com>
	<20110203222035.GA19477@denix.org>	<4D4B35A7.4040000@mentor.com>	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>	<20110204081659.GQ4580@excalibur.local>	<AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>	<20110204090348.GR4580@excalibur.local>
	<AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
In-Reply-To: <AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
X-OriginalArrivalTime: 04 Feb 2011 14:59:53.0795 (UTC)
	FILETIME=[2E0F8930:01CBC47C]
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Fri, 04 Feb 2011 15:00:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2011 02:57 AM, Frans Meulenbroeks wrote:

> What I see is a lack of interest in fixing the existing QA errors.
> I've sent out a few error reports to the list a while ago, (on recipes
> that I feel not comfortable with), but unfortunately that did not
> result in any action :-(

I want to address this by itself for a moment.

Do you have time to grow your comfort level?  Did you find the (nominal) 
maintainer unresponsive?  If we want to star making more things fatal we 
need a few more of the people that are willing to go off and work on 
everything.  The top-of-my-head count is 5 people and we've all always 
got a lot on our plates.

I'll admit it looks daunting when you start at it, but it's just 
software and at worst it'll just not build on your machine for a while :)

-- 
Tom Rini
Mentor Graphics Corporation



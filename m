Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <s_buschmann@gmx.de>) id 1LnhyE-0000uC-RQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Mar 2009 00:29:47 +0100
Received: (qmail invoked by alias); 28 Mar 2009 23:27:49 -0000
Received: from p5481C8BA.dip.t-dialin.net (EHLO [192.168.2.107])
	[84.129.200.186]
	by mail.gmx.net (mp028) with SMTP; 29 Mar 2009 00:27:49 +0100
X-Authenticated: #1404922
X-Provags-ID: V01U2FsdGVkX19XHPQtmEBXRIm9QyJYuATanU9DjtNL1qmfA9KEJQ
	G13TbQ1Jt962+h
Message-ID: <49CEB274.9010001@gmx.de>
Date: Sun, 29 Mar 2009 00:27:48 +0100
From: Stefan Buschmann <s_buschmann@gmx.de>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49C94FFC.1040604@gmx.de> <1237932496.16710.22.camel@alap>
	<b84dee3a0903281042m552e0b32j9a196b96a95b769c@mail.gmail.com>
In-Reply-To: <b84dee3a0903281042m552e0b32j9a196b96a95b769c@mail.gmail.com>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.76
Subject: Re: python-ecore_svn fails
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
X-List-Received-Date: Sat, 28 Mar 2009 23:29:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Rafael Campos schrieb:
> If you apply the following patch (update the EFL requiered verson) it
> solves the problem.
>   
That did it :-) Now I was finally able to build the image again.

Thanks!

Stefan




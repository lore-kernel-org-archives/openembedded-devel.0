Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1Jmdwl-0006iK-3h
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Apr 2008 01:55:19 +0200
Received: (qmail invoked by alias); 17 Apr 2008 23:55:15 -0000
Received: from BAA3efd.baa.pppool.de (EHLO [192.168.178.31]) [77.128.62.253]
	by mail.gmx.net (mp044) with SMTP; 18 Apr 2008 01:55:15 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX1/rHmJD3qDr5pa9PvYgMB12lU8ZYwxde1bPwuhDz8
	+YmoPTCVcawyOb
Message-ID: <4807E363.9080107@gmx.de>
Date: Fri, 18 Apr 2008 01:55:15 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.12 (X11/20080405)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1208473504.21779.3.camel@isis>
In-Reply-To: <1208473504.21779.3.camel@isis>
X-Y-GMX-Trusted: 0
Subject: Re: patch base-files /etc/profile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Apr 2008 23:55:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> Hi 
>
> I was seeing that on Angstrom.2008 I was not getting TSLIB_TSDEVICE
> environment variable set though it should be as it was
> invoking /etc/profile.d/tslib.sh in /etc/profile. However the 'ls'
> command in there was not really working well.
>
> This patch fixes the problem. Now I see TALIB_TSDEVICE variable set
> everytime.
>
> OK for .dev ?
>
> Thanks
>
> -Khem
>   
+1 from me.




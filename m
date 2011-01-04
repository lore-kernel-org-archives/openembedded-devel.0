Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1PaEcP-000213-Ch
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 22:40:37 +0100
Received: by qwg5 with SMTP id 5so14422376qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 13:40:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.213.202 with SMTP id gx10mr19035620qcb.96.1294177213912;
	Tue, 04 Jan 2011 13:40:13 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.29.2 with HTTP; Tue, 4 Jan 2011 13:40:13 -0800 (PST)
X-Originating-IP: [95.29.187.49]
In-Reply-To: <1293905677.17519.16909.camel@rex>
References: <1293905677.17519.16909.camel@rex>
Date: Wed, 5 Jan 2011 00:40:13 +0300
X-Google-Sender-Auth: o-jRoo5isQYj8WBlGUw3CAJZfOs
Message-ID: <AANLkTinpcYFR8JaDHMtUcKW2YoaH6fG_+4An+Aq3mMoA@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake task logging
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
X-List-Received-Date: Tue, 04 Jan 2011 21:40:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/1 Richard Purdie <richard.purdie@linuxfoundation.org>:
> I've been looking at the changes in bitbake master and those in Poky.
> Both are trying to improve the logging situation but I think we need to
> discuss/agree what we're trying to achieve.

[skip]

> Thoughts/Comments/Suggestions?

I'm interested in build perfomance monitoring/analyze. It would be
great to have some tool (may be like bootchart) to be able to look at
CPU time/RAM/Disk bandwidth/network traffic per task.

IMHO, easy way to have this is making log messages format configurable
with some bitbake variable.

-- 
Yury Bushmelev



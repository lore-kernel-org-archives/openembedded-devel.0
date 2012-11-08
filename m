Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TWbJq-0002Pc-CN
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Nov 2012 00:15:30 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1268080dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2012 15:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=K4rp6Lr3YK+0NMBL/uMZ+yhooGDAJILP88uWOjWPmA0=;
	b=w1+t8U+DsC6OyqT5uMlokRef6Lc7pDjmB5oK49LBlxAkc0yc8qUTpmiLQmFkiF9ja5
	s9z0paXRyLBq27LzbZNpmvJ69fVucmXE5MkYF87S+JdnBGHRbbfjCkg8YCSPpQAHRazS
	MKB1Rp3iNoDw4WJxY7HcnYK2xPjceJCYCaqlEhy2uVkcCkO7PzWHZjkfwVY4XLG8Mgr6
	nqureoBX5QPdh1TXeR8J6qVEqEcSJ2ZUlEfsynPYXEQBWfuaDgm6tbReZjm+AyF4Oa4D
	rLKcqtrZDdTdXvQVL55dRqLQAhyLeJcgR38nQd5eyyMhppsiGWSyAtjYhRl95OIu+805
	+lXw==
MIME-Version: 1.0
Received: by 10.68.254.10 with SMTP id ae10mr21915949pbd.126.1352415701554;
	Thu, 08 Nov 2012 15:01:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 8 Nov 2012 15:01:41 -0800 (PST)
In-Reply-To: <1352346399-25856-1-git-send-email-jkridner@beagleboard.org>
References: <1352346399-25856-1-git-send-email-jkridner@beagleboard.org>
Date: Thu, 8 Nov 2012 21:01:41 -0200
X-Google-Sender-Auth: 3-MPdODOyeodPrjjR7nD1_bHefM
Message-ID: <CAP9ODKqdSEi=PvvujdnUPPe76w8bZccchcvG7nNDnfHWPSUszQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] nodejs: add 0.8.14
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
X-List-Received-Date: Thu, 08 Nov 2012 23:15:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 8, 2012 at 1:46 AM, Jason Kridner <jkridner@beagleboard.org>wrote:

>  .../nodejs/0001-Fix-hardfloat-detection.patch      |   44
> ++++++++++++++++++++
>

The v8 upstream has fixed it different, please check
https://code.google.com/p/v8/source/detail?r=11951

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


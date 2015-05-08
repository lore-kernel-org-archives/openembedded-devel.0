Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 15F8A60034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 11:16:38 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so77747434pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2015 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=4/4J6nh1IOHZ+74I3ua97hwUgYcrgPabX1Hrmtch5P4=;
	b=Kpf6AypsjoXg13oBm5zvbCs3qpGn3tUrSCl79seZmu8kk/x4a7t9xrkgt/AR1IGm0/
	38txR/ocNlZOce+n64+KjtS5RUAZuB5fnhX/sYukQpHMU+tSqkFceJLMQqP5Z6UnGR/w
	wlQChPjparj34zjf8zSr5b+Y92OzG8x2IeHed4MIEL+jksRVPFK5lhFrn8o2vfV6fOvd
	Ns/00tqzMzgW263bSN2Ud3FuXAYmhbVkbtufij/mFk1ny+pvafoaS1f/1oZk1qzrOUGG
	gF28e54rdNfaUrXInNTTeKKTsI1HAnDOGUIYrZY8A7i/af2FkzIHr9JnfI/3PfehrREo
	Tz7A==
MIME-Version: 1.0
X-Received: by 10.70.100.168 with SMTP id ez8mr5572048pdb.129.1431083781572;
	Fri, 08 May 2015 04:16:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Fri, 8 May 2015 04:16:21 -0700 (PDT)
In-Reply-To: <9E717424-BA4E-4597-A8A6-DFB38A731D3F@gmail.com>
References: <1430382588-11298-1-git-send-email-b40290@freescale.com>
	<9E717424-BA4E-4597-A8A6-DFB38A731D3F@gmail.com>
Date: Fri, 8 May 2015 08:16:21 -0300
X-Google-Sender-Auth: U6DFSPy5SwmFp3cNX2owT2tAmP4
Message-ID: <CAP9ODKqchp-HwsM7QrrKo2jLJwM_RX_8TJ4qy2=U0PKoXQGzGQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] firefox_10.0.11esr: ${PN} usage in SRC_URI Should use ${BPN} instead to avoid breaking multilib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 May 2015 11:16:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 7, 2015 at 11:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Apr 30, 2015, at 1:29 AM, B40290@freescale.com wrote:
>>
>> From: Chunrong Guo <B40290@freescale.com>
>>
>>    fix the following warning:
>>    |WARNING: Unable to get checksum for lib32-firefox SRC_URI entry mozilla-lib32-firefox.png: file could not be found
>>    |WARNING: Unable to get checksum for lib32-firefox SRC_URI entry mozilla-lib32-firefox.desktop: file could not be found
>>
>
> Looks good to me.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


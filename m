Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1S9etK-00016g-7j
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 16:53:02 +0100
Received: by vcbfl13 with SMTP id fl13so7229541vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iy8L3YlMbFIvwCN52AwNCv9j0oLIoYc9H3MGxEzP95U=;
	b=KDsWGUlnv2YDkN3npvRrr3h8xISZwb6DvrL8/vCogwHaesHOOPDC8dshCDA2BHzWew
	aofyBJM2S7YUsExp2WOVMUukBfRoXnFTzwQXmxPk8fiol8JAfJ1HddmY/fPbc+2T2T1o
	638MOnyF62eiPJLzMpFWkpAJf2xKL8TTSCQYw9R77jF0/raQ9ziiRs3OaNqzEHTLxeX1
	5gWu1gIB67TM3RD7dDq1PJS9mkUtJhGs+BCTa8+2CFfhg1rs/0Hqw1bR9Oj8EdlxVH97
	xqxxxGsr2KtwEbowKMEDaiGmDCErj4K2r0wpx/J4W3WSMwEetyvw79DWRhEVqDxg/35i
	4uUA==
MIME-Version: 1.0
Received: by 10.52.179.74 with SMTP id de10mr5500325vdc.12.1332171850382; Mon,
	19 Mar 2012 08:44:10 -0700 (PDT)
Received: by 10.52.30.98 with HTTP; Mon, 19 Mar 2012 08:44:10 -0700 (PDT)
In-Reply-To: <CA+M6bXmpiegfSspYOwybxKSLf4Ukg5tjRL4VR1aq8T4EFyaaRg@mail.gmail.com>
References: <4F61C54B.1000609@dresearch-fe.de>
	<4F66E4F2.2000909@dresearch-fe.de>
	<CA+M6bXmpiegfSspYOwybxKSLf4Ukg5tjRL4VR1aq8T4EFyaaRg@mail.gmail.com>
Date: Mon, 19 Mar 2012 16:44:10 +0100
Message-ID: <CACW_hTbMZ5R6VB_BChH+3rxx-tqV3jqxioX8Q5ZWsoiHJWZ=7w@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: libmatthew-java-0.7.1.tar.gz not fetchable
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
X-List-Received-Date: Mon, 19 Mar 2012 15:53:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/3/19 Tom Rini <tom.rini@gmail.com>:
> On Mon, Mar 19, 2012 at 12:49 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> On 15.03.2012 11:32, Steffen Sledz wrote:
>>> libmatthew-java-0.7.1.tar.gz (used in 2011.03-maintenance branch) is no longer fetchable from it's original location (the maintainer provides the latests version only). And i did not found another reliable source.
>>>
>>> Can someone put the tarball into the OE and/or Angstrom mirrors?
>>
>> Ping!
>
> If someone points Khem at a copy, this can happen...
>
> --
google is your friend

http://pkgs.fedoraproject.org/repo/pkgs/libmatthew-java/libmatthew-java-0.7.1.tar.gz/6a4db221129f230c64a0f937d00bb703/libmatthew-java-0.7.1.tar.gz

It might be useful to update the recipe itself as well.
Furthermore we might consider running a fetchall and put all fetched
on the mirror.

Frans.



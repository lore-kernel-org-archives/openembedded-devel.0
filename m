Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S9eUg-00088h-Mr
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 16:27:34 +0100
Received: by dado14 with SMTP id o14so10385378dad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 08:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YYFsWY3t1QY0gTLvDIwuCoPo/AoolCHfnqq2WsWDNC0=;
	b=sg6g/z638ni5IE6oepyez0C4XRAxSfPg2NrN9Y3JJ/W3h/Ak/DMFI9yROz7DmW6fow
	gnXsm4vaxZjNSUKkdhyND0xB3kvTvyCwCQeuQTy3jEBO6iQXeS/mmuRXOfnr/35KdOnb
	zW0rgcqZKfZR8deoz/aWFhLpEJp4Sc3i7jpHKE+LsIVheaH2TEwH+XyLuJnD7GEK5iGt
	kVkF3lS4OqPfUVqj/NXPn0FX8/zZw0nCRVSH3lLLnkj2gMKGFmtzqXD5kAeM0Vta7G6I
	1RFoFW32pIFWbVWMfDJCNK4iQe7Vnf1lVJ1ovtA4ZnjgdcYvwhp6CkJpDhGjMEVi7R0r
	ohZQ==
MIME-Version: 1.0
Received: by 10.68.217.97 with SMTP id ox1mr40533388pbc.81.1332170322363; Mon,
	19 Mar 2012 08:18:42 -0700 (PDT)
Received: by 10.142.241.4 with HTTP; Mon, 19 Mar 2012 08:18:42 -0700 (PDT)
In-Reply-To: <4F66E4F2.2000909@dresearch-fe.de>
References: <4F61C54B.1000609@dresearch-fe.de>
	<4F66E4F2.2000909@dresearch-fe.de>
Date: Mon, 19 Mar 2012 08:18:42 -0700
Message-ID: <CA+M6bXmpiegfSspYOwybxKSLf4Ukg5tjRL4VR1aq8T4EFyaaRg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 19 Mar 2012 15:27:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 19, 2012 at 12:49 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> On 15.03.2012 11:32, Steffen Sledz wrote:
>> libmatthew-java-0.7.1.tar.gz (used in 2011.03-maintenance branch) is no longer fetchable from it's original location (the maintainer provides the latests version only). And i did not found another reliable source.
>>
>> Can someone put the tarball into the OE and/or Angstrom mirrors?
>
> Ping!

If someone points Khem at a copy, this can happen...

-- 
Tom



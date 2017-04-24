Return-Path: <jaap.dejong@nedap.com>
Received: from smtp4.nedap.com (smtp4.nedap.com [213.160.213.85])
	by mail.openembedded.org (Postfix) with ESMTP id 7B9B271E02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 06:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nedap.com; i=@nedap.com; q=dns/txt; s=20161201;
	t=1493015222; x=1524551222;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=Y29zdo1t2B6BpjtUf5CaU8mUg+GRhVp79MOyvqggPj0=;
	b=xkuEd1DIxVFqtPg4qtGVwreGb2fUCgzY0tUSxC/YJnOY2ve6sNQDx9dX
	hM/jyM4LxQfPg9HDcXuCjV81t1P1ICSJXYj0pAPXBuN0IBF2JPT3RLLqG
	5CrI7A4sEs4zPRPmj8OkcivmkNsSHzO1ESeNHxyp4zhXZLchO7IeK0tFE I=;
Received: from nvc2354.nedap.local (HELO [10.2.16.82]) ([10.2.16.82])
	by smtp4.nedap.com with ESMTP; 24 Apr 2017 08:26:59 +0200
To: openembedded-devel@lists.openembedded.org
References: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
From: Jaap de Jong <jaap.dejong@nedap.com>
Message-ID: <f01c0caa-fd9d-b329-9886-61d90d4b7a17@nedap.com>
Date: Mon, 24 Apr 2017 08:26:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
Subject: Re: State of Java on OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Apr 2017 06:27:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 22-04-17 00:25, Steven Osborn wrote:
> Is anyone using Java on OE devices right now?
Yes!
> meta-oracle-java has a Morty branch, but the URI for the binaries is
> bad so it fails to install.
We are using oracle for several years now. And yes, we pay for it.
This URI is not bad, you need an account for some of the binaries.



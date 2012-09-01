Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T7jA1-0002r1-Lc
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Sep 2012 10:34:33 +0200
Received: from localhost ([127.0.0.1]:49827 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T7iy8-0005cP-9J
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Sep 2012 08:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=7aFizxQCiobPNf4FhK6Bqrcvnv0=; b=D6s8Jj9IN557JwklKreEqoXjgYQR
	e2wJjiYLadUAOv78Xd98SVnNT52KcxSC4JgtFlp6J4r24DgvwRrdmTvKe0p6zU/J
	GzawEutLZ4DdRvO4Ld3T2tj/M6oAbZB7+627zC1uljGxQzvqOEfegeqUS76aqy9L
	DTfaSqT+cqxs0pQ=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:50877 helo=[192.168.1.113])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1T7iy8-0005cM-73 for openembedded-devel@lists.openembedded.org;
	Sat, 01 Sep 2012 08:22:16 +0000
Message-ID: <5041C5B6.7050904@communistcode.co.uk>
Date: Sat, 01 Sep 2012 09:22:14 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <504131A2.4010004@communistcode.co.uk> <k1savh$7ds$1@ger.gmane.org>
In-Reply-To: <k1savh$7ds$1@ger.gmane.org>
Subject: Re: WebOS OpenEmbedded Layers
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
X-List-Received-Date: Sat, 01 Sep 2012 08:34:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2012 07:46, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 31-08-12 23:50, Jack Mitchell schreef:
>> Well, it's been a long time coming and I'm sure most of you have heard
>> about this already - but I thought I would drop it in for those who have
>> missed the news.
>>
>> https://github.com/openwebos/build-webos
>>
>> I haven't had time to pick through it properly yet but hopefully there
>> might be some interesting ideas we could use/upstream.
>
> Yeah, the idea of combining a BSP layer, a DISTRO layer and a regular layer
> into one layer is a great idea. Oh wait, it's not.

Yes, the layer structure is poor, but I wouldn't expect anything more 
from a company like this. What I was pertaining too is possible recipes, 
classes and implementation ideas.

A point of interest rather than OMG wEbOs FTW, quick lets copy their 
exact structure!!!111!!1



Return-Path: <max.oss.09@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 57BC4724DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 18:28:39 +0000 (UTC)
Received: by qgh3 with SMTP id 3so76618782qgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2015 11:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7lO0qfTRfeJWLeuUHZSj66sVAi1RiEICnTat1MdKz9s=;
	b=jGp93+I9xhlg0sGGpby+DyhkA55PJHYAg0d8KLz7rPuX8cMZ5q7/aBN3BkZTOUdmJL
	i+9VE1j9EkuEC8iu72BxqXmh6pxbr/ZXKVn9rUYFycGOT7woCDSc/vhuSB+10zm7q/SX
	+ZyCOyounTwkKTRey8ghn9sOILHgVx8Mltiez5s+bP6YAJPXYajE6DcGbAXfugq0ISTf
	bpIZb+UrF8vyzIUKRT/batTpBLs5/korttsfkXgr7HRY4vM+jandKu2Fp2vI80fdpMGk
	YaEQ1o46d3dknigq8lD1gRZB4htjwOMDQ8k2A5geqqQkTllOKWTPhOj6nXFG+YArUCRu
	YH9w==
MIME-Version: 1.0
X-Received: by 10.55.25.228 with SMTP id 97mr3980985qkz.105.1427999320611;
	Thu, 02 Apr 2015 11:28:40 -0700 (PDT)
Received: by 10.140.82.72 with HTTP; Thu, 2 Apr 2015 11:28:40 -0700 (PDT)
In-Reply-To: <551C4F35.7020001@gmail.com>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
	<551C4F35.7020001@gmail.com>
Date: Thu, 2 Apr 2015 20:28:40 +0200
Message-ID: <CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
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
X-List-Received-Date: Thu, 02 Apr 2015 18:28:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Sven

To be honest I don't know.
I remembered that pull request when I saw your question, however I did
not build nor test the updated OpenJDK.

Regards
Max

2015-04-01 22:04 GMT+02:00 Sven Ebenfeld <sven.ebenfeld@gmail.com>:
> Hi Max,
>
> Am 01.04.2015 um 19:17 schrieb Max Krummenacher:
>> Hi Sven
>>
>> Maybe this pull request to the old meta-java repo location contains
>> already contains some of the stuff you need.
>> https://github.com/woglinde/meta-java/pull/62
>
> Thanks, I will have a look at this.
> Did you have the same problem with rmic as well?
>
>>
>> Regards
>> Max
>>
> Cheers,
> Sven
>


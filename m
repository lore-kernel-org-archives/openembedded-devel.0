Received: from [209.85.218.213] (helo=mail-bw0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LZ57O-0000KS-3D
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 16:10:46 +0100
Received: by bwz9 with SMTP id 9so2921792bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 07:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XIb/IuZa3hSvSXW8OyBYdHFM8Yb+yZUPJfwXXtF0FRc=;
	b=CX69XIFmmFp5b92hW7kpUn6iE3j0+CB9WaymDTk95E6Y20eD8guUv+ZsMBVoztrGUX
	6te5Vqoe3gl40sA6Pt21wub8NbzgQ+uAedWJZNglsc/7rkILyKLXrzl+6WrTMR9HkS93
	4YBJij16qJUJ4w7lxz4ctgGs/2K0oOBfN1qgE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VjYAf3+tJZG/PCuwE5NCaWHQHfKrq7eJ80rv8HdX2I7LEphrgTw/jUwWdfpr48bH+R
	oNtNbqqNlxyqOb2YWPVaSQAZpmb0MiSgTLxP7RTmclgeiW7M9oU8RIJRieEqg1XrH4uz
	zYwWAdwVep+dqsZBWOOyhNSaZYFuNQIu06jsU=
MIME-Version: 1.0
Received: by 10.181.28.15 with SMTP id f15mr996875bkj.75.1234796932151; Mon, 
	16 Feb 2009 07:08:52 -0800 (PST)
In-Reply-To: <gnbu9r$hm0$1@ger.gmane.org>
References: <1234793734.5643.1.camel@EPBYMINW0568> <gnbu9r$hm0$1@ger.gmane.org>
Date: Mon, 16 Feb 2009 17:08:52 +0200
Message-ID: <fce2a370902160708qc60d0afl96066a0fb4402c39@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] neon: bump version to 0.28.3
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
X-List-Received-Date: Mon, 16 Feb 2009 15:10:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, Feb 16, 2009 at 4:47 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 16-02-09 15:15, Ihar Hrachyshka wrote:
>>
>> Seems that current neon versions doesn't work with gnutls 2.x
>>
>
>> +PR = "r2"
>
> remove that line.

I already resent new version of the patch..

>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



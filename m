Received: from [209.85.220.17] (helo=mail-fx0-f17.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LXuBa-0001QD-Cv
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 10:18:14 +0100
Received: by fxm10 with SMTP id 10so2042040fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 01:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6LyseWqvMo1MCYN0Sgt+DKqQpWA5Yo9sU5K5zjLm2eQ=;
	b=CDgqx9RttPsz4VIBane3qSJlvSz1DkGoLpwKHvBdJmhJn6MwMbVL3uzWXC2TW191hy
	DSQrhua5xo7QHMEdciKBhpUfvVETwNS3RzUbp9Gv2EFuRmlIKYQAbOdMp2cxT1AiMD2o
	fSYObXUgsloaF737nY6KrXdt2OlCSMj/iCrxY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=p8E/IKHSID58ML2/Z88QlK3xdnoyGFmeTrlS3pld7dgYzsG+DFutLsONWOEamlh1ji
	XHA/DOph/OotgFQOJku1ibVcV5iUdSIW9Sl4C7tMFaxb6k6cOM2rqePLje8jOwQVH3mm
	CwtCQPe/Yk8zjsPmLKkovukZPwUHq1bmCdU9M=
MIME-Version: 1.0
Received: by 10.180.255.1 with SMTP id c1mr652903bki.36.1234516607963; Fri, 13 
	Feb 2009 01:16:47 -0800 (PST)
In-Reply-To: <57280.AFRWCldXDSo=.1234457874.squirrel@webmail.no-log.org>
References: <c384c5ea0902120746r2ff7a7f0o972e5e1d370fcbc5@mail.gmail.com>
	<57280.AFRWCldXDSo=.1234457874.squirrel@webmail.no-log.org>
Date: Fri, 13 Feb 2009 10:16:47 +0100
Message-ID: <c384c5ea0902130116v88b33acp6ffb6567c89026@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] OpenEmbedded name tags (for shows, events)
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
X-List-Received-Date: Fri, 13 Feb 2009 09:18:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Thu, Feb 12, 2009 at 5:57 PM, Denis <GNUtoo@no-log.org> wrote:
>>
>> I will create a executable C file that generates a PDF that you can
>> bring to the print shop to print 20-something name tags.
>> I will create this project inside the contrib/ folder.
>>
>> Also, I would like to add a file there containing well-known
>> developers and/or users, as an input file.
>> ...
>> Ideas/wishes/feedback?
>>
> There is a file in oe where there are the devellopers are listed.
> The file is called MAINTAINERS
>
Duh. Thanks for waking me up.

Regards,
-- 
Leon



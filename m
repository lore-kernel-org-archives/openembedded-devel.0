Return-Path: <gwt.scott@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 01FE06D433
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2013 16:23:06 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo20so1281924obc.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2013 08:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:from:in-reply-to:mime-version:date:message-id:subject:to
	:content-type; bh=vas24G3n87rSSEe3uAt3j7OdHXXmSA7lFyjPMOEOFYM=;
	b=hQfvdoqsmyN5U2tfpLlCrL6dI/1vwjAaxY3zByFYry5xzzL8dgKNTtHVasbpIJzW9X
	1aNB+t8rC3bYGmTomut54XQYcZa2LoNiUzwUBnrVqhhO+2M3Ihh5JZlJ76/MTRxmeknZ
	B2u4PwP5JJZtLyNfA4t7ikleFNUUBYJWPXHapN8KV7E1Vjsn3m2+ihCbn+M0e9miklfH
	qNwa6xkCMbEF2d7efdeyrxWbIj+Ve5OFPM1bVLALOhlOyU/HCnh9n0CqUBq+OMTfWyBl
	NZacidZpUXcG4x5mZ1AOfIwFWDOuNMiU3/m1XkV8iF/b78tn2h/uR44eQ41edLt3yxPf
	jI1w==
X-Received: by 10.182.142.37 with SMTP id rt5mr174428obb.76.1384705388159;
	Sun, 17 Nov 2013 08:23:08 -0800 (PST)
References: <CAOXsvCQhMLr+U=FOmoeSW_yWoMfnMA7VReKKhNuwfDTf1a868Q@mail.gmail.com>
	<5285EEE4.4070208@communistcode.co.uk>
From: Scott Penner <gwt.scott@gmail.com>
In-Reply-To: <5285EEE4.4070208@communistcode.co.uk>
Mime-Version: 1.0 (1.0)
Date: Sun, 17 Nov 2013 09:23:04 -0700
Message-ID: <5837624278552957107@unknownmsgid>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: How to add PHP
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
X-List-Received-Date: Sun, 17 Nov 2013 16:23:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Jack, thanks for the reply!
 I am looking for modphp, which is in the webserver directory and I
have tried adding that package but the build fails. I've added the
apache webserver with success and took the same approach for adding
modphp. Which log files can I send? My learning is still curving :/

Thanks,

Scott Penner

Goodwell Inc.
c. 4033761977
a. Box 906 Brooks, Ab T1R1B8

> On Nov 15, 2013, at 2:52 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>
>> On 15/11/13 05:58, Scott Penner wrote:
>> Hi and thanks for this resource,
>>
>> I am trying to add PHP to my image and cannot!
>> I've tried a few different attempts, sort of documented
>> here<https://community.freescale.com/message/359851#359851>
>> Its for a imx6sabrelite board and I'm trying to modify the fsl-image-test
>> image.
>> I can add the apache server, and it works, but get errors during the bake
>> when adding PHP.
>> Should I be using the PHP packages in the webserver directory or devtools
>> directory?
>> Do you have any working examples of a lamp install or just apache/PHP
>> install procedure?
>>
>> Thanks for any insight,
>>
>> Scott Penner
>
> Hi Scott,
>
> There should only be one location for PHP, or are you getting PHP and
> mod-php mixed up? If so, you should read up on what the differences are
> and decide which one you need.
>
> Secondly, we can't help without error logs :)
>
> Cheers,
>
> --
>  Jack Mitchell (jack@embed.me.uk)
>  Embedded Systems Engineer
>  Cambridgeshire, UK
>  http://www.embed.me.uk
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


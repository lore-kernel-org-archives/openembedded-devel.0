Return-Path: <gwt.scott@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id DCD4D6D7D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 05:57:59 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi5so2017861wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 21:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=7mcnel8Ah1z06iZEcc3392I9yQlLk74KtP/1mDfMyB8=;
	b=g6nM+HS2KRWtTCcZsI3tTYMhIb0VPDa18CRC+InOjVUZDOhXHPS7WX3eiGCAYdD+qN
	Xd9tn4S46eAPl8Ia/vC+fyNq28oMLZFSVqSKYmAkgA79uBKwYDSeZ1Ix0oszzZ7CUo92
	uGmaXfVit7L8MI78VTpfWgEoLp+5IEauaLC4SByIXn0Dc6gssQtGFVO9OzJhxnoD+cyC
	S0fw13xAtyzNMS5uRDogL0mjwUrNO2mD/Iuti3pO3tB0zF6eTQoGUYLrXzdH5M+GE6Yq
	cRZ0pBv2c+KZ8RXXpYMQT8mpF53gs6xaUqrHH5RinOUKDyaDTfZQEhggYm9MRcgcqJWE
	1xCQ==
MIME-Version: 1.0
X-Received: by 10.180.86.102 with SMTP id o6mr5937543wiz.30.1384495081228;
	Thu, 14 Nov 2013 21:58:01 -0800 (PST)
Received: by 10.194.76.10 with HTTP; Thu, 14 Nov 2013 21:58:00 -0800 (PST)
Date: Thu, 14 Nov 2013 22:58:00 -0700
Message-ID: <CAOXsvCQhMLr+U=FOmoeSW_yWoMfnMA7VReKKhNuwfDTf1a868Q@mail.gmail.com>
From: Scott Penner <gwt.scott@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: How to add PHP
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
X-List-Received-Date: Fri, 15 Nov 2013 05:58:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi and thanks for this resource,

I am trying to add PHP to my image and cannot!
I've tried a few different attempts, sort of documented
here<https://community.freescale.com/message/359851#359851>
Its for a imx6sabrelite board and I'm trying to modify the fsl-image-test
image.
I can add the apache server, and it works, but get errors during the bake
when adding PHP.
Should I be using the PHP packages in the webserver directory or devtools
directory?
Do you have any working examples of a lamp install or just apache/PHP
install procedure?

Thanks for any insight,

Scott Penner


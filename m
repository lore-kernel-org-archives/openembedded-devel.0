Return-Path: <net147@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8932C73231
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2015 15:18:35 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so54092482qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jul 2015 08:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:from:mime-version:in-reply-to:date:message-id:subject:to
	:content-type; bh=T06K3VfbYlW+TSkwcCouZqY/Zxvg/Fj9XEkyNobZ7Fc=;
	b=NJIBMYXunUzimg05gvHJhMvSP2irLntNfFgT9K1cGQIhsvVgRWnq7XYllD2Fo7ZXfU
	S53HNBY6Fr/9n5Cof+gc+5qO6BG7NSNrgKHzUwdjC6ZMNeOvE/RujRgVgLT9Rx/NMAUA
	fJ4GD6ehazbcQ+ty9ESpaSgBS/qUzYXJZZ6B8+YMFTCVIwccRdoaZyLx1H7eblYZnw8X
	I+ZrjYcw2t8+EMZvVf3MXAGv3K5aae98vtoVu2Un3sazC+viNAXSbM/jCi3irtqxl5/m
	T4zJTaA02nYFCXoecQBMoqlSGCAFXBsQVid7aUrEx/YJlpcpfoLnt/29WCjLs4qNygKw
	J6DQ==
X-Received: by 10.140.129.130 with SMTP id 124mr22373593qhb.28.1435850315837; 
	Thu, 02 Jul 2015 08:18:35 -0700 (PDT)
References: <1435741531-30306-1-git-send-email-net147@gmail.com>
	<5593B688.4070304@opendreambox.org> <20150701131955.GH2409@jama>
	<5593EFFF.4060502@gmail.com>
	<CAGrhNMzBoRf=bpSk4nerdBHemCET8bVgMYtc6SLR5fGOdKUHWQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <CAGrhNMzBoRf=bpSk4nerdBHemCET8bVgMYtc6SLR5fGOdKUHWQ@mail.gmail.com>
Date: Fri, 3 Jul 2015 01:18:39 +1000
Message-ID: <-3219499316589280773@unknownmsgid>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] libconnman-qt5: new recipe
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
X-List-Received-Date: Thu, 02 Jul 2015 15:18:39 -0000
Content-Type: text/plain; charset=UTF-8

Hi Felipe,

> On 2 Jul 2015, at 9:46 pm, Felipe Tonello <eu@felipetonello.com> wrote:
>
> Hi Jonathan,
>
> On Wed, Jul 1, 2015 at 2:49 PM, Jonathan Liu <net147@gmail.com> wrote:
>
> [...]
>
>>
>> I have successfully tested building the recipe with an application that
>> depends on libconnman-qt5 using both the C++ and QML bindings and using it
>> on the target device.
>
> Did the SDK worked as well?

Yes. I tested building application using SDK on another machine as well.

Regards,
Jonathan


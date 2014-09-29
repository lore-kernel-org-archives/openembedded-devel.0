Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id B60F2605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 15:16:21 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id f73so1734887yha.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=4J7TvLoQOXiwsJSRdSJMgfVjXqWgi7NWh1GM1aJ4d7Y=;
	b=i+k8abDFeNaBybob/49GWtqGMevIP6nECLLNC8xczM6BYKW6w9Bf2AizYsMFWGCewY
	PMk/6WWDd7GhhrASoy5sf87/jNy9cR0OKrZ2jBGs33LQp0/CU57UG/nwBKk3kyvgS21O
	zFBRWnN5ffZFhowJRdKOtusoVG5BrN0NpQx1/3iVmgyqn8UEdiWBil5yyxh6qCSOa1Ff
	uk4AoMvtM6aCHmffIUTLjU3XrWJ0/72AW2dW45EHHEpcq01VRFATTISXvDOy0WDy5Ew9
	cACc3owItBZqqrE8dgrojsCj/qRfAp/I9gFC1lzS+WI+RvAUfu93WijPmIf85AoVio37
	oEBQ==
MIME-Version: 1.0
X-Received: by 10.236.127.140 with SMTP id d12mr59506226yhi.37.1412003782694; 
	Mon, 29 Sep 2014 08:16:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Mon, 29 Sep 2014 08:16:22 -0700 (PDT)
In-Reply-To: <m2y4t4f7fl.fsf@gmail.com>
References: <1411881077-86222-1-git-send-email-coldnew.tw@gmail.com>
	<20140928054750.GQ25706@jama> <m2y4t4f7fl.fsf@gmail.com>
Date: Mon, 29 Sep 2014 12:16:22 -0300
X-Google-Sender-Auth: 1_zeUWtt990L5Yg2ZkNnbTlaXPk
Message-ID: <CAP9ODKpSRCE5b_q0a_P2UNqp0AkiZYZezsJE7Z6C6G0g-2wisA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2] qt5: Add Qt 5.3.2 packages
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
X-List-Received-Date: Mon, 29 Sep 2014 15:16:25 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 28, 2014 at 5:55 AM, Yen-Chin Lee <coldnew.tw@gmail.com> wrote:
>
> Martin Jansa writes:
>
>> On Sun, Sep 28, 2014 at 01:11:17PM +0800, Yen-Chin Lee wrote:
>>> Qt 5.3.2 has been released in September 16th, 2014.
>>>
>>> We still keep QT_VERSION to 5.3.1, if users want to upgrade to QT 5.3.2
>>> they should modified the QT_VERSION variable on their own.
>>>
>>
>> I would remove the 5.3.1 version (and _git recipes will later be used
>> for 5.4)
>
> Wow! That's great news! Actually I also want to test the Qt 5.4 version,
> it's nice if we can has Qt 5.4 git support soon.

So could you rework the patches to upgrade the 5.3.1 recipes to 5.3.2 ones?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


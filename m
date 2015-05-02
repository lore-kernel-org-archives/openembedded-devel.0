Return-Path: <switesh.fulpagare@mindastoneridge.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 45C8760024
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 May 2015 11:44:13 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so115601685pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 May 2015 04:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
	:message-id:mime-version:content-type:thread-index:content-language;
	bh=y23ED8W5Cg5gRSLnUZrDy6gYHjlkgqKKXZhRFy/4IOg=;
	b=CN3gcipgf5y0TVDN8K/DivaV+dt+9MB+yMBLHaTDZu/78h7B2qkholdeXM4FI6w2KV
	1S+gS9vy7/BBrmWh/hnzV43tgd9wg3YeJQniaf12JNExHq7V5SKjVdy/Q2cDmRP1Y31X
	ML5SYBXUYdmswD4T9wr+GqOVC7L206PVzLqwToXnik1TMmYYXzj79WdlpLC2t9Bv8lrZ
	eyalSjsFLxhdK2m77niw5P1qomU9T1alaVDORDOUARJa3M2ET7GAotK7sRYC2VkT0m1x
	bvToHHuVknEHkVPHWLslnvK76eW4q7bkWzIxt4zmpmRZgxbEWcvAxepEwhNjbpvpgiP1
	R4Iw==
X-Gm-Message-State: ALoCoQnX8JO+kcGq0wHTTwgw8Me2ettPgFhjiCBbefzc8127qgSuA+6uAh9HJrj1J6Pz9m6jpwj6
X-Received: by 10.70.42.104 with SMTP id n8mr25861284pdl.88.1430567055109;
	Sat, 02 May 2015 04:44:15 -0700 (PDT)
Received: from Minda ([114.143.135.194])
	by mx.google.com with ESMTPSA id w15sm4288447pbs.12.2015.05.02.04.44.12
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 02 May 2015 04:44:13 -0700 (PDT)
From: "Switesh Fulpagare" <switesh.fulpagare@mindastoneridge.com>
To: <openembedded-devel@lists.openembedded.org>
References: <CALRGHr9GkKB59wiw8Csqiic2gAE+CVxr_AXAXREF5jUbKGVotA@mail.gmail.com>
In-Reply-To: <CALRGHr9GkKB59wiw8Csqiic2gAE+CVxr_AXAXREF5jUbKGVotA@mail.gmail.com>
Date: Sat, 2 May 2015 17:14:06 +0530
Message-ID: <002901d084cd$4e5a5790$eb0f06b0$@mindastoneridge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQFbzf7OMTgu8WY3WUmBmprAJc+xEJ5R/iyw
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: 'Sandeep Gound' <sandeepg@mindastoneridge.com>
Subject: Re: Gstreamer error for Qt camera code
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
X-List-Received-Date: Sat, 02 May 2015 11:44:16 -0000
Content-Type: multipart/related;
	boundary="----=_NextPart_000_002A_01D084FB.6813A500"
Content-Language: en-us

------=_NextPart_000_002A_01D084FB.6813A500
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Guys waiting for reply.

=20

switesh fulpagare

=20

From: Switesh Fulpagare [mailto:switesh.fulpagare@mindastoneridge.com]=20
Sent: Thursday, April 30, 2015 11:48 AM
To: openembedded-devel@lists.openembedded.org
Cc: Sandeep Gound
Subject: Gstreamer error for Qt camera code

=20

Hi ,

=20

I  ran into error while testing qtcamera example code on Qt 5.2.1 =
http://pastebin.com/WbenK54H. I'm using yocto daisy-1.6.1 .

=20

Am I missing something in .conf file?

=20

- Switesh F.


------=_NextPart_000_002A_01D084FB.6813A500--

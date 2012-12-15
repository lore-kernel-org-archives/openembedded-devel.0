Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tji4H-0004v9-HU
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2012 04:05:37 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so6724770ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 18:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qmfIO+9Kh/zWZukXvx0a9shznzhs1oqhPsFqSF2zgaQ=;
	b=XKhVyys85tkSrwX1maUj4/mm1oq0i1pjB3uqBjuC618S44YJnpvoyNJUqVSTydiAFg
	fju1bY3PaaDa/IS1ln5HLpKxeTB9hkTkxwuJ9T3Jc74h9i9LlEtsBm5CbAVfIilsdEFS
	gjd9OGJyXp8RNnwdQjcFy4OtqTSp2dPJQ8FGerfj08jic52vqCPmggXsYY0FWN34bKy8
	5CIC7/Tu34wjLUGHDJysbfMgLQPSCc4PyGl70avENCld4LOU1KRv1jVgZXzdLuqnu6qr
	hNs1EXZTGgr+GBnM7CW1QTDP1zzOlWmwk0KKQ4pd4FkwN1EhNgmu8EOHAvurZRNOcN0n
	bvXA==
MIME-Version: 1.0
Received: by 10.50.173.106 with SMTP id bj10mr3644136igc.13.1355539859962;
	Fri, 14 Dec 2012 18:50:59 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Fri, 14 Dec 2012 18:50:59 -0800 (PST)
In-Reply-To: <1355428955-18601-2-git-send-email-cazfi74@gmail.com>
References: <1355428955-18601-1-git-send-email-cazfi74@gmail.com>
	<1355428955-18601-2-git-send-email-cazfi74@gmail.com>
Date: Sat, 15 Dec 2012 04:50:59 +0200
Message-ID: <CAF6bG8cU-_0t=O08DX2jSeZmXB0yFBLDv9GcU8NoKQ5xU5u=4Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libsdl-image: update to upstream version 1.2.12
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
X-List-Received-Date: Sat, 15 Dec 2012 03:05:37 -0000
Content-Type: text/plain; charset=UTF-8

On 13 December 2012 22:02, Marko Lindqvist <cazfi74@gmail.com> wrote:
> SDL_image now has license of its own.

 According to homepage it's actually zlib license. I'll make updated patch.


 - ML



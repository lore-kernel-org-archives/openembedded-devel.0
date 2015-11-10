Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 92BB274197
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 22:51:52 +0000 (UTC)
Received: by iody8 with SMTP id y8so17491137iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gfM1zJga0ToYDo6S3ebvkQiU2sZ57bWGWnL43XTWdeI=;
	b=NNP863duKaX/jsERd+q/gmA9+HbvLM1hhvpvC3WzKfRWeNYuakkNyj9sQJbE82QLLt
	k6S5eg9jpYhZf9GJqtAkgDP46MbKOHmUjW1A8vD1pEyswGCYv0lK0ew/dGxjzQxmQ/QZ
	3WXdDysSgCoFdGMuQoj1OankduYz1KxfLZn6qqu36jzNEjpbO2FLHVCzCplxMTC5ile+
	v0GB0ItEETwXNDzlDa//K/eVQd/QfYYhnIO1xSHeHpaaiseONwRNWZXPJLhOEmncm6OZ
	ziqD7oi9Su7BoldxXD0+y9h9IJuW7D5Jth3FNmYvlrEj8FIXWHiwAO1PAOFWuygn1EGL
	Y5Rw==
MIME-Version: 1.0
X-Received: by 10.107.3.144 with SMTP id e16mr3374671ioi.99.1447195912379;
	Tue, 10 Nov 2015 14:51:52 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Tue, 10 Nov 2015 14:51:52 -0800 (PST)
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Date: Tue, 10 Nov 2015 23:51:52 +0100
Message-ID: <CALbNGRQRT-3tUNpD4+8masD2Xe0VoY8oeQ_cpMRnFbog3SPThg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 00/17] network/modemmanager updates
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
X-List-Received-Date: Tue, 10 Nov 2015 22:51:56 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 10, 2015 at 10:49 PM, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
I like this series :)

Andreas


Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 365B86D134
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 12:17:56 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id tp5so6104342ieb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=xGGfve9pIWpRZSzYU5Am9cRd868Rq6SZT9DrZfSVWQI=;
	b=RgDWLaAiPl3Wb03yyDQcp5LVgr2ha9z7sTfOFeKTORYSTsUOnz/8WtAQuNTEsYhPDu
	wZOHDK2AMLjOnSY+mil3kbOzXCy/ok0v4YIe5W2sv2EiOFwJZe7EwSIu8j/4fyixqgxX
	dx1XkVqcUppJdCHQvkFIOdZaZ5p5ByFSeLHkbdfV/IvMg4XAAQjOkfgYOBa1rq03ClXo
	hU/u7ymasHrfO6UtOkqPUBWWF9Kd2ruag34SsJ+oXklT9sR/HiXv+CnjxOtrNT9QlDUr
	ZMwKk5hxS/gFCLwQ57inktV/KwX/FPI0ZGDhSG3xlCfwvSBlyLR8KJqiaKHrl0Fn6kUu
	9Wfw==
X-Received: by 10.43.58.141 with SMTP id wk13mr4971135icb.1.1382703478052;
	Fri, 25 Oct 2013 05:17:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Fri, 25 Oct 2013 05:17:27 -0700 (PDT)
In-Reply-To: <1382621973-3677-1-git-send-email-kristofer.hansson-aspman@pelagicore.com>
References: <1382621973-3677-1-git-send-email-kristofer.hansson-aspman@pelagicore.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2013 05:17:27 -0700
Message-ID: <CAMKF1soRuXE=nkPXQBx-u9fLOwciFQcYS8-n3BiR6crysZP53w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtconnectivity: Added recipe.
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
X-List-Received-Date: Fri, 25 Oct 2013 12:17:56 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 24, 2013 at 6:39 AM, Kristofer Hansson Aspman
<kristofer.hansson-aspman@pelagicore.com> wrote:
> +require ${PN}.inc

may be its better to use BPN here


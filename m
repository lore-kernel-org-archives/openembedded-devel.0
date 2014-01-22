Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id C381460017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:26:47 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id l6so492876oag.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=W7iOc2FT5Ip8XpB2D57JCuwlE9D1QJuNl5uBgbQ2Gjw=;
	b=u7KIkxMelmv3AAk6aeVKQBljHo1/ArnbBLkrje1Ro1f0EqiYArmYcaQgYG8ikMwkJC
	K3tzktEHDTSO2wDG6Ktq5gQ8obIwfyVBIARjZ4NLMzJZLKbNuXlimu6rDXkbMuNKqK/4
	UlIKYh+tWipk9Y4Fpj9qiv7BCKN6OjA73lbWrEn1F+uJz3RAUpY6L6b74TEF2gbV+jSX
	3Iy+sEORjOy6SdLqM7SiRbAVgRaKLukbbD41KW7g90P/gcJ7QKKyvqY1MfQvuq+1ar+c
	t4umeRPLkw8ClpAEe8VW9gkY6SqpbZ0JXZtsIfLoQYBratw79xsGUNaXbvcmryjwkxpq
	TIXA==
MIME-Version: 1.0
X-Received: by 10.182.114.132 with SMTP id jg4mr1481783obb.29.1390400808573;
	Wed, 22 Jan 2014 06:26:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:26:48 -0800 (PST)
In-Reply-To: <1390239757-27055-2-git-send-email-Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
	<1390239757-27055-1-git-send-email-Martin.Jansa@gmail.com>
	<1390239757-27055-2-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 22 Jan 2014 12:26:48 -0200
X-Google-Sender-Auth: ChbIhypE1cohX0Q5Rr7LYyfeVyc
Message-ID: <CAP9ODKrOWFyLn-JRDpC-K+ewEQws+yVB8N79mC+h3esE6uP_dg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/4] efl: Adjust packaging to match more with old 1.7 separate recipes
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
X-List-Received-Date: Wed, 22 Jan 2014 14:26:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 20, 2014 at 3:42 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * it improves upgrade-path, it's not perfect and I was testing it only on
>   my SHR images which include lot of efl stuff, but not all, so some packages
>   can still be a bit different
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

Gosh, this is ugly ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


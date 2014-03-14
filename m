Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 602786F564
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 13:18:42 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id c41so2476084yho.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=MwVmLWJVARmUmU6hi9QNaLlJrhBa/uruCrg2ssfG+lk=;
	b=b3/o8fHMLDRuOy+QrBeoWjZSn7QHL6Tox4tq8NPL5aBjdGQ6ZOqpc91RDkZo+aLQmm
	EJW8/+/hMoc3qUA6KOXLl9VeNmlh9R4okcWvWmF+GcKV6C0GpFJZmdYnJh3QczEll3NQ
	c3vFJeHgumvFEN9RRZnsPQQ+r+n8ts1Q3gFBzf8088ms6D7DyghdUfV8DIXX1PR3P37J
	QUCFTP+WvkD/FAbmyfsWgaCf/ZGLIjXfSHIY08hopgmiHDMmOdihm5Y6GOliEosMjkeW
	YQVInFGCt8S2U9EjK5FQQMFcGSYONLvlecYqURd4RcYNiiUExWIzo4QpYLNnADyUKnkq
	nklg==
MIME-Version: 1.0
X-Received: by 10.236.60.68 with SMTP id t44mr10678089yhc.47.1394803123509;
	Fri, 14 Mar 2014 06:18:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 14 Mar 2014 06:18:43 -0700 (PDT)
In-Reply-To: <1394792627-7361-1-git-send-email-raj.khem@gmail.com>
References: <1394792627-7361-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 14 Mar 2014 10:18:43 -0300
X-Google-Sender-Auth: RC-Zm5m8tM5RcP6bE2kc5PIDRN4
Message-ID: <CAP9ODKqQ4_pzHEJsQgo-8hLLqskUGWmGv11jkzqUYjMgzRw6ZQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] licenses: Fix WARNING: qt3d: No generic license file exists for: PREVIEW.COMMERCIAL in any provider
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
X-List-Received-Date: Fri, 14 Mar 2014 13:18:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 14, 2014 at 7:23 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Provide the license text and instructions on how to include
> it when using meta-qt5 layer
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This could be added to the layer.conf so user does not need to do it manually.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


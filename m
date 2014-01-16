Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 08CD36C9B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 23:35:15 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id i7so1505795oag.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 15:35:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=Yx0CswP8tgpLxejRqtk9lmrYXZwRwwWvrjvzc7A5lGc=;
	b=g4tlBDuKIgyWIMaRecdPgdsCLWiyx1y1IFK483Lpyqs/eEwamkRpCIOiO4PS2smvKb
	gdWklg5N1dwoPo7jK+QpSt8qUzKQpG/oNzqifgUdU4hXVeessh6MtMtlIvg1/vrHUoGH
	4dDslQYRZXncQbkSKTPDZWccHB5YXRa8nfT5TWBg/EqVSrkruOMaGEqKZbZ7eiQsA6hN
	Qr6vjGZJqsUmEOlFiv0alS86QRR2iO/5tRPLFNQpmfoF1nbMLL78o6wP+QAYVLgrGYku
	+1Ri1UrQes/Thhnn2NcuwdSc9gD/IQa8vLCElbDi2YgFFr1yOpskneTIREoD09WL2q20
	IGlA==
X-Gm-Message-State: ALoCoQkyxcZKVFA29ne+HEQhIXBbbf7qk2sWSiUSPaPt+4q5j8Ct/3I0fzJtiUUqUC8c/ayi8Z0q
X-Received: by 10.182.65.36 with SMTP id u4mr9391174obs.31.1389915316698; Thu,
	16 Jan 2014 15:35:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.84.233 with HTTP; Thu, 16 Jan 2014 15:34:56 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 17 Jan 2014 00:34:56 +0100
Message-ID: <CAP71WjydArvSEYRdK0NRWs5tTS_KuYBjZena8nas9eE0tHbv6g@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: qt5 and virtualbox
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
X-List-Received-Date: Thu, 16 Jan 2014 23:35:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi there,

has anyone be able to run qt5 applications in virtualbox or qemu? if
so, what build configuration was used: xcb? eglfs?

When running a 'desktop' distro in VirtualBox we can enable adds-on to
get some support for acceleration, iirc with proper X11 video drivers.
can that be used to run Qt5 application built with OE too?

any detail/instructions publicly available which I might have missed?

thanks

nicolas


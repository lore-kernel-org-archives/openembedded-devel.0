Return-Path: <ryanelkholy@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 59910700EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 22:22:22 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id m9so104024893ige.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2016 15:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=nQbDT2otrHinbMlG5PdrRqK4r5KBq6f4aGlTAQv5pZA=;
	b=wO/WrfWeynryv99C/wYwkR0C/o0kaAXq2JQHXH+ISZDfrX2dDhFkBBQ0r7z3xJtUh1
	0DmcRnG6Pzsap0kIillDL0SdkjnIj+PNM7mLTGGNnUJUcw/xTOsYNziAwR+4zY/OU2y3
	7rZyfj5viWj2SLMGLhGca6Mex6GL6GuW5M8nM5pjKPZPDqQFr7slu/4kcQRpLa/T4o2G
	WrV15i1Z8Qo2JE2259nPlbWylCVKoj7FuWz0Z3wB8Oo2RWRnE80yFKpU3rmEeEncSPdE
	K5x83BtcrpwNTUEDy65NNgkExNHtD388GxXorvu91PRu7jpc4sHhZ2Ep/ddpzL/yG//9
	4NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=nQbDT2otrHinbMlG5PdrRqK4r5KBq6f4aGlTAQv5pZA=;
	b=GH2kPVJdtLlUPVuhsbdiwAKkJgLJmrwvu5f3p1nRJ6Jrq5P67ZrNpFjDt4xE1O+/t9
	GeClfNCV0Iac5ESlcSf+6KmLhGsRkuFk4GQ+GZMLCQKSbtm6EW/VL+FDfCwAi/tP63PJ
	VRxAH3STlsqdI7bYSH4WiMhlsEDHYoTZ3NwKhL0QLOjfagSn6kqgKZD1hsD7Tl1LeJpg
	1WVlA72983DaCLQfT7QfCSMrLwJNQxmbHGYEUEJJnVij5h0bRWmEJjS1cWJfNJc4bz+c
	f51Jkil17iu6JQ9o7JNpidVzYXYN8U6XR68AkszHgXMtL5Leu+lKnrjVnc9zUqOC/VKV
	lVxA==
X-Gm-Message-State: AOPr4FXg1rAusiPuSWVjquNxN3MxNW87yJ+p8vWp0F4xeIAIdPrR2/nyiP6FO0vFcKI7cWIaB2gTMskaJPhJAw==
MIME-Version: 1.0
X-Received: by 10.50.32.102 with SMTP id h6mr13222077igi.16.1462832543187;
	Mon, 09 May 2016 15:22:23 -0700 (PDT)
Received: by 10.64.115.35 with HTTP; Mon, 9 May 2016 15:22:23 -0700 (PDT)
Date: Mon, 9 May 2016 18:22:23 -0400
Message-ID: <CAMZfsd5zyDwT7O_c_ofcOkKRH_tVs3rUaHQaadmJTDvDGG5DAA@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] How to remove Weston toolbar?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2016 22:22:24 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I am trying to figure out how to remove the Weston toolbar. I would also
like to customize other aspects of Weston, however I am not seeing any
weston.ini file that I can use for customization.

Has anyone been able to remove the toolbar or implement a weston.ini for
other such customizations? If so, what was the process to create it and
include it within your image?

Thanks,
Ryan


Return-Path: <miralipoor.meysam@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id D52207147D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 12:50:36 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so4716946wid.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 04:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/Jdnkbs+0//ZidSMeOA6Zx9O0v26e2PLv+Pc981bR9E=;
	b=PaGXLm4ubKJOERPcy0PC07jW79h+hKjZlnq5TWlTk9ZbCacceIATmi0qvE/9avEUng
	JqPOyeBcVQVvudgNqywn5OOQyIlSsu5oI6VPrPfvDHT9J5GL2tLyIiNPqvSTiCsCJqQR
	2oYk5Z4abBBeKI+GCqV+Ie6QO5TmfiVfbbIwCtu90le5LrTuUy9fcaeplj85NLnhgjVa
	iNrsiMfZIw8XVB/nraOqDfuSDDOz0Lnf3J0BIuXkFXqgUU8vY1U3Qza6pcPqdvtdPRKE
	LHbdHjMuW9GourfWkrD5NvK+94IQWxe4Cn1COrPlBiz1T1Z6sqslL1WXUIESIfvonh0F
	QEbg==
MIME-Version: 1.0
X-Received: by 10.181.13.42 with SMTP id ev10mr5589400wid.78.1422363036632;
	Tue, 27 Jan 2015 04:50:36 -0800 (PST)
Received: by 10.217.87.198 with HTTP; Tue, 27 Jan 2015 04:50:36 -0800 (PST)
Date: Tue, 27 Jan 2015 16:20:36 +0330
Message-ID: <CAH+2B08XWEdBpwQgZ09pSmimHS0NRhPRMJ6gjRnFRgCHvh+UXQ@mail.gmail.com>
From: Meysam Miralipoor <miralipoor.meysam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: error in do-compile in VLC recipe
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
X-List-Received-Date: Tue, 27 Jan 2015 12:50:38 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
I am totally feel confused when i could not compile VLC by bitbake. It
seems there are several patch that must be applied on both recipe and
sources. Unfortunately i doesn't have any experiences in patching of
source or recipe , In other hand i don't know how to verify my current
existed source in order to find out is it suitable for patching or
not.Please help i really stuck in this situation.Any help appreciated.
With best wishes


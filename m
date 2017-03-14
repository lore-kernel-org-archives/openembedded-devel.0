Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 809F477734
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 15:36:32 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id z15so56089725lfd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 08:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tJ0AYBXpBpLQcpQqULvFMjbT2ualEItiDD9Z2jOJ2h4=;
	b=NmyvmOnaqu4LZhhiQ5jtfSDQ/1chG3wwjenHrr+b0cerNd/QoscrdFCDtTuLC6kpZN
	5D3bLlXi02qrR/cak17Qf+7KReFruuYbvNDO51QG6KWfUGLilM1JbDHe9jy+7BOmzn/N
	8wAGSW/sijNN4WRhZ7yRmDxEGWPITlYLpwqtwrWttkL3t/6/rvcVW8uTMNJY09AJYTN2
	HsplA/Kfvblsqwp6xNlkhdMEEwnFRbBmq7ZZLgofjoBkrkzZHoJ23VDMn1cD8KoXviD/
	6Q8Tttk8lUErVyGLF9SLvIyTrZC6xlejCXGvdnhi15hVOQBMwo35HryQ0aPJyptNNRHi
	Bz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tJ0AYBXpBpLQcpQqULvFMjbT2ualEItiDD9Z2jOJ2h4=;
	b=J+vHdAIEcwtj3eypn/95Mj2c47pMOUC2pDSLX56jIaUqZA+vypwT/JWpNaXQnoE2Oc
	iaroyWme0dT2JOK8dQBsWuskmoYppRjHqOhCRuP8dqxD75Cf35rx1PwwAyt0923baLu1
	uz1k4cm4WYZV8sM9R1tjvi8fkn/JWthejGPjXNvDMvXnOEGwy4F9t4ofoIMdd3OeEjRP
	U8yPIFBPD4jRg6/UbEa3HVdFC4Q0nqQ4nmShPMtfNCq+Hq8MXHu6HX+GjrQQFB99+H4K
	0T+7Qr0E7C59xg/miS0VNZVRCFE4wOWLC7jDfisSNPspYUX7kwNauPIJUF267RJu4yuM
	h6Tw==
X-Gm-Message-State: AMke39kwOdyRK3RWi7f7TBAZ+RgRmFuqtSViuF+W14QbyoKqIeeHbDdyifNP4yU+5s5mIITs
X-Received: by 10.25.24.29 with SMTP id o29mr9014628lfi.113.1489505793420;
	Tue, 14 Mar 2017 08:36:33 -0700 (PDT)
Received: from gordanmarkus-XPS28 (static-212-247-53-108.cust.tele2.se.
	[212.247.53.108]) by smtp.googlemail.com with ESMTPSA id
	6sm2263247ljw.11.2017.03.14.08.36.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Mar 2017 08:36:32 -0700 (PDT)
Message-ID: <1489505792.23237.1.camel@pelagicore.com>
From: Gordan =?UTF-8?Q?Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Mar 2017 16:36:32 +0100
In-Reply-To: <20170222102510.13059-2-gordan.markus@pelagicore.com>
References: <20170222102510.13059-2-gordan.markus@pelagicore.com>
X-Mailer: Evolution 3.22.3-0ubuntu0.1 
Mime-Version: 1.0
Subject: Re: [meta-qt5][PATCH] qtwebengine: add commercial licence
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
X-List-Received-Date: Tue, 14 Mar 2017 15:36:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Bumping the topic. Has anyone had the time to review this patch? 

On Wed, 2017-02-22 at 11:25 +0100, Gordan Markuš wrote:
> Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
> ---
>  recipes-qt/qt5/qtwebengine_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-
> qt/qt5/qtwebengine_git.bb
> index 8e60d72..a4ee055 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "QtWebEngine combines the power of Chromium and Qt"
>  
>  # Read http://blog.qt.io/blog/2016/01/13/new-agreement-with-the-kde-
> free-qt-foundation/
> -LICENSE = "LGPL-3.0 & BSD & GPL-3.0 & The-Qt-Company-GPL-Exception-
> 1.0"
> +LICENSE = "BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-
> Qt-Company-Commercial ) & ( LGPL-3.0 | The-Qt-Company-Commercial )"
>  LIC_FILES_CHKSUM = " \
>      file://src/core/browser_context_qt.cpp;md5=b5193b7d68699260f3b40
> b201365c8d2;beginline=1;endline=38 \
>      file://src/3rdparty/chromium/LICENSE;md5=0fca02217a5d49a14dfe2d1
> 1837bb34d \

